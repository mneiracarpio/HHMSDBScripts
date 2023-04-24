delete hhms.daily_item;
delete hhms.period_item;
delete hhms.production_period;

delete  schedule_day;
delete  schedule_period;

commit;


-----------------
execute schedule_period_creation(sysdate-30,1);
execute schedule_period_creation(sysdate-30,3);
execute schedule_period_creation(sysdate-30,4);
execute schedule_period_creation(sysdate,1);
execute schedule_period_creation(sysdate,3);
execute schedule_period_creation(sysdate,4);
commit;

--------------------


create or replace PROCEDURE production_period_creation2 (
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
       AND department_id    =   production_period_creation2.department_id;

    -- si no existe
    IF v_exists = 0 THEN
    -- validar si es el mes en curso
        /*IF TRUNC(period_date,'MM') != TRUNC(sysdate,'MM') THEN
            RAISE e_not_current_month;
        END IF;*/
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
            v_labor_factor, production_period_creation2.department_id, 
            'A');

    -- insert on period_item
        INSERT INTO period_item ( PERIOD_ITEM_ID, ITEM_ID, PRODUCTION_PERIOD_ID, QUANTITY, PRODUCTION_INDEX, STATE	)
        SELECT period_item_seq.NEXTVAL, item_id, production_period_id, 0, 0, 'A' 
          FROM (
                    SELECT b.item_id, a.production_period_id
                      FROM production_period a, item b
                     WHERE b.state = 'A'
                       AND a.production_period_id   = v_production_period_id
                       AND b.department_id          = production_period_creation2.department_id
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
END production_period_creation2;
/

execute production_period_creation2(sysdate-30,1);
execute production_period_creation2(sysdate-30,2);


execute payroll_period_creation(to_date('17022023','ddmmyyyy'), 1);
execute payroll_period_creation(to_date('17022023','ddmmyyyy'), 3);
execute payroll_period_creation(to_date('17022023','ddmmyyyy'), 4);
execute payroll_period_creation(to_date('26022023','ddmmyyyy'), 1);
execute payroll_period_creation(to_date('26022023','ddmmyyyy'), 3);
execute payroll_period_creation(to_date('26022023','ddmmyyyy'), 4);


commit;
