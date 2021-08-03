--liquibase formatted sql

--changeset TsviZ:create_TABLE_categories runwith:sqlplus 
CREATE TABLE categories
( category_id int NOT NULL,
  category_name char(50) NOT NULL,
  CONSTRAINT categories_pk PRIMARY KEY (category_id)
);
quit;
--rollback drop TABLE categories;

--changeset TsviZ:insert_INTO_categories runwith:sqlplus
INSERT INTO categories
(category_id, category_name)
VALUES
(150, 'Miscellaneous');
quit;
--rollback delete from categories where category_id=150;

--changeset TsviZ:select_from_categories runwith:sqlplus runOnChange:true
set lines 256
set trimout on
set tab off
set pagesize 100
set trimspool on
spool categories.csv

SELECT * FROM categories;
quit;
--rollback select * from categories;

--changeset TsviZ:insert_INTO_EMPLOYEES runwith:sqlplus runOnChange:true
-- ALTER SESSION ENABLE PARALLEL DML;

INSERT /*+ parallel(8) enable_parallel_dml */ INTO EMPLOYEES (employee_id, last_name, email, 
      hire_date, job_id, salary, commission_pct, department_id) 
   VALUES (205, 'Tsvi', 'szandany@liquibase.com', 
      sysdate, 'ENGINEER', 1.2E3, NULL, 20);
      
INSERT /*+ parallel(8) enable_parallel_dml */ INTO EMPLOYEES (employee_id, last_name, email, 
      hire_date, job_id, salary, commission_pct, department_id) 
   VALUES (206, 'Bill', 'bill@liquibase.com', 
      sysdate, 'ENGINEER', 1.2E3, NULL, 20);
--rollback delete from EMPLOYEES where department_id=20;

--changeset TsviZ:create_function_dept_salary runwith:sqlplus runOnChange:true
CREATE OR REPLACE FUNCTION dept_salary (dnum NUMBER) RETURN NUMBER IS
   CURSOR emp_cursor IS
   select salary, commission_pct from employees where department_id = dnum;
   total_wages NUMBER(11, 2) := 0;
   counter NUMBER(10) := 1;
BEGIN
   FOR emp_record IN emp_cursor LOOP
       emp_record.commission_pct := NVL(emp_record.commission_pct, 0);
       total_wages := total_wages + emp_record.salary
                   + emp_record.commission_pct;
       DBMS_OUTPUT.PUT_LINE('Loop number = ' || counter ||
          '; Wages = '|| TO_CHAR(total_wages)); /* Debug line */
       counter := counter + 1; /* Increment debug counter */
   END LOOP;
   /* Debug line */
   DBMS_OUTPUT.PUT_LINE('Total wages = ' ||
   TO_CHAR(total_wages));
   RETURN total_wages;
END;
/
quit;
--rollback drop function dept_salary;

--changeset TsviZ:exec_dept_salary runwith:sqlplus runOnChange:true
SET SERVEROUTPUT ON
VARIABLE salary NUMBER;
EXECUTE :salary := dept_salary(20);
-- EXEC DBMS_OUTPUT.PUT_LINE(dept_salary(20));
quit;
--rollback select * from employees;

--changeset TsviZ:createView_V_TEST4 runwith:sqlplus runOnChange:true
SET DEFINE ON
CREATE OR REPLACE VIEW &SCHEMA_OWNER..V_TEST4 AS

SELECT uwi, well_name

  FROM well;

EXIT;