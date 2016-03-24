require 'rubygems'
require 'spec_helper'

# Timezone
# i:cp /usr/share/zoneinfo/Japan /etc/localtime
describe file('/etc/localtime') do
  its(:md5sum) { should eq '9e165b3822e5923e4905ee1653a2f358' }
end

# iptables
# i:iptables -F
# i:service iptables save
# i:service iptables restart
describe command('iptables -L') do
  its(:stdout) { should_not contain('^ACCEPT') }
  its(:stdout) { should_not contain('^REJECT') }
end

# SoftLayer APF (Advanced Policy Firewall)
# i:service apf stop
# i:chkconfig apf off
describe service('apf') do
  it { should_not be_enabled }
  it { should_not be_running }
end

# RPM packages
# i:yum install -y emacs git tcpdump wget ruby rubygems ftp unzip zip screen man-pages strace bind-utils
describe package('emacs') do
  it { should be_installed }
end

describe package('git') do
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

describe package('ftp') do
  it { should be_installed }
end

describe package('unzip') do
  it { should be_installed }
end

describe package('zip') do
  it { should be_installed }
end

describe package('screen') do
  it { should be_installed }
end

describe package('man-pages') do
  it { should be_installed }
end

describe package('strace') do
  it { should be_installed }
end

describe package('bind-utils') do
  it { should be_installed }
end

# EPEL
# i:rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
describe package('epel-release-6') do
  it { should be_installed }
end

# Gem files
# i:gem install net-ssh -v 2.9.2
# i:gem install serverspec
# i:gem install rake
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
# i:wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
# i:python get-pip.py
describe file('/usr/bin/pip') do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

# Sphinx
# i:pip install sphinx
describe file('/usr/bin/sphinx-quickstart') do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

# gmail-smtp
# yum install -y cyrus-sasl-plain
describe package('cyrus-sasl-plain') do
  it { should be_installed }
end

# i:pip install feedparser
describe file('/usr/lib/python2.6/site-packages/feedparser.py') do
  it { should be_file }
  it { should exist }
end

# i:yum install python-devel
describe package('python-devel') do
  it { should be_installed }
end

# -----------------------------------
# python readability
# -----------------------------------

# i:yum install libxml2-devel libxslt-devel
describe package('libxml2-devel') do
  it { should be_installed }
end

describe package('libxslt-devel') do
  it { should be_installed }
end

# i:pip install readability-lxml
describe file('/usr/lib/python2.6/site-packages/readability') do
  it { should be_directory }
  it { should exist }
end

# i:pip install html2text
describe file('/usr/lib/python2.6/site-packages/html2text') do
  it { should be_directory }
  it { should exist }
end

# -----------------------------------
# Github webhook
# https://github.com/snaga/github_webhook
# -----------------------------------
# i:pip install IPy
describe file('/usr/lib/python2.6/site-packages/IPy.py') do
  it { should be_file }
  it { should exist }
end

# -----------------------------------
# EnOcean USB serial
# -----------------------------------
# i:pip install importlib
describe file('/usr/lib/python2.6/site-packages/importlib') do
  it { should be_directory }
  it { should exist }
end

# i:pip install pyserial
describe file('/usr/lib/python2.6/site-packages/serial') do
  it { should be_directory }
  it { should exist }
end

