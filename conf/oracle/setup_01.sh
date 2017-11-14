groupadd -g 200 oinstall
groupadd -g 201 dba
useradd -u 440 -g oinstall -G dba -d /usr/oracle oracle
passwd oracle

