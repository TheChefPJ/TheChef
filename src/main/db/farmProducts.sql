drop table farm_Products;

create table farm_Products(
	s_title varchar2(1000),
	id varchar2(100),
	s_no varchar2(1000) primary key,
	s_contentFile varchar2(2000),
	s_thumbFile varchar2(2000),
	s_price number,
	s_regdate date,
	s_category varchar2(100)
);
select * from farm_Products;

--골라담기 게시글
--기본키는 s_no 상품번호, id는 글작성하는 관리자id
--id는 member테이블을 참조한 외래키 
--s_no는 판매자 재고를 참조한 외래키
--s_contentFile 컨텐츠부분을 사진으로 넣는다고 했으니까 이부분은 사진이 저장되는거임!
--s_thumbFile 썸네일로 보여줄 사진 저장
--s_price 판매가
--s_regdate 글등록시간
--s_category 골라담기 카테고리

SELECT s_no FROM farm_Products
UNION
SELECT p_no FROM recipe_theme_Products