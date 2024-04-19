CREATE TABLE departments#
( department_id    NUMBER(4)
                   CONSTRAINT departments_pk PRIMARY KEY,
  department_name  VARCHAR2(30)
                   CONSTRAINT department_name_not_null NOT NULL
                   CONSTRAINT department_name_unique UNIQUE,
  manager_id       NUMBER(6)
)
/
