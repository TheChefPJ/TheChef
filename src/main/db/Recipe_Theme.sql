drop table recipe_theme_Products;

create table recipe_theme_Products(
	p_title varchar2(1000),
	id varchar2(100),
	p_no varchar2(1000) primary key,
	p_contentFile varchar2(2000),
	p_thumbFile varchar2(2000),
	p_price number,
	p_regdate date,
	p_category1 varchar2(100),
	p_category2 varchar2(100)
);
select * from recipe_theme_Products;

--기본키는 p_no 상품번호, id는 글작성하는 관리자id
--id는 member테이블을 참조한 외래키 
--p_no는 관리자 재고를 참조한 외래키
--p_contentFile 컨텐츠부분을 사진으로 넣는다고 했으니까 이부분은 사진이 저장되는거임!
--p_thumbFile 썸네일로 보여줄 사진 저장
--p_price 판매가
--p_regdate 글등록시간
--p_category1 카테고리1_레시피카테고리
--p_category2 카테고리2_테마카테고리


--update recipe_theme_Products 
--      set p_title='1', p_contentFile='1', p_thumbFile='1', p_price=1, p_category1='카테고리1', p_category2='카테고리2' where p_no='005'
