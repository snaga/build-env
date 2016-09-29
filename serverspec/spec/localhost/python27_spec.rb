# i:yum install -y bzip2-devel
describe package('bzip2-devel') do
  it { should be_installed }
end

# i:yum install -y openssl-devel
describe package('openssl-devel') do
  it { should be_installed }
end

# -----------------------
# Python 2.7
# -----------------------
# i:wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
# i:tar zxvf Python-2.7.11.tgz
# i:cd Python-2.7.11
# i:./configure --enable-shared LDFLAGS=-Wl,-rpath,/usr/local/lib --enable-unicode=ucs4
# i:make
# i:sudo make install
#
# NOTE:
#   --enable-unicode=ucs4 is required for a python build for GraphLab.
#   ref: http://forum.dato.com/discussion/686/undefined-symbol-pyunicodeucs4-decodeutf8-on-centos-release-6-4-final
#
describe command('/usr/local/bin/python2.7 -V') do
  its(:stderr) { should match /^Python 2.7/ }
end

describe command('/usr/local/bin/python -c "import bz2; print bz2.__doc__"') do
  its(:stdout) { should match /^The python bz2 module provides a comprehensive interface for/ }
end

describe file('/usr/local/lib/libpython2.7.so') do
  it { should be_file }
end

# i:wget https://bootstrap.pypa.io/get-pip.py
# i:/usr/local/bin/python get-pip.py
describe command('/usr/local/bin/pip --version') do
  its(:stdout) { should match /python 2.7/ }
end

# Python pip
# i:wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
# i:python2.7 get-pip.py
describe file('/usr/local/bin/pip') do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

# i:env PATH=/usr/pgsql-9.5/bin:$PATH /usr/local/bin/pip install psycopg2
describe file('/usr/local/lib/python2.7/site-packages/psycopg2/_psycopg.so') do
  it { should be_file }
  it { should exist }
end

# i:https://github.com/pyinstaller/pyinstaller/releases/download/v3.2/PyInstaller-3.2.tar.gz
# i:tar zxvf PyInstaller-3.2.tar.gz
# i:cd PyInstaller-3.2
# i:/usr/local/bin/python2.7 setup.py install
describe file('/usr/local/bin/pyinstaller') do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

# SQLite with PyInstaller
# i:yum install -y sqlite-devel
describe package('sqlite-devel') do
  it { should be_installed }
end
