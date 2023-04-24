--------------------------------------------------------
--  DDL for Procedure EMPLOYEE_STATE_CHANGE
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."EMPLOYEE_STATE_CHANGE" (
    employee_id             employee.employee_id%TYPE,
    state                   employee.state%TYPE,
    employee_category_id    employee.employee_category_id%TYPE )
AS 
    v_schedule_period_id        schedule_period.schedule_period_id%TYPE;
    v_new_min_date              date;
    v_payroll_period_id         payroll_period.payroll_period_id%TYPE;
    v_department_id             schedule_period.department_id%TYPE;
BEGIN
    -- FIND ALL PERIODS TO BE UPDATED
    -- SET SCHEDULE_DAY FOR ALL SCHEDULE PERIODS FROM TODAY TO FUTURE DATES
    FOR i IN (SELECT schedule_period_id
                FROM schedule_period
               WHERE end_date > sysdate )
    LOOP
        -- H is the active state for supervisors
        UPDATE schedule_day
           SET state = DECODE(EMPLOYEE_STATE_CHANGE.state,'H','A',EMPLOYEE_STATE_CHANGE.state)
         WHERE schedule_period_id = i.schedule_period_id
           AND employee_id = EMPLOYEE_STATE_CHANGE.employee_id;
    END LOOP;
    
    -- FIND DEPARTMENT
    CASE employee_category_id
        WHEN 3 THEN v_department_id := 3;
        WHEN 5 THEN v_department_id := 4;
        WHEN 2 THEN v_department_id := 1;
        WHEN 4 THEN v_department_id := 1;
        ELSE v_department_id := 0;
    END CASE;

    -- inactive/active current period
    SELECT payroll_period_id, end_date + 1 new_min_date
      INTO v_payroll_period_id, v_new_min_date
      FROM payroll_period
     WHERE department_id = v_department_id
       AND SYSDATE between start_date AND end_date;

    FOR j IN ( SELECT * 
                 FROM biweekly_payroll
                WHERE payroll_period_id = v_payroll_period_id
                  AND employee_id = EMPLOYEE_STATE_CHANGE.employee_id )
    LOOP
        UPDATE daily_payroll
           SET state = EMPLOYEE_STATE_CHANGE.state
        WHERE biweekly_payroll_id = j.biweekly_payroll_id;
        UPDATE biweekly_payroll
           SET state = EMPLOYEE_STATE_CHANGE.state
        WHERE biweekly_payroll_id = j.biweekly_payroll_id;
    END LOOP;
    
    -- delete/insert periods after current one
    FOR i IN (  SELECT payroll_period_id, start_date
                  FROM payroll_period
                 WHERE department_id = v_department_id
                   AND end_date > v_new_min_date )
    LOOP
        -- when it's inactivation, I delete
        IF EMPLOYEE_STATE_CHANGE.state = 'I' THEN
            FOR j IN ( SELECT * 
                         FROM biweekly_payroll
                        WHERE payroll_period_id = i.payroll_period_id
                          AND employee_id = EMPLOYEE_STATE_CHANGE.employee_id )
            LOOP
                DELETE daily_payroll
                 WHERE biweekly_payroll_id = j.biweekly_payroll_id;
                DELETE biweekly_payroll
                 WHERE biweekly_payroll_id = j.biweekly_payroll_id;
            END LOOP;
        -- when it's activacion, I insert
        ELSE
            INSERT INTO biweekly_payroll (
                biweekly_payroll_id, payroll_period_id,
                employee_id, hours,
                state )
            VALUES (
                biweekly_payroll_seq.NEXTVAL, i.payroll_period_id,
                EMPLOYEE_STATE_CHANGE.employee_id, 0,
                'A' );
            -- insert daily payroll
            FOR x in 1 .. 14
            lOOP
                INSERT INTO daily_payroll (
                    daily_payroll_id, biweekly_payroll_id,
                    day, hours,
                    state )
                VALUES ( 
                    daily_payroll_seq.NEXTVAL, biweekly_payroll_seq.CURRVAL,
                    i.start_date + x - 1, 0,
                    'A' );
            END LOOP;
        END IF;
    END LOOP;
