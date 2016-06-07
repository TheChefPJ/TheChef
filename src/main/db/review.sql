select * from recipe_review;
drop table recipe_review;
create table recipe_review (
	r_no varchar2(100) not null,
	id varchar2(1000) not null,
	reg_date date default sysdate,
	score number,
	r_review varchar2(1000),
	r_title varchar2(1000)
);

select to_char(sysdate, 'yyyy-mm-dd') from dual;

--r_no : 리뷰할 상품
--id : 리뷰 등록한 id
--reg_date : 리뷰 등록한 시간
--score : 평점
--r_review : 리뷰 내용

-- 구매했을 때의 테이블
select * from check_out;
drop table check_out;
create table check_out (
	c_no varchar2(100) not null,
	id varchar2(1000) not null,
	reg_date date default sysdate,
	c_price number(30),
	count number(30),
	shipping_fee number(30),
	c_total_price number(30),
	c_name varchar2(100),
	c_address varchar2(500) not null,
	c_zip_code varchar2(100) not null,
	c_phone varchar2(100) not null
);

-- c_no : 상품 구매 번호
-- id : 상품 구매 id
-- reg_date : 상품 구매 일시
-- c_price : 상품 가격
-- count : 상품 개수
-- shipping_fee : 배송비
-- c_total_price : 총 가격
-- c_name : 구매자 이름
-- c_address: 받을 사람 주소
-- c_zip_code : 받는 사람 우편번호
-- c_phone : 구매자의 핸드폰 번호