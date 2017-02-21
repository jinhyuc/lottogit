create table tbl_user (
	uid varchar(50) not null,
    upw varchar(50) not null,
    uname varchar(100) not null,
    uphonenum varchar(20),
    upoint int not null default 0,
    primary key(uid)
);

select * from tbl_user;

delete from tbl_user
where uid='hyucs21';

alter table tbl_user add column
sessionkey varchar(100) not null default 'none';

alter table tbl_user add column
sessionlimit timestamp;

create table tbl_store (
	storeid int not null auto_increment,
	title varchar(50) not null,
	category varchar(50),
	description varchar(200),
	telephone varchar(20),
	address varchar(100),
	roadAddress varchar(100),
	lat double not null,
	lon double not null, 
	wcount1 int not null default 0,
	wcount2 int not null default 0,
    primary key(storeid)
);


desc tbl_store;