END EMPLOYEE_STATE_CHANGE;
/

--------------------------------------------------------
--  DDL for Procedure ITEM_STATE_CHANGE
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."ITEM_STATE_CHANGE" (
    item_id         item.item_id%TYPE,
    department_id   item.department_id%TYPE,
    state           item.state%TYPE)
AS 
    v_new_min_date              date;
    v_production_period_id      production_period.production_period_id%TYPE;
BEGIN
    -- inactive/active current period
    SELECT production_period_id, end_date + 1 new_min_date
      INTO v_production_period_id, v_new_min_date
      FROM production_period
     WHERE department_id = ITEM_STATE_CHANGE.department_id
       AND SYSDATE between start_date AND end_date;

    FOR j IN ( SELECT * 
                 FROM period_item
                WHERE production_period_id = v_production_period_id
                  AND item_id = ITEM_STATE_CHANGE.item_id )
    LOOP
        UPDATE period_item 
           SET state = ITEM_STATE_CHANGE.state
        WHERE period_item_id = j.period_item_id;
        UPDATE daily_item
           SET state = ITEM_STATE_CHANGE.state
        WHERE period_item_id = j.period_item_id;
    END LOOP;
    
    -- delete/insert periods after current one
    FOR i IN (  SELECT production_period_id, start_date, to_char(start_date,'dd') start_day, to_char(end_date,'dd') end_day
                  FROM production_period
                 WHERE department_id = ITEM_STATE_CHANGE.department_id
                   AND end_date > v_new_min_date )
    LOOP
        -- si es inactivacion, elimino
        IF ITEM_STATE_CHANGE.state = 'I' THEN
            FOR j IN ( SELECT * 
                         FROM period_item
                        WHERE production_period_id = i.production_period_id
                          AND item_id = ITEM_STATE_CHANGE.item_id )
            LOOP
                DELETE daily_item
                 WHERE period_item_id = j.period_item_id;
                DELETE period_item
                 WHERE period_item_id = j.period_item_id;
            END LOOP;
        -- si es activacion, inserto
        ELSE            
            INSERT INTO period_item (   period_item_id, item_id, 
                                        production_period_id, quantity, 
                                        production_index, state )
            VALUES (    period_item_seq.nextval, ITEM_STATE_CHANGE.item_id,
                        i.production_period_id, 0,
                        0, 'A' );
            -- insert into daily_item
            FOR x in i.start_day .. i.end_day
            LOOP
                INSERT INTO daily_item (DAILY_ITEM_ID, PERIOD_ITEM_ID, DAY, QUANTITY, STATE)
                VALUES ( daily_item_seq.NEXTVAL, period_item_seq.currval, i.start_date + x - 1, 0, 'A');
            END LOOP;
            
        END IF;
    END LOOP;
END ITEM_STATE_CHANGE;
/

--------------------------------------------------------
--  DDL for Procedure NEW_EMPLOYEE
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."NEW_EMPLOYEE" (
    employee_id             employee.employee_id%TYPE,
    employee_category_id    employee.employee_category_id%TYPE )
AS 
    v_schedule_period_id        schedule_period.schedule_period_id%TYPE;
    v_department_id             schedule_period.department_id%TYPE;
    
    
    PROCEDURE insert_payroll_by_period (
        payroll_period_id        production_period.production_period_id%TYPE,
        start_date                  production_period.start_date%TYPE )
    IS
    BEGIN
        INSERT INTO biweekly_payroll (
            biweekly_payroll_id, payroll_period_id,
            employee_id, hours,
            state )
        VALUES (
            biweekly_payroll_seq.NEXTVAL, insert_payroll_by_period.payroll_period_id,
            NEW_EMPLOYEE.employee_id, 0,
            'A' );
        -- insert daily payroll
        FOR x in 1 .. 14
        lOOP
            INSERT INTO daily_payroll (
                daily_payroll_id, biweekly_payroll_id,
                day, hours,
                state )
            VALUES ( 
                daily_payroll_seq.NEXTVAL, biweekly_payroll_seq.CURRVAL,
                insert_payroll_by_period.start_date + x - 1, 0,
                'A' );
        END LOOP;
    END;
    
