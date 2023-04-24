alter session set "_ORACLE_SCRIPT"=true;
drop table hhms.reset_authentication_log;
drop table hhms.operation;
DROP TABLE hhms.param_value;
DROP TABLE hhms.daily_item;
DROP TABLE hhms.period_item;
DROP TABLE hhms.production_period;
DROP TABLE hhms.item;
DROP SEQUENCE hhms.item_seq;
DROP SEQUENCE hhms.production_period_seq;
DROP SEQUENCE hhms.period_item_seq;
DROP SEQUENCE hhms.daily_item_seq;
DROP SEQUENCE hhms.department_seq;


drop table hhms.daily_payroll;
drop table hhms.biweekly_payroll;
drop table hhms.payroll_period;
drop table hhms.schedule_day;
drop table hhms.schedule_period;
drop table hhms.room;
drop table hhms.room_status;
drop table hhms.employee;
drop table hhms.manager;
drop table hhms.employee_category;
DROP TABLE hhms.department;

DROP SEQUENCE hhms.manager_seq;
DROP SEQUENCE hhms.employee_seq;
DROP SEQUENCE hhms.room_seq;
DROP SEQUENCE hhms.room_status_seq;
DROP sequence hhms.schedule_period_seq;
DROP sequence hhms.schedule_day_seq;

DROP sequence hhms.daily_payroll_seq;
DROP sequence hhms.biweekly_payroll_seq;
DROP sequence hhms.payroll_period_seq;
drop sequence hhms.reset_authentication_log_seq;

create sequence hhms.payroll_period_seq increment by 1 start with 1 NOCACHE order;
create sequence hhms.biweekly_payroll_seq increment by 1 start with 1 NOCACHE order;
create sequence hhms.daily_payroll_seq increment by 1 start with 1 NOCACHE order;

create sequence hhms.manager_seq increment by 1 start with 1 NOCACHE order;
create sequence hhms.employee_seq increment by 1 start with 1 NOCACHE order;
create sequence hhms.room_seq increment by 1 start with 1 NOCACHE order;
create sequence hhms.room_status_seq increment by 1 start with 1 NOCACHE order;
create sequence hhms.schedule_period_seq increment by 1 start with 1 NOCACHE order;
create sequence hhms.schedule_day_seq increment by 1 start with 1 nocache order;


create sequence hhms.item_seq increment by 1 start with 1 nocache order;
create sequence hhms.production_period_seq increment by 1 start with 1 order;
create sequence hhms.period_item_seq increment by 1 start with 1 order;
create sequence hhms.daily_item_seq increment by 1 start with 1 order;
create sequence hhms.department_seq increment by 1 start with 3 nocache order;
create sequence hhms.reset_authentication_log_seq increment by 1 start with 1;


CREATE TABLE hhms.item (
    item_id 			NUMBER(6),
    item    			NUMBER(6),
    name    			VARCHAR2(100),
	department_id		NUMBER(6),
    state   			CHAR(1) DEFAULT 'A'  NOT NULL
);

ALTER TABLE hhms.item 
ADD CONSTRAINT item_pk PRIMARY KEY (item_id) USING INDEX;


