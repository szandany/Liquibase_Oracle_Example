WHENEVER SQLERROR EXIT 1 ROLLBACK;
WHENEVER OSERROR EXIT 2 ROLLBACK;


create or replace procedure rdm_test_ins (p_id IN NUMBER)
is
begin

insert into rdm_test values (1);
end;
/

show errors
/

