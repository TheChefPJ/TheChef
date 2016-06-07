drop table farm;
create table farm(
	farm_no number primary key,
	farm_id varchar2(1000),
	farm_name varchar2(1000)
);
select * from farm;

create table event_comment(
	E_NO NUMBER ,
	COMMENT_SEQ VARCHAR2(50),
	COMMENT_NAME VARCHAR2(50),
	COMMENT_COMM VARCHAR2(500),
	COMMENT_REGDATE DATE,
	CONSTRAINT FK_event_comment FOREIGN KEY(E_NO)
	REFERENCES event_board(E_NO)
);
drop sequence  COMMENT_SEQ_seq;
create sequence COMMENT_SEQ;

