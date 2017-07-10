create role repmgr with SUPERUSER LOGIN;
create database repmgr;
ALTER USER repmgr SET search_path TO repmgr_test, "$user", public;