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

#uc3
insert into address_book (fname, lname, address, city, state, zip, phone, email)
    -> values
    -> ('Omkeshwari', 'Pilare', 'Kasturi Kunj, Sion', 'Mumbai', 'Maharashtra', 400022, 9876543210, 'omp@gmail.com');
select * from address_book;
insert into address_book (fname, lname, address, city, state, zip, phone, email)
    -> values
    -> ('Suruchi', 'Pilare', 'Maheshwari, Matunga', 'Mumbai', 'Maharashtra', 400018, 9876987600, 'abc@gmail.com');
insert into address_book (fname, lname, address, city, state, zip, phone, email)
    -> values
    -> ('Soni', 'Pilare', 'MIDC, Chakan', 'Pune', 'Maharashtra', 400784, 9988776655, 'ksp@gmail.com');
insert into address_book (fname, lname, address, city, state, zip, phone, email)
    -> values
    -> ('Piyush', 'Pilare', 'Gandhi square', 'Surat', 'Gujarat', 500084, 9900711655, 'plzz@gmail.com');
select * from address_book;

#uc4
update address_book
    -> set phone = 9969646413
    -> where fname = 'Piyush';
select * from address_book;
update address_book
    -> set lname = 'Shelar'
    -> where fname = 'Soni' ;
select * from address_book;

#uc5
delete from address_book
    -> where fname = 'Suruchi';
select * from address_book;

#uc6
select * from address_book
    -> where city = 'Mumbai' or state = 'Maharashtra';
select * from address_book
    -> where city = 'Pune' or state = 'Gujarat';

#uc7
select city, state, count(*)
    -> from address_book
    -> group by city, state;