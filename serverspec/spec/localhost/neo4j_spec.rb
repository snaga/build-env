require 'rubygems'
require 'spec_helper'

# OpenJDK
# i:yum install java
describe package('java-1.8.0-openjdk') do
  it { should be_installed }
end

# Neo4j
# i:wget 'https://neo4j.com/artifact.php?name=neo4j-community-3.0.3-unix.tar.gz'
# i:tar zxvf neo4j-community-3.0.3-unix.tar.gz -C /usr/local
describe file('/usr/local/neo4j-community-3.0.3/bin/neo4j') do
  it { should be_file }
  it { should be_executable }
end

# i:/usr/local/neo4j-community-3.0.3/bin/neo4j start
describe port(7474) do
  it { should be_listening }
end
