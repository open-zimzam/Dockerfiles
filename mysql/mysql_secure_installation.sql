SET PASSWORD=PASSWORD('follow-the-white-rabbit');

-- Set password for all root users
-- do the old password
SET SESSION old_passwords=1; UPDATE mysql.user SET Password=PASSWORD('follow-the-white-rabbit'), password_expired='N' WHERE User='root' and plugin = 'mysql_old_password';

-- do the native password
SET SESSION old_passwords=0; UPDATE mysql.user SET Password=PASSWORD('follow-the-white-rabbit'), password_expired='N' WHERE User='root' and plugin in ('', 'mysql_native_password');

-- do the sha256 password
SET SESSION old_passwords=2; UPDATE mysql.user SET authentication_string=PASSWORD('follow-the-white-rabbit'), password_expired='N' WHERE User='root' and plugin = 'sha256_password';

-- remove anonymous users
DELETE FROM mysql.user WHERE User='';

-- remove remote root
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

-- remove test database and privileges
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

-- create database 'data' and user 'data'
CREATE DATABASE IF NOT EXISTS data;

-- TODO: replace hardcoded password
GRANT USAGE ON *.* TO data@'%' IDENTIFIED BY 'follow-the-white-rabbit';
GRANT ALL PRIVILEGES ON data.* TO data@'%';

-- reload privilege tables
FLUSH PRIVILEGES;