BEGIN
    -- FIND DEPARTMENT
    CASE employee_category_id
        WHEN 3 THEN v_department_id := 3;
        WHEN 5 THEN v_department_id := 4;
        WHEN 2 THEN v_department_id := 1;
        WHEN 4 THEN v_department_id := 1;
        ELSE v_department_id := 0;
    END CASE;
    -- INSERT FOR SCHEDULE BUSSINESS
    FOR i IN (SELECT schedule_period_id, start_date
                FROM schedule_period
               WHERE end_date > sysdate
                 AND department_id = v_department_id )
    LOOP
        FOR x in 0 .. 6
        LOOP
            INSERT INTO schedule_day (  SCHEDULE_DAY_ID, SCHEDULE_PERIOD_ID, 
                                        EMPLOYEE_ID, DAY, 
                                        NOTE, STATE	)
            SELECT schedule_day_seq.NEXTVAL, a.schedule_period_id, 
                   NEW_EMPLOYEE.employee_id, i.start_date + x, 
                   NULL, 'A' 
              FROM schedule_period a
             WHERE a.schedule_period_id   = i.schedule_period_id;
        END LOOP;
    END LOOP;

    -- INSERT FOR WORKING HOURS BUSSINESS
    
    --BUSCA EL PERIODO ACTUAL Y FUTUROS
    FOR i IN (  SELECT payroll_period_id, start_date
                  FROM payroll_period
                 WHERE department_id = v_department_id
                   AND SYSDATE < end_date   )
    LOOP
        insert_payroll_by_period(i.payroll_period_id, i.start_date );
    END LOOP;
    
END NEW_EMPLOYEE;
/

--------------------------------------------------------
--  DDL for Procedure NEW_ITEM
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."NEW_ITEM" (
    item_id             item.item_id%TYPE,
    department_id       item.department_id%TYPE )
AS 

    PROCEDURE insert_item_by_period (
        production_period_id        production_period.production_period_id%TYPE,
        start_date                  production_period.start_date%TYPE,
        start_day                   NUMBER,
        end_day                     NUMBER )
    IS
    BEGIN
        INSERT INTO period_item ( period_item_id, item_id, 
                                    production_period_id, quantity, 
                                    production_index, state )
        VALUES (    period_item_seq.nextval, NEW_ITEM.item_id,
                    insert_item_by_period.production_period_id, 0,
                    0, 'A' );
        -- insert into daily_item
        FOR x in start_day .. end_day
        LOOP
            INSERT INTO daily_item (DAILY_ITEM_ID, PERIOD_ITEM_ID, DAY, QUANTITY, STATE)
            VALUES ( daily_item_seq.NEXTVAL, period_item_seq.currval, insert_item_by_period.start_date + x - 1, 0, 'A');
        END LOOP;
    END;
    
BEGIN
    --BUSCA EL PERIODO ACTUAL Y FUTUROS
    FOR i IN (  SELECT production_period_id, start_date, to_char(start_date,'dd') start_day, to_char(end_date,'dd') end_day
                  FROM production_period
                 WHERE department_id = NEW_ITEM.department_id
                   AND (SYSDATE < end_date)   )
    LOOP
        insert_item_by_period(i.production_period_id, i.start_date, i.start_day, i.end_day);        
    END LOOP;
END NEW_ITEM;
/

--------------------------------------------------------
--  DDL for Procedure PAYROLL_DETAIL_CREATION
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."PAYROLL_DETAIL_CREATION" (
    start_date                  DATE,
    department_id               department.department_id%TYPE ) 
IS
    v_payroll_period_id         payroll_period.payroll_period_id%TYPE;
    v_biweekly_payroll_id       biweekly_payroll.biweekly_payroll_id%TYPE;
    v_hour_factor               param_value.value%TYPE;
