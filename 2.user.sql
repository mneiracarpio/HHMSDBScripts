
-- HHMS
-------
alter session set "_ORACLE_SCRIPT"=true;
drop user hhms cascade;

CREATE USER hhms
IDENTIFIED BY hhms
DEFAULT TABLESPACE hhms;

alter user hhms QUOTA UNLIMITED ON hhms;

GRANT CREATE SYNONYM TO hhms;
GRANT DEBUG ANY PROCEDURE TO hhms;
GRANT CREATE PROCEDURE TO hhms;
GRANT QUERY REWRITE TO hhms;
GRANT CREATE SEQUENCE TO hhms;
GRANT CREATE TABLE TO hhms;
GRANT CREATE TRIGGER TO hhms;
GRANT ALTER SESSION TO hhms;
GRANT CREATE MATERIALIZED VIEW TO hhms;
GRANT CREATE VIEW TO hhms;
GRANT CREATE TYPE TO hhms;
GRANT CREATE SESSION TO hhms;
GRANT DEBUG CONNECT SESSION TO hhms;
GRANT CREATE JOB TO hhms;
grant create any directory to hhms;

--For Oracle preference
GRANT EXECUTE ON CTXSYS.ctx_ddl TO hhms; 
