-- grants fro app_data

GRANT CREATE SESSION TO app_data;
GRANT CREATE TABLE, CREATE VIEW, CREATE TRIGGER, CREATE SEQUENCE TO app_data;

GRANT CREATE SESSION TO app_code;
GRANT CREATE PROCEDURE TO app_code;
GRANT CREATE SYNONYM TO app_code;

GRANT CREATE SESSION TO app_admin;
GRANT CREATE PROCEDURE TO app_admin;
GRANT CREATE SYNONYM TO app_admin;

GRANT CREATE SESSION TO app_user;
GRANT CREATE SYNONYM TO app_user;
