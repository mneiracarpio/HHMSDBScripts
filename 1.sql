--select * from dba_datafiles


CREATE TABLESPACE hhms DATAFILE 
  '/opt/oracle/oradata/XE/XEPDB1/hhms_dat_01' SIZE 20M REUSE AUTOEXTEND ON NEXT 20M MAXSIZE UNLIMITED
LOGGING
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT MANUAL
FLASHBACK ON;

/*
sqlplus / as sysdba

alter session set container=XEPDB1;
show con_name;
alter pluggable database XEPDB1 close;
alter pluggable database XEPDB1 open read write;

CREATE PROFILE COMUSER_HHMS LIMIT
  SESSIONS_PER_USER 30
  CPU_PER_SESSION UNLIMITED
  CPU_PER_CALL UNLIMITED
  CONNECT_TIME UNLIMITED
  IDLE_TIME UNLIMITED
  LOGICAL_READS_PER_SESSION UNLIMITED
  LOGICAL_READS_PER_CALL UNLIMITED
  COMPOSITE_LIMIT UNLIMITED
  PRIVATE_SGA UNLIMITED
  FAILED_LOGIN_ATTEMPTS 5
  PASSWORD_LIFE_TIME UNLIMITED
  PASSWORD_REUSE_TIME UNLIMITED
  PASSWORD_REUSE_MAX UNLIMITED
  PASSWORD_LOCK_TIME 1
  PASSWORD_GRACE_TIME 7
  PASSWORD_VERIFY_FUNCTION NULL;
*/

