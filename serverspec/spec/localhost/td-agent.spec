require 'rubygems'
require 'spec_helper'

# td-agent
# curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
describe package('td-agent') do
  it { should be_installed }
end
