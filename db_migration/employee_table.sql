CREATE TABLE employees#
( employee_id     NUMBER(6)
                  CONSTRAINT employees_pk PRIMARY KEY,
  first_name      VARCHAR2(20)
                  CONSTRAINT emp_first_name_not_null NOT NULL,
  last_name       VARCHAR2(25)
                  CONSTRAINT emp_last_name_not_null NOT NULL,
  email_addr      VARCHAR2(25) 
                  CONSTRAINT emp_email_addr_not_null NOT NULL,
  hire_date       DATE
                  DEFAULT TRUNC(SYSDATE)
                  CONSTRAINT emp_hire_date_not_null NOT NULL
                  CONSTRAINT emp_hire_date_check
                    CHECK(TRUNC(hire_date) = hire_date),
  country_code    VARCHAR2(5)
                  CONSTRAINT emp_country_code_not_null NOT NULL,
  phone_number    VARCHAR2(20)
                  CONSTRAINT emp_phone_number_not_null NOT NULL,
  job_id          CONSTRAINT emp_job_id_not_null NOT NULL
                  CONSTRAINT emp_jobs_fk REFERENCES jobs#,
  job_start_date  DATE
                  CONSTRAINT emp_job_start_date_not_null NOT NULL,
                  CONSTRAINT emp_job_start_date_check
                    CHECK(TRUNC(JOB_START_DATE) = job_start_date),
  salary          NUMBER(6)
                  CONSTRAINT emp_salary_not_null NOT NULL,
  manager_id      CONSTRAINT emp_mgr_to_empno_fk REFERENCES employees#,
  department_id   CONSTRAINT emp_to_dept_fk REFERENCES departments#
)
/
