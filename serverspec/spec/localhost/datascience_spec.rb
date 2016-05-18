require 'rubygems'
require 'spec_helper'

# This spec file is depending the python27_spec test.

# -----------------------
# zlib (>1.2.3)
# -----------------------
# i:wget http://zlib.net/zlib-1.2.8.tar.gz
# i:tar zxf zlib-1.2.8.tar.gz
# i:cd zlib-1.2.8
# i:./configure --prefix=/usr/local
# i:make
# i:make install
#
# NOTE:
#   zlib >1.2.3 is required by GraphLab.
#   ref: http://forum.dato.com/discussion/1125/importerror-libunity-shared-so-undefined-symbol-gzopen64
#
describe file('/usr/local/lib/libz.a') do
  it { should be_file }
end

describe file('/usr/local/lib/libz.so.1.2.8') do
  it { should be_file }
end

describe file('/usr/local/include/zlib.h') do
  it { should be_file }
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

# i: pip install jupyter
describe file('/usr/local/lib/python2.7/site-packages/jupyter_core') do
  it { should be_directory }
end

describe file('/usr/local/bin/jupyter') do
  it { should be_file }
  it { should be_executable }
end

describe command('/usr/local/bin/jupyter --version') do
  its(:stdout) { should match /^4.1.\d+/ }
end

# -----------------------------------------
# GraphLab Create
#
# Required for Machine Learning Foundations @ Coursera
# -----------------------------------------
# i:pip install --upgrade --no-cache-dir https://get.dato.com/GraphLab-Create/1.7.1/<email>/<product key>/GraphLab-Create-License.tar.gz
describe file('/usr/local/lib/python2.7/site-packages/graphlab') do
  it { should be_directory }
end

# i:yum install libpng-devel freetype-devel
describe package('libpng-devel') do
  it { should be_installed }
end

describe package('freetype-devel') do
  it { should be_installed }
end

# i: /usr/local/bin/pip install matplotlib
describe file('/usr/local/lib/python2.7/site-packages/matplotlib') do
  it { should be_directory }
end
