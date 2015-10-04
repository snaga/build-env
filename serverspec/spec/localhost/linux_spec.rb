require 'rubygems'
require 'spec_helper'

# Timezone
# cp /usr/share/zoneinfo/Japan /etc/localtime
describe file('/etc/localtime') do
  its(:md5sum) { should eq '9e165b3822e5923e4905ee1653a2f358' }
end

# RPM packages
# yum install -y emacs gcc git patch tcpdump wget
describe package('emacs') do
  it { should be_installed }
end

describe package('gcc') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end

describe package('patch') do
  it { should be_installed }
end

describe package('tcpdump') do
  it { should be_installed }
end

describe package('wget') do
  it { should be_installed }
end

describe package('ruby') do
  it { should be_installed }
end

describe package('rubygems') do
  it { should be_installed }
end

# EPEL
# rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
describe package('epel-release-6') do
  it { should be_installed }
end

# PostgreSQL Yum
# rpm -ivh http://yum.postgresql.org/9.0/redhat/rhel-6-x86_64/pgdg-redhat90-9.0-5.noarch.rpm
# rpm -ivh http://yum.postgresql.org/9.1/redhat/rhel-6-x86_64/pgdg-redhat91-9.1-5.noarch.rpm
# rpm -ivh http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-redhat92-9.2-7.noarch.rpm
# rpm -ivh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm
# rpm -ivh http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
describe package('pgdg-redhat90') do
  it { should be_installed }
end

describe package('pgdg-redhat91') do
  it { should be_installed }
end

describe package('pgdg-redhat92') do
  it { should be_installed }
end

describe package('pgdg-redhat93') do
  it { should be_installed }
end

describe package('pgdg-redhat94') do
  it { should be_installed }
end

# Gem files
# gem install net-ssh -v 2.9.2
# gem install serverspec
# gem install rake
describe package('net-ssh') do
  it { should be_installed.by('gem').with_version('2.9.2') }
end

describe package('serverspec') do
  it { should be_installed.by('gem') }
end

describe package('rake') do
  it { should be_installed.by('gem') }
end

# Python pip
# wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
# python get-pip.py
describe file('/usr/bin/pip') do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

# Sphinx
# pip install sphinx
describe file('/usr/bin/sphinx-quickstart') do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end
