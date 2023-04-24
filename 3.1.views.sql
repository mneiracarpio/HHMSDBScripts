CREATE OR REPLACE VIEW hhms.daily_item_plain_report
AS
SELECT c.daily_item_id, a.production_period_id, d.name item_name, a.production_index production_period_index, a.quantity production_period_quantity,
       b.quantity item_quantity, b.production_index item_index, 
       c.day, c.quantity daily_item_quantity
  FROM production_period a, period_item b, daily_item c, item d
 WHERE a.production_period_id = b.production_period_id
   AND b.period_item_id = c.period_item_id
   AND d.item_id = b.item_id;
/

CREATE OR REPLACE VIEW hhms.payroll_x_employee
as
  select  b.biweekly_payroll_id, a.payroll_period_id, a.start_date, a.end_date, a.hour_factor, 
  b.hours biweekly_hours, b.labor_index biweekly_labor_index,
  a.hours total_hours, a.labor_index total_labor_index,
  b.employee_id
  from payroll_period a, biweekly_payroll b
 where a.payroll_period_id = b.payroll_period_id;
/


create view hhms.reset_authentication_log_vw 
AS
select a.reset_authentication_log_id, a.log_time, b.description, c.first_name, c.last_name, a.email
  from reset_authentication_log a, operation b, manager c
 where a.operation_id = b.operation_id
   and c.manager_id(+) = a.manager_id;
