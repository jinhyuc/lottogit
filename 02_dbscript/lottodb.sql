create table tbl_user (
	uid varchar(50) not null,
    upw varchar(50) not null,
    uname varchar(100) not null,
    uphonenum varchar(20),
    upoint int not null default 0,
    primary key(uid)
);

alter table tbl_user add column
sessionkey varchar(100) not null default 'none';

alter table tbl_user add column
sessionlimit timestamp;