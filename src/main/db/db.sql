select * from member;
delete from member;

select * from role;

drop table member;
drop table role;
create table member (
	id varchar2(100) primary key,
	name varchar2(100) not null,
	password varchar2(100) not null,
	gender varchar2(100) not null,
	address varchar2(500) not null,
	phone varchar2(100) not null,
	birth varchar2(100) not null,
	email varchar2(100) not null,
	regdate date default sysdate,
	zip_code varchar2(100) not null
);
CREATE TABLE role (
  id VARCHAR2(100),
  role_name VARCHAR2(30)
);

select * from cart;
create table cart(
  f_no varchar2(100),
  id varchar2(1000),
  reg_date date not null,
  f_total_price number(30),
  f_total_count number(30) default 1
);

insert into member(id,name,password,gender,address,phone,birth,email,zip_code) values ('admin','관리자','1111','women','경기도성남시분당구','01020568213','1992-04-09','baeji49@naver.com','11111');
insert into role values ('admin','ROLE_ADMIN');

---------------------이 부분은 실행 안해도 됩니당-----------------------
foreign key(id) references member(id) on delete cascade

select B.*, rowseq from(
select A.*, rownum as rowseq from (
		select * from (
			select p_thumbFile, fno, fid, p_category1, p_title, reg, total_price,
			total_count, p_price
			from (select p.p_thumbFile, f.f_no as fno, f.id as fid, p.p_category1,
			p.p_title, f.reg_date as reg, f.f_total_price as total_price,
			f.f_total_count as total_count, p.p_price
			from recipe_theme_Products p, cart f where p.p_no=f.f_no and
			f.id='nice9010')
		union all
			select p_thumbFile, fno, fid, p_category1, p_title, reg, total_price,
			total_count, p_price
			from (select p.s_thumbFile as p_thumbFile, f.f_no as fno, f.id as fid,
			p.s_category as p_category1, p.s_title as p_title, f.reg_date as reg,
			f.f_total_price as total_price, f.f_total_count as total_count,
			p.s_price as p_price
			from farm_Products p, cart f where p.s_no=f.f_no and f.id='nice9010')
		) order by reg desc
		)A )B where rowseq between 5 and 10;
-----------------------------------------------------------------------------------------	
		
		
