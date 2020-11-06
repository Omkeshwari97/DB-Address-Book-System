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

#uc8
select *
    -> from address_book
    -> where city = 'Mumbai'
    -> order by fname, lname;

#Changed the primary key of address_book table
alter table address_book
    -> add column id integer not null;
desc address_book;
alter table address_book
    -> drop primary key;
desc address_book;
update address_book
    -> set id = 1
    -> where fname = "Omkeshwari";
update address_book
    -> set id = 2
    -> where fname = "Piyush";
update address_book
    -> set id = 3
    -> where fname = "Soni";
update address_book
    -> set id = 4
    -> where fname = "Suruchi";
alter table address_book
    -> add primary key(id);
select * from address_book;
desc address_book;

#uc9
create table address_book_details (
    -> id integer not null auto_increment,
    -> book_name varchar(20) not null,
    -> book_type varchar(20) not null,
    -> primary key(id));

create table book_contact_map(
    -> book_id int not null,
    -> contact_id int not null
    -> );

alter table book_contact_map
    -> add foreign key (book_id) references address_book_details(id);

alter table book_contact_map
    -> add foreign key (contact_id) references address_book(id);	

insert into address_book_details (book_name, book_type)
    -> values
    -> ('A1', 'Family'),
    -> ('A2', 'Friends'),
    -> ('A3', 'Profession');  

insert into book_contact_map
    -> (book_id, contact_id)
    -> values
    -> (1,1),
    -> (1,4),
    -> (2,2),
    -> (2,3),
    -> (3,2),
    -> (3,4);

#uc10
select book_type, count(*) as contact_count
    -> from address_book_details, address_book, book_contact_map
    -> where address_book_details.id = book_contact_map.book_id
    -> and address_book.id = book_contact_map.contact_id
    -> group by(book_type);

#uc11
select fname, book_type
    -> from address_book, address_book_details, book_contact_map
    -> where address_book_details.id = book_contact_map.book_id and
    -> address_book.id = book_contact_map.contact_id;
