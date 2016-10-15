require 'rubygems'
require 'spec_helper'

# Pacemaker
# i:rpm -ivh http://iij.dl.osdn.jp/linux-ha/66141/pacemaker-repo-1.1.14-1.1.el6.x86_64.rpm
describe package('pacemaker-repo') do
  it { should be_installed }
end

# repo
# i:vi /etc/yum.repos.d/CentOS-Base.repo
# i:add 'exclude=pacemaker* corosync* resource-agents* crmsh* cluster-glue* libqb* fence-agents* pcs*' to [base] and [updates]
describe file('/etc/yum.repos.d/CentOS-Base.repo') do
  it { should contain 'exclude=pacemaker\* corosync\* resource-agents\* crmsh\* cluster-glue\* libqb\* fence-agents\* pcs\*' }
end

# i:yum install -y pacemaker-all
describe package('pacemaker-all') do
  it { should be_installed }
end

describe package('OpenIPMI-libs') do
  it { should be_installed }
end
describe package('cluster-glue') do
  it { should be_installed }
end
describe package('cluster-glue-libs') do
  it { should be_installed }
end
describe package('corosync') do
  it { should be_installed }
end
describe package('corosynclib') do
  it { should be_installed }
end
describe package('crmsh') do
  it { should be_installed }
end
describe package('cvs') do
  it { should be_installed }
end
describe package('gettext') do
  it { should be_installed }
end
describe package('ipmitool') do
  it { should be_installed }
end
describe package('libqb') do
  it { should be_installed }
end
describe package('libtool-ltdl') do
  it { should be_installed }
end
describe package('lm_sensors-libs') do
  it { should be_installed }
end
describe package('net-snmp-libs') do
  it { should be_installed }
end
describe package('openhpi-libs') do
  it { should be_installed }
end
describe package('pacemaker') do
  it { should be_installed }
end
describe package('pacemaker-cli') do
  it { should be_installed }
end
describe package('pacemaker-cluster-libs') do
  it { should be_installed }
end
describe package('pacemaker-libs') do
  it { should be_installed }
end
describe package('perl-TimeDate') do
  it { should be_installed }
end
describe package('pm_crmgen') do
  it { should be_installed }
end
describe package('pm_diskd') do
  it { should be_installed }
end
describe package('pm_extras') do
  it { should be_installed }
end
describe package('pm_logconv-cs') do
  it { should be_installed }
end
describe package('pssh') do
  it { should be_installed }
end
describe package('python-dateutil') do
  it { should be_installed }
end
describe package('python-lxml') do
  it { should be_installed }
end
describe package('python-six') do
  it { should be_installed }
end
describe package('resource-agents') do
  it { should be_installed }
end

# i:yum install -y pcs
describe package('pcs') do
  it { should be_installed }
end

# i:vi /etc/corosync/corosync.conf
describe file('/etc/corosync/corosync.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should contain 'ringnumber: 0' }
  it { should contain 'ringnumber: 1' }
  it { should contain 'bindnetaddr: 10.0.2.0' }
end

# i:corosync-keygen -l
describe file('/etc/corosync/authkey') do
  it { should be_file }
  it { should be_owned_by 'root' }
end

# i:vi /etc/sysconfig/pacemaker
describe file('/etc/sysconfig/pacemaker') do
  it { should contain 'export PCMK_fail_fast=yes' }
end

# i:vi /etc/init/pacemaker.combined.conf
describe file('/etc/init/pacemaker.combined.conf') do
  it { should contain 'soft_margin=6$' }
  it { should_not contain '#pidof corosync' }
  it { should contain 'pidof corosync' }
end

# i:initctl start pacemaker.combined
describe process('corosync') do
  it { should be_running }
end
describe process('pacemakerd') do
  it { should be_running }
end
describe process('cib') do
  it { should be_running }
end
describe process('stonithd') do
  it { should be_running }
end
describe process('lrmd') do
  it { should be_running }
end
describe process('attrd') do
  it { should be_running }
end
describe process('pengine') do
  it { should be_running }
end
describe process('crmd') do
  it { should be_running }
end
describe process('ifcheckd') do
  it { should be_running }
end

describe file('/etc/sysconfig/network') do
  it { should contain('HOSTNAME=devpg01.localdomain') }
end

describe command('crm_mon -fA1') do
  its(:stdout) { should contain('Online: \[ devpg01.localdomain \]') }
  its(:stdout) { should contain('vip').before(/\(ocf::heartbeat:IPaddr2\):\tStarted devpg01.localdomain/) }
  its(:stdout) { should contain('Clone Set: clone_ping').before(/\[ping\]\n     Started: \[ devpg01.localdomain \]/) }
  its(:stdout) { should contain('pgsql').before(/\(ocf::heartbeat:pgsql\):\tStarted devpg01.localdomain/) }
  its(:stdout) { should contain('diskd').before(/\(ocf::pacemaker:diskd\):\tStarted devpg01.localdomain/) }
end

# check vip
describe command('ip addr') do
  its(:stdout) { should contain('scope global secondary eth0').after(/inet 10.0.2.11.24 brd 10.0.2.255/) }
end
