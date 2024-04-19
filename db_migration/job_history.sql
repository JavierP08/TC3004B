CREATE TABLE job_history#
( employee_id  CONSTRAINT job_hist_to_employees_fk REFERENCES employees#,
  job_id       CONSTRAINT job_hist_to_jobs_fk REFERENCES jobs#,
  start_date   DATE
               CONSTRAINT job_hist_start_date_not_null NOT NULL,
  end_date     DATE
               CONSTRAINT job_hist_end_date_not_null NOT NULL,
  department_id
             CONSTRAINT job_hist_to_departments_fk REFERENCES departments#
             CONSTRAINT job_hist_dept_id_not_null NOT NULL,
             CONSTRAINT job_history_pk PRIMARY KEY(employee_id,start_date),
             CONSTRAINT job_history_date_check CHECK( start_date < end_date )
)
/
