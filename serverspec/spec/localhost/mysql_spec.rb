require 'rubygems'
require 'spec_helper'

# MySQL Yum
# i:rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el6-8.noarch.rpm
describe package('mysql57-community-release') do
  it { should be_installed }
end

# MySQL 5.7
# i:yum install mysql-community-server mysql-utilities mysql-community-client mysql-community-devel
describe package('mysql-community-client') do
  it { should be_installed }
end

describe package('mysql-community-libs') do
  it { should be_installed }
end

describe package('mysql-community-server') do
  it { should be_installed }
end

describe package('mysql-community-devel') do
  it { should be_installed }
end

# i:service mysqld stop
# i:chkconfig mysqld off
describe service('mysqld') do
  it { should_not be_enabled }
  it { should_not be_running }
end
