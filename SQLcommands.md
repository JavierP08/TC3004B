How to change user password
-- CHANGE PASSWORD
ALTER USER ADMIN IDENTIFIED BY Chavis160102;

-- REST ENABLE
BEGIN
    ORDS_ADMIN.ENABLE_SCHEMA(
        p_enabled => TRUE,
        p_schema => 'ADMIN',
        p_url_mapping_type => 'BASE_PATH',
        p_url_mapping_pattern => 'admin',
        p_auto_rest_auth=> FALSE
    );
    -- ENABLE DATA SHARING
    C##ADP$SERVICE.DBMS_SHARE.ENABLE_SCHEMA(
            SCHEMA_NAME => 'ADMIN',
            ENABLED => TRUE
    );
    commit;
END;
/

