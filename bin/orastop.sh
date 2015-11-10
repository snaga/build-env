#!/bin/sh

sqlplus /nolog<<EOF
conn / as sysdba
shutdown immediate;
EOF

emctl stop dbconsole

lsnrctl<<EOF
stop
EOF

