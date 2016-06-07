select * from event_board;

create table event_board(
	E_NO NUMBER primary key ,
	E_TITLE VARCHAR2(500),
	E_WRITER varchar2(50),
	E_REGDATE TIMESTAMP,
	E_Hit number(30),
	E_Contents VARCHAR2(4000)
);

drop table event_board;
drop sequence event_board_seq;
create sequence event_board_seq;
insert into event_board values(event_board_seq.nextVal, '타이틀', '롸이터', sysdate,0,'내용' )
