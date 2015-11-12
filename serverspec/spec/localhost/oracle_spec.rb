require 'rubygems'
require 'spec_helper'

# Oracle 11g installation based on:
# http://www.server-world.info/query?os=CentOS_6&p=oracle11g&f=1
# http://www.server-world.info/query?os=CentOS_6&p=oracle11g&f=2

# i:yum install -y binutils compat-libstdc++-33 compat-libstdc++-33.i686 ksh elfutils-libelf elfutils-libelf-devel glibc glibc-common glibc-devel gcc gcc-c++ libaio libaio.i686 libaio-devel libaio-devel.i686 libgcc libstdc++ libstdc++.i686 libstdc++-devel libstdc++-devel.i686 make sysstat unixODBC unixODBC-devel xorg-x11-utils

describe package('binutils') do
  it { should be_installed }
end

describe package('compat-libstdc++-33') do
  it { should be_installed }
end

describe package('compat-libstdc++-33.i686') do
  it { should be_installed }
end

describe package('ksh') do
  it { should be_installed }
end

describe package('elfutils-libelf') do
  it { should be_installed }
end

describe package('elfutils-libelf-devel') do
  it { should be_installed }
end

describe package('glibc') do
  it { should be_installed }
end

describe package('glibc-common') do
  it { should be_installed }
end

describe package('glibc-devel') do
  it { should be_installed }
end

describe package('gcc') do
  it { should be_installed }
end

describe package('gcc-c++') do
  it { should be_installed }
end

describe package('libaio') do
  it { should be_installed }
end

describe package('libaio.i686') do
  it { should be_installed }
end

describe package('libaio-devel') do
  it { should be_installed }
end

describe package('libaio-devel.i686') do
  it { should be_installed }
end

describe package('libgcc') do
  it { should be_installed }
end

describe package('libstdc++') do
  it { should be_installed }
end

describe package('libstdc++.i686') do
  it { should be_installed }
end

describe package('libstdc++-devel') do
  it { should be_installed }
end

describe package('libstdc++-devel.i686') do
  it { should be_installed }
end

describe package('make') do
  it { should be_installed }
end

describe package('sysstat') do
  it { should be_installed }
end

describe package('unixODBC') do
  it { should be_installed }
end

describe package('unixODBC-devel') do
  it { should be_installed }
end

describe package('xorg-x11-utils') do
  it { should be_installed }
end

# i:vi /etc/sysctl.conf
# i:net.ipv4.ip_local_port_range = 9000 65500
# i:fs.file-max = 6815744
# i:kernel.shmall = 10523004
# i:kernel.shmmax = 6465333657
# i:kernel.shmmni = 4096
# i:kernel.sem = 250 32000 100 128
# i:net.core.rmem_default=262144
# i:net.core.wmem_default=262144
# i:net.core.rmem_max=4194304
# i:net.core.wmem_max=1048576
# i:fs.aio-max-nr = 1048576
describe file('/etc/sysctl.conf') do
  its(:content) { should match /^net.ipv4.ip_local_port_range = 9000 65500/ }
  its(:content) { should match /^fs.file-max = 6815744/ }
  its(:content) { should match /^kernel.shmall = 10523004/ }
  its(:content) { should match /^kernel.shmmax = 6465333657/ }
  its(:content) { should match /^kernel.shmmni = 4096/ }
  its(:content) { should match /^kernel.sem = 250 32000 100 128/ }
  its(:content) { should match /^net.core.rmem_default=262144/ }
  its(:content) { should match /^net.core.wmem_default=262144/ }
  its(:content) { should match /^net.core.rmem_max=4194304/ }
  its(:content) { should match /^net.core.wmem_max=1048576/ }
  its(:content) { should match /^fs.aio-max-nr = 1048576/ }
  its(:content) { should_not match /^kernel.shmmax = 68719476736/ }
  its(:content) { should_not match /^kernel.shmall = 4294967296/ }
end

