-- liquibase formatted sql changeLogId:81e3bcd0-4a4c-4292-aa2c-6e8a33d18b8c

--changeset SteveZ:45555-createTable_TABLE200
CREATE TABLE TABLE200
 (
   JOB_ID VARCHAR2(10 BYTE) NOT NULL,
   MIN_SALARY NUMBER(6, 0),
   MAX_SALARY NUMBER(6, 0),
   CONSTRAINT JOB_ID_PK200 PRIMARY KEY (JOB_ID)
 )
;
--rollback drop table TABLE200
