Facter.add(:os_name_lc) do
  setcode do
      bad_os = Facter.value(:os)['name'].downcase
      case bad_os
      when /redhat/
      'almalinux'
     when /centos/
    'centos'
      else
       bad_os
    end
  end
end