CREATE TABLE hhms.production_period (
    production_period_id 	NUMBER(4),
    production_period    	NUMBER(4),
    start_date           	DATE,
    end_date             	DATE,
	production_index     	NUMBER(10, 2),
	quantity             	NUMBER(10, 2),
	labor_factor         	NUMBER(10,2),
	department_id			NUMBER(6),
	state   				CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.production_period ADD CONSTRAINT production_period_pk PRIMARY KEY ( production_period_id );


CREATE TABLE hhms.period_item (
    period_item_id         	NUMBER(6),
	item_id              	NUMBER(6),
    production_period_id 	NUMBER(4),
    quantity             	NUMBER(10, 2),
    production_index     	NUMBER(10, 2),
	state   			 	CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.period_item 
ADD CONSTRAINT period_item_pk PRIMARY KEY ( period_item_id );


CREATE TABLE hhms.daily_item (
    daily_item_id        NUMBER(6),
	period_item_id       NUMBER(6),
    day                  DATE,
    quantity             NUMBER(10, 2),
	state   			 CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.daily_item 
ADD CONSTRAINT daily_item_pk PRIMARY KEY ( daily_item_id );


CREATE TABLE hhms.param_value ( 
    parameter				VARCHAR2(20),
    VALUE					number(10,2)
);


ALTER TABLE hhms.param_value 
ADD CONSTRAINT param_value_pk PRIMARY KEY ( parameter );


CREATE TABLE hhms.department (
	department_id		NUMBER(6),
	department			NUMBER(6),
	name				VARCHAR2(50),
	description			VARCHAR2(100),
	state				CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.department
ADD CONSTRAINT department_pk PRIMARY KEY ( department_id );


CREATE TABLE hhms.manager (
    manager_id    			NUMBER(4),
    first_name      		VARCHAR2(100),
    last_name       		VARCHAR2(100),
	username				VARCHAR2(30),
    password        		VARCHAR2(70),
	email					VARCHAR2(70),
    employee_category_id    NUMBER(1),
	picture					blob,
    state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.manager 
ADD CONSTRAINT manager_pk PRIMARY KEY (manager_id) USING INDEX;

CREATE TABLE hhms.employee_category (
    employee_category_id    	NUMBER(1),
    description     			VARCHAR2(50),
    state           			CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.employee_category 
ADD CONSTRAINT employee_category_pk PRIMARY KEY (employee_category_id) USING INDEX;

CREATE TABLE hhms.employee (
    employee_id     NUMBER(6),
    first_name      VARCHAR2(100),
    last_name       VARCHAR2(100),
    punch_number    VARCHAR2(30),
    employee_category_id NUMBER(1),
    state           CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.employee 
ADD CONSTRAINT employee_pk PRIMARY KEY (employee_id) USING INDEX;


CREATE TABLE hhms.room_status (
    room_status_id 			NUMBER(6),
    room_status				NUMBER(6),
	description				VARCHAR2(100),
    state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.room_status 
ADD CONSTRAINT room_status_pk PRIMARY KEY (room_status_id) USING INDEX;


CREATE TABLE hhms.room (
    room_id     			NUMBER(6),
    room      				VARCHAR2(4),
    floor       			VARCHAR2(2),
	employee_id				NUMBER(6),
	room_status_id			NUMBER(6),
    state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.room 
ADD CONSTRAINT room_pk PRIMARY KEY (room_id) USING INDEX;

CREATE TABLE hhms.schedule_period (
    schedule_period_id     	NUMBER(6),
    schedule_period    		NUMBER(6),
    start_date 				DATE,
	end_date 				DATE,
	department_id			NUMBER(6),
    state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.schedule_period 
ADD CONSTRAINT schedule_period_pk PRIMARY KEY (schedule_period_id) USING INDEX;


CREATE TABLE hhms.schedule_day (
    schedule_day_id     	NUMBER(6),
    schedule_period_id     	NUMBER(6),
	employee_id     		NUMBER(6),
    day    					DATE,
    note 					VARCHAR2(1000),
    state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.schedule_day 
ADD CONSTRAINT schedule_day_pk PRIMARY KEY (schedule_day_id) USING INDEX;



-----------
 
CREATE TABLE hhms.payroll_period (
    payroll_period_id  		NUMBER(6),
	payroll_period			NUMBER(6),
	department_id			NUMBER(6),
    start_date 				DATE,
	end_date 				DATE,
	hour_factor				NUMBER(10,2),
	hours					NUMBER(10,2) DEFAULT 0,
	labor_index				NUMBER(10,2) DEFAULT 0,
	state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.payroll_period
ADD CONSTRAINT payroll_period_pk PRIMARY KEY (payroll_period_id) USING INDEX;


CREATE TABLE hhms.biweekly_payroll (
    biweekly_payroll_id  	NUMBER(6),
	payroll_period_id  		NUMBER(6),
	employee_id     		NUMBER(6),
	hours     				NUMBER(10,2) DEFAULT 0,
	labor_index				NUMBER(10,2) DEFAULT 0,
	state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.biweekly_payroll 
ADD CONSTRAINT biweekly_payroll_pk PRIMARY KEY (biweekly_payroll_id) USING INDEX;


CREATE TABLE hhms.daily_payroll (
    daily_payroll_id  		NUMBER(6),
	biweekly_payroll_id  		NUMBER(6),
    day      				DATE,
    hours	     			NUMBER(10,2) DEFAULT 0,
    state           		CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE hhms.daily_payroll 
ADD CONSTRAINT daily_payroll_pk PRIMARY KEY (daily_payroll_id) USING INDEX;

-- log

create table hhms.reset_authentication_log (
reset_authentication_log_id number(10),
log_time date,
operation_id number(2),
manager_id number(4),
email varchar2(70)
);

ALTER TABLE hhms.reset_authentication_log 
ADD CONSTRAINT reset_authentication_log_pk PRIMARY KEY ( reset_authentication_log_id );


create table hhms.operation (
operation_id number(2),
description varchar2(100),
state varchar2(1)
);

ALTER TABLE hhms.operation 
ADD CONSTRAINT operation_pk PRIMARY KEY ( operation_id );



------------------------------ ALTER


ALTER TABLE hhms.daily_item
    ADD CONSTRAINT dayite_perite_fk 
	FOREIGN KEY ( period_item_id )
    REFERENCES hhms.period_item ( period_item_id );

ALTER TABLE hhms.period_item
    ADD CONSTRAINT perite_item_fk 
	FOREIGN KEY ( item_id )
    REFERENCES hhms.item ( item_id );

ALTER TABLE hhms.period_item
    ADD CONSTRAINT peritem_prodperiod_fk FOREIGN KEY ( production_period_id )
    REFERENCES hhms.production_period ( production_period_id );

ALTER TABLE hhms.item
    ADD CONSTRAINT item_department_fk 
	FOREIGN KEY ( department_id )
    REFERENCES hhms.department ( department_id );

ALTER TABLE hhms.production_period
    ADD CONSTRAINT proper_department_fk 
	FOREIGN KEY ( department_id )
    REFERENCES hhms.department ( department_id );

ALTER TABLE hhms.reset_authentication_log
    ADD CONSTRAINT resautlog_operation_fk 
	FOREIGN KEY ( operation_id )
    REFERENCES hhms.operation ( operation_id );



ALTER TABLE hhms.employee 
ADD CONSTRAINT emp_empcat_fk FOREIGN KEY (employee_category_id) REFERENCES hhms.employee_category (employee_category_id);

ALTER TABLE hhms.manager 
ADD CONSTRAINT man_empcat_fk FOREIGN KEY (employee_category_id) REFERENCES hhms.employee_category (employee_category_id);

ALTER TABLE hhms.room
ADD CONSTRAINT room_employee_fk FOREIGN KEY (employee_id) REFERENCES hhms.employee (employee_id);

ALTER TABLE hhms.schedule_day
ADD CONSTRAINT schday_schper_fk FOREIGN KEY (schedule_period_id) REFERENCES hhms.schedule_period (schedule_period_id);

ALTER TABLE hhms.schedule_day
ADD CONSTRAINT schday_emp_fk FOREIGN KEY (employee_id) REFERENCES hhms.employee (employee_id);

ALTER TABLE hhms.daily_payroll
ADD CONSTRAINT daipay_perpay_fk FOREIGN KEY (biweekly_payroll_id) REFERENCES hhms.biweekly_payroll (biweekly_payroll_id);

ALTER TABLE hhms.biweekly_payroll
ADD CONSTRAINT biwpay_payper_fk FOREIGN KEY (payroll_period_id) REFERENCES hhms.payroll_period (payroll_period_id);

ALTER TABLE hhms.biweekly_payroll
ADD CONSTRAINT perpay_emp_fk FOREIGN KEY (employee_id) REFERENCES hhms.employee (employee_id);

ALTER TABLE hhms.room
ADD CONSTRAINT room_roosta_fk FOREIGN KEY (room_status_id) REFERENCES hhms.room_status (room_status_id);


ALTER TABLE hhms.payroll_period
    ADD CONSTRAINT payper_department_fk 
	FOREIGN KEY ( department_id )
    REFERENCES hhms.department ( department_id );


ALTER TABLE hhms.manager ADD CONSTRAINT manager_username_ui UNIQUE (username);
ALTER TABLE hhms.manager ADD CONSTRAINT manager_email_ui UNIQUE (email);

ALTER TABLE hhms.employee ADD CONSTRAINT employee_ui UNIQUE (punch_number);

ALTER TABLE hhms.schedule_period
    ADD CONSTRAINT schper_department_fk 
	FOREIGN KEY ( department_id )
    REFERENCES hhms.department ( department_id );

create unique index hhms.schedule_period_ui ON hhms.schedule_period (start_date, department_id);
create unique index hhms.production_period_ui ON hhms.production_period (start_date, department_id);
create unique index hhms.payroll_period_ui ON hhms.payroll_period (start_date, department_id);
create index hhms.reset_authentication_log_01_i ON hhms.reset_authentication_log (manager_id);


