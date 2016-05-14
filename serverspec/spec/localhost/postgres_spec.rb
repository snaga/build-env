require 'rubygems'
require 'spec_helper'

# PostgreSQL Yum
# i:rpm -ivh http://yum.postgresql.org/9.0/redhat/rhel-6-x86_64/pgdg-redhat90-9.0-5.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.1/redhat/rhel-6-x86_64/pgdg-redhat91-9.1-5.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-redhat92-9.2-7.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.5/redhat/rhel-6-x86_64/pgdg-redhat95-9.5-2.noarch.rpm
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

describe package('pgdg-redhat95') do
  it { should be_installed }
end

# PostgreSQL 9.4
# i:yum install -y postgresql94 postgresql94-contrib postgresql94-devel postgresql94-libs postgresql94-plperl postgresql94-plpython postgresql94-server
describe package('postgresql94') do
  it { should be_installed }
end

describe package('postgresql94-contrib') do
  it { should be_installed }
end

describe package('postgresql94-devel') do
  it { should be_installed }
end

describe package('postgresql94-libs') do
  it { should be_installed }
end

describe package('postgresql94-plperl') do
  it { should be_installed }
end

describe package('postgresql94-plpython') do
  it { should be_installed }
end

describe package('postgresql94-server') do
  it { should be_installed }
end

# i:service postgresql-9.4 start
# i:chkconfig postgresql-9.4 on
describe service('postgresql-9.4') do
  it { should_not be_enabled }
  it { should_not be_running }
end

# PostgreSQL 9.5
# i:yum install -y postgresql95 postgresql95-contrib postgresql95-devel postgresql95-libs postgresql95-plperl postgresql95-plpython postgresql95-server
describe package('postgresql95') do
  it { should be_installed }
end

describe package('postgresql95-contrib') do
  it { should be_installed }
end

describe package('postgresql95-devel') do
  it { should be_installed }
end

describe package('postgresql95-libs') do
  it { should be_installed }
end

describe package('postgresql95-plperl') do
  it { should be_installed }
end

describe package('postgresql95-plpython') do
  it { should be_installed }
end

describe package('postgresql95-server') do
  it { should be_installed }
end

# i:service postgresql-9.5 start
# i:chkconfig postgresql-9.5 on
describe service('postgresql-9.5') do
  it { should be_enabled }
  it { should be_running }
end
