require 'rubygems'
require 'spec_helper'

# RPM packages
# i:yum install -y gcc patch ruby-devel rpmdevtools bzip2-devel
describe package('gcc') do
  it { should be_installed }
end

describe package('patch') do
  it { should be_installed }
end

describe package('ruby-devel') do
  it { should be_installed }
end

describe package('rpmdevtools') do
  it { should be_installed }
end

describe package('bzip2-devel') do
  it { should be_installed }
end

# Other dev related RPMS
# i:yum install -y bison flex dbm-devel openssl-devel readline-devel zlib-devel perf
describe package('bison') do
  it { should be_installed }
end

describe package('flex') do
  it { should be_installed }
end

describe package('gdbm-devel') do
  it { should be_installed }
end

describe package('openssl-devel') do
  it { should be_installed }
end

describe package('readline-devel') do
  it { should be_installed }
end

describe package('zlib-devel') do
  it { should be_installed }
end

describe package('perf') do
  it { should be_installed }
end

# i:yum install autoconf automake
describe package('autoconf') do
  it { should be_installed }
end

describe package('automake') do
  it { should be_installed }
end

# ---------------------------------
# Python stuff for dev
# ---------------------------------

# i:yum install python-devel
describe package('python-devel') do
  it { should be_installed }
end

# Sphinx
# i:pip install sphinx
describe file('/usr/bin/sphinx-quickstart') do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

# i:pip install feedparser
describe file('/usr/lib/python2.6/site-packages/feedparser.py') do
  it { should be_file }
  it { should exist }
end

# -----------------------------------
# git
# -----------------------------------
# i:sudo yum install -y perl-ExtUtils-MakeMaker gettext
# i:wget https://www.kernel.org/pub/software/scm/git/git-2.10.2.tar.gz
# i:tar zxf git-2.10.2.tar.gz
# i:cd git-2.10.2
# i:./configure --prefix=/usr/local
# i:make
# i:sudo make install
describe file('/usr/local/bin/git') do
  it { should be_file }
  it { should exist }
#  it { should be_executable }
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

