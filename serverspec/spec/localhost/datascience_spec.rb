require 'rubygems'
require 'spec_helper'

# -----------------------
# Python 2.7
# -----------------------
# i:wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz
# i:tar zxvf Python-2.7.9.tgz
# i:cd Python-2.7.9
# i:./configure --enable-shared LDFLAGS=-Wl,-rpath,/usr/local/lib
# i:make
# i:sudo make install
describe command('python2.7 -V') do
  its(:stderr) { should match /^Python 2.7/ }
end

describe file('/usr/local/lib/libpython2.7.so') do
  it { should be_file }
end

# i:wget https://bootstrap.pypa.io/get-pip.py
# i:/usr/local/bin/python get-pip.py
describe command('/usr/local/bin/pip --version') do
  its(:stdout) { should match /python 2.7/ }
end

# -----------------------
# Mecab
# -----------------------
# i:rpm -ivh http://packages.groonga.org/centos/groonga-release-1.1.0-1.noarch.rpm
describe package('groonga-release') do
  it { should be_installed }
end

# i:yum install -y mecab mecab-devel mecab-ipadic
describe package('mecab') do
  it { should be_installed }
end

describe package('mecab-devel') do
  it { should be_installed }
end

describe package('mecab-ipadic') do
  it { should be_installed }
end

# -----------------------
# python-mecab
# -----------------------
# i:wget https://mecab.googlecode.com/files/mecab-python-0.996.tar.gz
# i:tar zxvf mecab-python-0.996.tar.gz
# i:cd mecab-python-0.996
# i:/usr/local/bin/python setup.py build
# i:sudo /usr/local/bin/python setup.py install
describe file('/usr/local/lib/python2.7/site-packages/_MeCab.so') do
  it { should be_file }
end

describe file('/usr/local/lib/python2.7/site-packages/MeCab.py') do
  it { should be_file }
end

# -----------------------
# Others
# -----------------------

# i:yum install atlas-devel lapack-devel blas-devel
describe package('atlas-devel') do
  it { should be_installed }
end

describe package('lapack-devel') do
  it { should be_installed }
end

describe package('blas-devel') do
  it { should be_installed }
end

# i:/usr/local/bin/pip install networkx
describe file('/usr/local/lib/python2.7/site-packages/networkx') do
  it { should be_directory }
end

# i:/usr/local/bin/pip install numpy
describe file('/usr/local/lib/python2.7/site-packages/numpy') do
  it { should be_directory }
end

# i:/usr/local/bin/pip install scipy
describe file('/usr/local/lib/python2.7/site-packages/scipy') do
  it { should be_directory }
end

# i:/usr/local/bin/pip install scikit-learn
describe file('/usr/local/lib/python2.7/site-packages/sklearn') do
  it { should be_directory }
end

# i:/usr/local/bin/pip install pulp
describe file('/usr/local/lib/python2.7/site-packages/pulp') do
  it { should be_directory }
end

# i:/usr/local/bin/pip install cherrypy
describe file('/usr/local/lib/python2.7/site-packages/cherrypy') do
  it { should be_directory }
end
