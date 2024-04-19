--liquidbase

--javierperez
CREATE OR REPLACE TRIGGER employees_aiufer
AFTER INSERT OR UPDATE OF salary, job_id ON employees FOR EACH ROW
DECLARE
  l_cnt NUMBER;
BEGIN
  LOCK TABLE jobs IN SHARE MODE;  -- Ensure that jobs does not change
                                  -- during the following query.
  SELECT COUNT(*) INTO l_cnt
  FROM jobs
  WHERE job_id = :NEW.job_id
  AND :NEW.salary BETWEEN min_salary AND max_salary;
 
  IF (l_cnt<>1) THEN
    RAISE_APPLICATION_ERROR( -20002,
      CASE
        WHEN :new.job_id = :old.job_id
        THEN 'Salary modification invalid'
        ELSE 'Job reassignment puts salary out of range'
      END );
  END IF;
END;
/

CREATE OR REPLACE TRIGGER jobs_aufer
AFTER UPDATE OF min_salary, max_salary ON jobs FOR EACH ROW
WHEN (NEW.min_salary > OLD.min_salary OR NEW.max_salary < OLD.max_salary)
DECLARE
  l_cnt NUMBER;
BEGIN
  LOCK TABLE employees IN SHARE MODE;

  SELECT COUNT(*) INTO l_cnt
  FROM employees
  WHERE job_id = :NEW.job_id
  AND salary NOT BETWEEN :NEW.min_salary and :NEW.max_salary;

  IF (l_cnt>0) THEN
    RAISE_APPLICATION_ERROR( -20001,
      'Salary update would violate ' || l_cnt || ' existing employee records' );
  END IF;
END;
/
