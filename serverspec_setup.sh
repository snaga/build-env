#!/bin/sh

yum install -y rubygems
gem install net-ssh -v 2.9.2 --no-ri --no-rdoc -V
gem install serverspec --no-ri --no-rdoc -V
gem install rake --no-ri --no-rdoc -V
