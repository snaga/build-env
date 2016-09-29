require 'rubygems'
require 'spec_helper'

# td-agent2
# i:curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
describe package('td-agent') do
  it { should be_installed }
end

# td-agent service
# i:service td-agent start
# i:chkconfig td-agent on
describe service('td-agent') do
  it { should be_enabled }
  it { should be_running }
end

# fluent-plugin-pgjson
# i:env PATH=/usr/pgsql-9.4/bin:$PATH /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-pgjson
describe command('/opt/td-agent/embedded/bin/fluent-gem list') do
  its(:stdout) { should contain('fluent-plugin-pgjson') }
end