BEGIN
    v_payroll_period_id := payroll_period_seq.NEXTVAL;
    v_biweekly_payroll_id := biweekly_payroll_seq.NEXTVAL;
    -- hour factor
    SELECT value
      INTO v_hour_factor
      FROM param_value
     WHERE parameter = 'LABOR_FACTOR';
    -- insert payroll_period
    INSERT INTO payroll_period (
        payroll_period_id, payroll_period,
        start_date, end_date,
        hour_factor, hours,
        state, department_id )
    VALUES ( 
        v_payroll_period_id, v_payroll_period_id,
        start_date, start_date + 13,
        v_hour_factor, 0,
        'A', PAYROLL_DETAIL_CREATION.department_id);
    -- insert biweekly_payroll
    FOR i IN (  SELECT employee_id
                  FROM employee 
                 WHERE employee_category_id = DECODE(PAYROLL_DETAIL_CREATION.department_id,1,4,4,5,PAYROLL_DETAIL_CREATION.department_id)
                   AND state = 'A')
    LOOP
        v_biweekly_payroll_id := biweekly_payroll_seq.NEXTVAL;
        INSERT INTO biweekly_payroll (
            biweekly_payroll_id, payroll_period_id,
            employee_id, hours,
            state )
        VALUES (
            v_biweekly_payroll_id, v_payroll_period_id,
            i.employee_id, 0,
            'A' );
        -- insert daily payroll
        FOR x in 1 .. 14
        lOOP
            INSERT INTO daily_payroll (
                daily_payroll_id, biweekly_payroll_id,
                day, hours,
                state )
            VALUES ( 
                daily_payroll_seq.NEXTVAL, v_biweekly_payroll_id,
                start_date + x - 1, 0,
                'A' );
        END LOOP;
    END LOOP;

END PAYROLL_DETAIL_CREATION;
/

--------------------------------------------------------
--  DDL for Procedure PAYROLL_PERIOD_CREATION
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."PAYROLL_PERIOD_CREATION" (
    period_date                 DATE,
    department_id               department.department_id%TYPE ) 
IS
    v_start_date                DATE;
    v_first_date                DATE:=TRUNC(TO_DATE('12022023','ddmmyyyy'));
    v_pp_exists                 NUMBER(2):=0;
    period_before               NUMBER := 0;
BEGIN
    -- calcula start_date
    -- calculate when is monday
    SELECT TRUNC((period_date) - to_char(period_date, 'D') + 1) INTO v_start_date FROM DUAL;
    -- 
    IF (v_start_date < v_first_date) THEN
        RETURN;
    END IF;

    -- Check period existance
    WHILE (v_start_date >= v_first_date AND v_pp_exists = 0)
    LOOP
        -- try to insert a previous period
        IF period_before = 1 THEN
            PAYROLL_PERIOD_CREATION(v_start_date, department_id);
        END IF;
        -- find a period
        SELECT count(1)
          INTO v_pp_exists
          FROM payroll_period
         WHERE start_date       =   v_start_date
           AND department_id    =   PAYROLL_PERIOD_CREATION.department_id;
        IF (v_pp_exists = 0 AND v_start_date <> v_first_date) THEN 
            v_start_date := v_start_date - 7;
            SELECT count(1)
              INTO v_pp_exists
              FROM payroll_period
             WHERE start_date       =   v_start_date
               AND department_id    =   PAYROLL_PERIOD_CREATION.department_id;
            IF v_pp_exists = 0 THEN
                v_start_date := v_start_date - 7;
                period_before := period_before + 1;
            END IF;
        ELSIF v_pp_exists = 0 AND v_start_date = v_first_date THEN 
            exit;
        END IF;
        -- insert tables

    END LOOP;
    -- 
    dbms_output.put_line(v_pp_exists || '-' ||period_before);
    IF (v_pp_exists = 0 AND period_before = 1) THEN
        -- insert with v_start_date (it found minimal date 12/02/2023)
        dbms_output.put_line('op1'||to_char(v_start_date,'dd/mm/yyyy hh24miss'));
        PAYROLL_DETAIL_CREATION(start_date=>v_start_date,department_id=>department_id );
        -- insert with v_start_date + 14        
        PAYROLL_DETAIL_CREATION(start_date=>v_start_date+14,department_id=>department_id );
    ELSIF (v_pp_exists = 1 AND period_before = 1) THEN
        dbms_output.put_line('op2'||to_char(v_start_date,'dd/mm/yyyy hh24miss'));
        -- insert with v_start_date + 14
        PAYROLL_DETAIL_CREATION(start_date=>v_start_date+14,department_id=>department_id );
    ELSIF (v_pp_exists = 1 AND period_before = 0) THEN
        dbms_output.put_line('op3'||to_char(v_start_date,'dd/mm/yyyy hh24miss'));
        -- exit
        null;
    ELSIF (v_pp_exists = 0 AND period_before = 0 ) THEN
        -- insert with start_date only (first_date)
        dbms_output.put_line('op4'||to_char(v_start_date,'dd/mm/yyyy hh24miss'));
        PAYROLL_DETAIL_CREATION(start_date=>v_start_date,department_id=>department_id );
    END IF;

    --


