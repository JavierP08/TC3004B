CREATE TABLE jobs#
( job_id      VARCHAR2(10)
              CONSTRAINT jobs_pk PRIMARY KEY,
  job_title   VARCHAR2(35)
              CONSTRAINT jobs_job_title_not_null NOT NULL,
  min_salary  NUMBER(6)
              CONSTRAINT jobs_min_salary_not_null NOT NULL,
  max_salary  NUMBER(6)
              CONSTRAINT jobs_max_salary_not_null NOT NULL
)
/
