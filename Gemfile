source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.3']

group :development, :test do
  gem 'rspec-puppet-facts',      :require => false
  gem 'rake',                    :require => false
  gem 'rspec',                   :require => false
  gem 'rspec-puppet',            :require => false
  gem 'json',                    :require => false
  gem 'puppet', puppetversion
  gem 'puppetlabs_spec_helper', '>= 0.1.0'
  gem 'puppet-lint', '>= 0.3.2'
  gem 'facter', '>= 1.7.0'

end
# vim:ft=ruby
