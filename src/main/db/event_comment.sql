drop table event_comment;

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


select * from event_comment;
drop table board_comment;
s
insert into event_comment values(notice_board_seq.nextVal, 'WRITER', 'COMMENT', sysdate )

select * from event_comment, event_board where event_comment.E_NO = event_board.E_NO;