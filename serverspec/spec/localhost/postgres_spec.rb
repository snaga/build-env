require 'rubygems'
require 'spec_helper'

# PostgreSQL Yum
# i:rpm -ivh http://yum.postgresql.org/9.1/redhat/rhel-6-x86_64/pgdg-redhat91-9.1-5.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-redhat92-9.2-7.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-1.noarch.rpm
# i:rpm -ivh http://yum.postgresql.org/9.5/redhat/rhel-6-x86_64/pgdg-redhat95-9.5-2.noarch.rpm
# i:rpm -ivh https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-6-x86_64/pgdg-centos96-9.6-3.noarch.rpm
# i:rpm -ivh https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
#describe package('pgdg-redhat91') do
#  it { should be_installed }
#end

#describe package('pgdg-redhat92') do
#  it { should be_installed }
#end

#describe package('pgdg-redhat93') do
#  it { should be_installed }
#end

#describe package('pgdg-redhat94') do
#  it { should be_installed }
#end

#describe package('pgdg-redhat95') do
#  it { should be_installed }
#end

#describe package('pgdg-centos96') do
#  it { should be_installed }
#end

describe package('pgdg-centos10') do
  it { should be_installed }
end

# PostgreSQL 10
# i:yum install -y postgresql10 postgresql10-contrib postgresql10-devel postgresql10-libs postgresql10-plperl postgresql10-plpython postgresql10-server
describe package('postgresql10') do
  it { should be_installed }
end

describe package('postgresql10-contrib') do
  it { should be_installed }
end

describe package('postgresql10-devel') do
  it { should be_installed }
end

describe package('postgresql10-libs') do
  it { should be_installed }
end

describe package('postgresql10-plperl') do
  it { should be_installed }
end

describe package('postgresql10-plpython') do
  it { should be_installed }
end

describe package('postgresql10-server') do
  it { should be_installed }
end

# i:env PGSETUP_INITDB_OPTIONS="--no-locale -E utf-8" /usr/pgsql-10/bin/postgresql-10-setup initdb
# i:systemctl enable postgresql-10
# i:systemctl start postgresql-10
describe service('postgresql-10') do
  it { should be_enabled }
  it { should be_running }
end
