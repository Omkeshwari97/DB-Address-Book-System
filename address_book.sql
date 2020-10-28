show databases;

#uc1
create database addressbook_service;
show databases;
use addressbook_service;

#uc2
create table address_book(
    -> fname varchar(100) not null,
    -> lname varchar(100) not null,
    -> address varchar(200) not null,
    -> city varchar(50) not null,
    -> zip numeric(6) not null,
    -> phone numeric(10) not null,
    -> email nvarchar(255) not null,
    -> primary key(fname, lname)
    -> );
desc address_book;
alter table address_book
    -> add state varchar(60) not null
    -> after city;
desc address_book;