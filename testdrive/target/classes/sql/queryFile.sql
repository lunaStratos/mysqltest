
create database mydb;

use mydb;

create table mysql_account(
id varchar(20) primary key,
name varchar(20),
password varchar(20)
);

select id, password from mysql_account;