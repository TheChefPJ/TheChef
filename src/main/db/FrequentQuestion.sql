select * from frequent_question;
drop table frequent_question;

create table frequent_question(
	FQ_NO NUMBER primary key ,
	FQ_CATEGORY varchar2(50),
	FQ_TITLE VARCHAR2(500),
	FQ_Contents VARCHAR2(4000)
);


drop sequence frequent_question_seq;
create sequence frequent_question_seq;
insert into frequent_question values(frequent_question_seq.nextVal,'카테코리', '타이틀','내용' )