END PAYROLL_PERIOD_CREATION;
/

--------------------------------------------------------
--  DDL for Procedure PRODUCTION_PERIOD_CREATION
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."PRODUCTION_PERIOD_CREATION" (
    period_date             DATE, 
    department_id           department.department_id%TYPE )
IS
    v_exists                    NUMBER;
    v_labor_factor              param_value.VALUE%TYPE;
    v_start_date                number;
    v_end_date                  number;
    v_production_period_id      production_period.production_period_id%TYPE;
    e_not_current_month         EXCEPTION;
BEGIN
    -- validar que existe el periodo, sino enviar 0
    SELECT COUNT(1) 
      INTO v_exists
      FROM production_period
     WHERE start_date       =   TRUNC(period_date,'MM')
       AND department_id    =   production_period_creation.department_id;

    -- si no existe
    IF v_exists = 0 THEN
    -- validar si es el mes en curso
        IF TRUNC(period_date,'MM') != TRUNC(sysdate,'MM') THEN
            RAISE e_not_current_month;
        END IF;
    -- get production_index
        SELECT value 
          INTO v_labor_factor
          FROM param_value 
         WHERE parameter = 'LABOR_FACTOR';
    -- insert on production_period
        v_production_period_id := production_period_seq.NEXTVAL;
        INSERT INTO production_period ( 
            PRODUCTION_PERIOD_ID, PRODUCTION_PERIOD, 
            START_DATE, END_DATE, 
            PRODUCTION_INDEX, QUANTITY, 
            LABOR_FACTOR, department_id, 
            STATE)
        VALUES ( 
            v_production_period_id, v_production_period_id, 
            TRUNC(period_date,'MM'), LAST_DAY(period_date), 
            0, 0, 
            v_labor_factor, production_period_creation.department_id, 
            'A');

    -- insert on period_item
        INSERT INTO period_item ( PERIOD_ITEM_ID, ITEM_ID, PRODUCTION_PERIOD_ID, QUANTITY, PRODUCTION_INDEX, STATE	)
        SELECT period_item_seq.NEXTVAL, item_id, production_period_id, 0, 0, 'A' 
          FROM (
                    SELECT b.item_id, a.production_period_id
                      FROM production_period a, item b
                     WHERE b.state = 'A'
                       AND a.production_period_id   = v_production_period_id
                       AND b.department_id          = production_period_creation.department_id
                     ORDER BY 2);
    -- insert on daily_item
        SELECT to_char(start_date,'dd'), to_char(end_date,'dd')
          INTO v_start_date, v_end_date
          FROM production_period
         WHERE production_period_id = v_production_period_id;
        --dbms_output.put_line(v_start_date);
        --dbms_output.put_line(v_end_date);
        FOR x in v_start_date .. v_end_date
        LOOP
            INSERT INTO daily_item (DAILY_ITEM_ID, PERIOD_ITEM_ID, DAY, QUANTITY, STATE)
            SELECT hhms.daily_item_seq.NEXTVAL, period_item_id, start_date, 0, 'A'
              FROM (
                        SELECT a.period_item_id, b.start_date + x - 1 start_date
                          FROM period_item a, production_period b
                         WHERE a.production_period_id = b.production_period_id
                           AND b.production_period_id = v_production_period_id
                         ORDER BY b.start_date + x - 1, a.period_item_id);
        END LOOP;
    END IF;
    EXCEPTION
        WHEN e_not_current_month THEN
            NULL;
