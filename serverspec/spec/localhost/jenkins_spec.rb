require 'rubygems'
require 'spec_helper'

# OpenJDK
# i:yum install java
describe package('java-1.8.0-openjdk') do
  it { should be_installed }
end

# Jenkins
# i:wget http://pkg.jenkins-ci.org/redhat/jenkins-1.638-1.1.noarch.rpm
# i:rpm -i jenkins-1.638-1.1.noarch.rpm
describe package('jenkins') do
  it { should be_installed }
end

