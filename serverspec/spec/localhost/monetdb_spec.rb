require 'rubygems'
require 'spec_helper'

# MonetDB
# i:yum install -y libcurl-devel
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-SQL-server5-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-client-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-client-devel-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-client-tools-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-devel-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-stream-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB-stream-devel-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB5-server-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/MonetDB5-server-devel-11.21.19-20160405.el6.x86_64.rpm
# i:rpm -ivh https://www.monetdb.org/downloads/epel/6.5/x86_64/python-monetdb-11.21.19-20160405.el6.noarch.rpm
describe package('libcurl-devel') do
  it { should be_installed }
end

describe package('libatomic_ops-devel') do
  it { should be_installed }
end

describe package('MonetDB') do
  it { should be_installed }
end

describe package('MonetDB-devel') do
  it { should be_installed }
end

describe package('MonetDB-SQL-server5') do
  it { should be_installed }
end

describe package('MonetDB-client') do
  it { should be_installed }
end

describe package('MonetDB-client-tools') do
  it { should be_installed }
end

describe package('MonetDB-client-devel') do
  it { should be_installed }
end

describe package('MonetDB-stream') do
  it { should be_installed }
end

describe package('MonetDB-stream-devel') do
  it { should be_installed }
end

describe package('MonetDB5-server') do
  it { should be_installed }
end

describe package('MonetDB5-server-devel') do
  it { should be_installed }
end

describe package('python-monetdb') do
  it { should be_installed }
end

# i:service postgresql-9.4 start
# i:chkconfig postgresql-9.4 on
describe service('postgresql-9.4') do
  it { should_not be_enabled }
  it { should_not be_running }
end

# i:env PATH=/usr/pgsql-9.5/bin:$PATH /usr/local/bin/pip install psycopg2
describe file('/usr/local/lib/python2.7/site-packages/psycopg2/_psycopg.so') do
  it { should be_file }
  it { should exist }
end

