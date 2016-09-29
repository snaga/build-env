require 'rubygems'
require 'spec_helper'

# RPM packages
# i:yum install -y httpd
describe package('httpd') do
  it { should be_installed }
end

# robots.txt
# i:vi /var/www/html/robots.txt
# User-agent: *
# Disallow: /
describe file('/var/www/html/robots.txt') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'User-agent: *' }
  it { should contain 'Disallow: /' }
end

# HTTPD service
# i:service httpd start
# i:chkconfig httpd on
describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end
