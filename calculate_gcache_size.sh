#!/bin/bash
# Calculate the required gcache_size in a Galera cluster
# https://galeracluster.com/library/kb/customizing-gcache-size.html

first_timestamp=$(date +%s)
first_recv_data=$(mysql -e "SHOW STATUS LIKE 'wsrep_received_bytes'\G" | grep Value | awk '{print($2)}')

echo "${first_timestamp} s => ${first_recv_data} b"
echo "Waiting 60 seconds to get another measurement of received bytes..."
sleep 60

second_timestamp=$(date +%s)
second_recv_data=$(mysql -e "SHOW STATUS LIKE 'wsrep_received_bytes'\G" | grep Value | awk '{print($2)}')

echo "${second_timestamp} s => ${second_recv_data} b"

transfered_data=$((second_recv_data - first_recv_data))
elapsed_time=$((second_timestamp - first_timestamp))
write_rate=$((transfered_data / elapsed_time))

echo "Write rate: ${write_rate} b/s"

maintenance_window=7200 # seconds the cache remains valid. When the cluster shows a node as absent for a period of time less than this interval, the node can rejoin the cluster through an incremental state transfer. Node that remains absent for longer than this interval will likely require a full state snapshot transfer to rejoin the cluster.
cache_size=$(((write_rate * maintenance_window) / 1024))
echo "For 2 hours of maintenance window, you need a gcache_size of ${cache_size} kbytes"
