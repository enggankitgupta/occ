#!/usr/bin/bash

NOW=$(date +"%m-%d-%Y-%T")
FILE="/opt/spool/output_$NOW.csv"

sqlplus -s username/password@ORACLE_SID  <<EOF
clear buffer
SET FEEDBACK OFF
SET ECHO OFF
SET DEFINE OFF
SET TRIMSPOOL ON
SET PAGESIZE 0 EMBEDDED ON
SET LINESIZE 1000
SET TERMOUT OFF
SET SPACE 0
SET NEWPAGE 0
SET PAGES 0
SPOOL $FILE
select 'NUMBER|CREATEDUSER|CREATEDDATE' from dual union all
select id||'|'||createduser||'|'||createddate from telephonenumber
fetch first 6 rows only;
SPOOL OFF
EXIT
EOF
