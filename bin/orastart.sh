#!/bin/sh

lsnrctl<<EOF
start
EOF

emctl start dbconsole

sqlplus /nolog<<EOF
conn / as sysdba
startup;
EOF


