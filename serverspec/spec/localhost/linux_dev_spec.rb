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