END production_period_creation;
/


--------------------------------------------------------
--  DDL for Procedure RESET_ROOM
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."RESET_ROOM" AS 
BEGIN

    UPDATE room 
       SET employee_id = NULL,
           room_status_id = 4;
       
END RESET_ROOM;
/

--------------------------------------------------------
--  DDL for Procedure SCHEDULE_PERIOD_CREATION
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE "HHMS"."SCHEDULE_PERIOD_CREATION" (
    period_date                 DATE,
    department_id               department.department_id%TYPE ) 
IS
    v_sp_exists                 NUMBER(2);
    v_e_exists                  NUMBER(2);
    v_schedule_period_id        schedule_period.schedule_period_id%TYPE;
    v_start_date                DATE;
    v_end_date                  DATE;
BEGIN
    -- calculate start date / end date
    SELECT TRUNC((period_date) - to_char(period_date, 'D') + 1) INTO v_start_date FROM DUAL;
    v_end_date := TRUNC(v_start_date + 6);

    -- validar que existe el periodo, sino enviar 0
    SELECT COUNT(1) 
      INTO v_sp_exists
      FROM schedule_period
     WHERE start_date       =   v_start_date
       AND department_id    =   SCHEDULE_PERIOD_CREATION.department_id;
    -- verifica  si hay empleados para ese periodo y departamento
    SELECT COUNT(1) 
      INTO v_e_exists
      FROM employee
     WHERE employee_category_id = DECODE (SCHEDULE_PERIOD_CREATION.department_id,  1, DECODE(employee_category_id,2,2,4,4,0), 3, 3, 4, 5, 0)
       AND state IN ('A','H');

    -- if period doesn't exists OR there are available employees
    IF (v_sp_exists = 0 AND v_e_exists > 0) THEN
        /*-- validar si es el mes en curso
        IF TRUNC(period_date,'MM') != TRUNC(sysdate,'MM') THEN
            RAISE e_not_current_month;
        END IF;*/

        -- insert on schedule_period
        v_schedule_period_id := schedule_period_seq.NEXTVAL;
        INSERT INTO schedule_period ( 
            SCHEDULE_PERIOD_ID, SCHEDULE_PERIOD, 
            START_DATE, END_DATE, 
            department_id, STATE )
        VALUES ( 
            v_schedule_period_id, v_schedule_period_id, 
            v_start_date, v_end_date, 
            SCHEDULE_PERIOD_CREATION.department_id, 'A');
        --

        FOR x in 0 .. 6
        LOOP
            INSERT INTO schedule_day (  SCHEDULE_DAY_ID, SCHEDULE_PERIOD_ID, 
                                        EMPLOYEE_ID, DAY, 
                                        NOTE, STATE	)
            SELECT schedule_day_seq.NEXTVAL, schedule_period_id, 
                   employee_id, v_start_date + x, 
                   NULL, 'A' 
             FROM (
                    SELECT b.employee_id, a.schedule_period_id
                      FROM schedule_period a, employee b
                     WHERE b.state IN ('A','H')
                       AND a.schedule_period_id   = v_schedule_period_id
                       AND b.employee_category_id = DECODE (SCHEDULE_PERIOD_CREATION.department_id,  1, DECODE(b.employee_category_id,2,2,4,4,0), 3, 3, 4, 5, 0)
                     ORDER BY 2);
        END LOOP;
    END IF;

END SCHEDULE_PERIOD_CREATION;
/
