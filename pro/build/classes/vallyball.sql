create table vmember (
	id varchar(20) primary key,
	pass varchar(20),
	name varchar(20),
	gender int(1),
	tel varchar(15),
	emaile varchar(50),
	birthday varchar(15),
	address varchar(100)
);

select * from vmember

create table board (
	num int primary key,
	writer varchar(30)
);
	