--liquibase formatted sql

--changeset TsviZ:createTableWell runwith:sqlplus
CREATE TABLE well
 (
   well_name VARCHAR2(10 BYTE) NOT NULL,
   uwi NUMBER(6, 0),
   MAX_SALARY NUMBER(6, 0),
   CONSTRAINT well_name_PK PRIMARY KEY (well_name)
 )
;

EXIT;
--rollback drop table well;


--changeset TsviZ:createView_V_TEST4 runwith:sqlplus runOnChange:true
DEFINE tbl = well
DEFINE SCHEMA_OWNER = HR_TEST
SET DEFINE ON
CREATE OR REPLACE VIEW &SCHEMA_OWNER..V_TEST4 AS

SELECT uwi, well_name FROM &tbl;

EXIT;
--rollback drop VIEW V_TEST4;