# i:groupadd -g 200 oinstall
# i:groupadd -g 201 dba
# i:useradd -u 440 -g oinstall -G dba -d /usr/oracle oracle
# i:passwd oracle 
describe group('oinstall') do
  it { should exist }
  it { should have_gid 200 }
end

describe group('dba') do
  it { should exist }
  it { should have_gid 201 }
end

describe user('oracle') do
  it { should exist }
  it { should have_uid 440 }
  it { should belong_to_group 'oinstall' }
  it { should belong_to_group 'dba' }
  it { should have_home_directory '/usr/oracle' }
end

# i:vi /etc/pam.d/login 
# i:session    required     pam_limits.so
describe file('/etc/pam.d/login') do
  its(:content) { should match /^session    required     pam_limits.so/ }
end

# i:vi /etc/security/limits.conf
# i:oracle   soft   nproc   2047
# i:oracle   hard   nproc   16384
# i:oracle   soft   nofile   1024
# i:oracle   hard   nofile   65536
describe file('/etc/security/limits.conf') do
  its(:content) { should match /^oracle   soft   nproc   2047/ }
  its(:content) { should match /^oracle   hard   nproc   16384/ }
  its(:content) { should match /^oracle   soft   nofile   1024/ }
  its(:content) { should match /^oracle   hard   nofile   65536/ }
end

# i:vi /etc/profile
# i:if [ $USER = "oracle" ]; then
# i:      if [ $SHELL = "/bin/ksh" ]; then
# i:           ulimit -p 16384
# i:           ulimit -n 65536
# i:      else
# i:           ulimit -u 16384 -n 65536
# i:      fi
# i:fi
describe file('/etc/profile') do
  its(:content) { should match /^if \[ \$USER = "oracle" \]; then/ }
end

# i:chmod 755 /usr/oracle
describe file('/usr/oracle') do
  it { should be_directory }
  it { should be_mode 755 }
end

# i:mkdir /usr/oracle/app
# i:chown oracle:oinstall /usr/oracle/app
# i:chmod 775 /usr/oracle/app
describe file('/usr/oracle/app') do
  it { should be_directory }
  it { should be_mode 775 }
end

# i:mkdir /usr/oracle/oradata
# i:chown oracle:oinstall /usr/oracle/oradata
# i:chmod 775 /usr/oracle/oradata
describe file('/usr/oracle/oradata') do
  it { should be_directory }
  it { should be_mode 775 }
end

# i:vi /usr/oracle/.bash_profile
# i:umask 022
# i:export ORACLE_BASE=/usr/oracle/app
# i:export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/dbhome_1
# i:export PATH=$PATH:$ORACLE_HOME/bin
describe file('/usr/oracle/.bash_profile') do
  its(:content) { should match /^umask 022/ }
  its(:content) { should match /^export ORACLE_BASE=\/usr\/oracle\/app/ }
  its(:content) { should match /^export ORACLE_HOME=\$ORACLE_BASE\/product\/11.2.0\/dbhome_1/ }
  its(:content) { should match /^export ORACLE_SID=orcl/ }
  its(:content) { should match /^export PATH=\$PATH:\$ORACLE_HOME\/bin/ }
end

# i:cd $TMP/database
# i:./runInstaller
describe file('/usr/oracle/app/product/11.2.0/dbhome_1') do
  it { should be_directory }
end

describe file('/usr/oracle/app/oradata/orcl') do
  it { should be_directory }
end

# i:/usr/oracle/oraInventory/orainstRoot.sh
describe file('/usr/oracle/oraInventory') do
  it { should be_directory }
  it { should be_mode 770 }
  it { should be_owned_by 'oracle' }
  it { should be_grouped_into 'oinstall' }
end

# i:/usr/oracle/app/product/11.2.0/dbhome_1/root.sh
describe file('/etc/oratab') do
  its(:content) { should match /^orcl:\/usr\/oracle\/app\/product\/11.2.0\/dbhome_1:N/ }
end

