create table board_comment(
	N_NO NUMBER,
	COMMENT_SEQ VARCHAR2(50),
	COMMENT_NAME VARCHAR2(50),
	COMMENT_COMM VARCHAR2(500),
	COMMENT_REGDATE DATE,
	CONSTRAINT FK_board_comment FOREIGN KEY(N_NO)
	REFERENCES notice_board(N_NO)
	
);
drop sequence  COMMENT_SEQ_seq;
create sequence COMMENT_SEQ;


 select * from board_comment, notice_board where board_comment.N_NO = notice_board.N_NO;

select * from BOARD_COMMENT;
drop table board_comment;

