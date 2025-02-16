# CODES FOR CASE 2

show databases;
use project3;
create table users(
user_id int,
created_at varchar(100),
company_id int,
language varchar(50),
activated_at varchar(100),
state varchar(50));
show variables like 'secure_file_priv';
load data infile "C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/users.csv"
into table users
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
alter table users add column temp_created_at datetime;
set sql_safe_updates = 0;
update users set temp_created_at = str_to_date(created_at, '%d-%m-%Y %H:%i');
set sql_safe_updates = 1;
alter table users drop column created_at;
alter table users change column temp_created_at created_at datetime;
create table events(
user_id int,
occurred_at varchar(100),
event_type varchar(50),
event_name varchar(100),
location varchar(50),
device varchar(50),
user_type int);
show variables like 'secure_file_priv';
load data infile "C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/events.csv"
into table events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
alter table events add column temp_occurred_at datetime;
set sql_safe_updates = 0;
update events set temp_occurred_at = str_to_date(occurred_at, '%d-%m-%Y %H:%i');
set sql_safe_updates = 1;
alter table events drop column occurred_at;
alter table events change column temp_occurred_at occurred_at datetime;

create table email_events(
user_id int,
occurred_at varchar(100),
action varchar(100),
user_type int );
show variables like 'secure_file_priv';
load data infile "C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/email_events.csv"
into table email_events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
alter table email_events add column temp_occurred_at datetime;
set sql_safe_updates = 0;
update email_events set temp_occurred_at = str_to_date(occurred_at, '%d-%m-%Y %H:%i');
set sql_safe_updates = 1;
alter table email_events drop column occurred_at;
alter table email_events change column temp_occurred_at occurred_at datetime;
