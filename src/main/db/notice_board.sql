
drop table notice_board;
select * from notice_board;

create table notice_board(
	N_NO NUMBER primary key,
	N_TITLE VARCHAR2(500),
	N_WRITER varchar2(50),
	N_REGDATE TIMESTAMP,
	N_Hit number(30),
	N_Contents VARCHAR2(4000)
);


drop sequence notice_board_seq;
create sequence notice_board_seq;
insert into notice_board values(notice_board_seq.nextVal, '타이틀', '롸이터', sysdate,0,'내용' )

