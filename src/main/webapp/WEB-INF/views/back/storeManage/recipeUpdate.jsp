<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE htmL>
<style>
.top_nav {
    position: relative;
    z-index: 110;
    width: 100%;
    min-width: 1020px;
    height: 100px;
    background: #00d2b9;
    top: 40px;
    padding: 20px 30px 20px 50px;
    align: float;
    
}
.top_nav .fr {
    width: auto;
    height: 40px;
}
.fr {
    float: right !important;
}
.top_nav .save {
    border-color: #00a894;
    background: #00b5a6;
}
.top_nav .btn_type2 {
    width: 70px;
    height: 20px;
    padding-top: 10px;
    font-weight: bold;
    line-height: 12px;
}
.btn_type2 {
    display: inline-block;
    border: 1px solid #25baa8;
    border-radius: 2px;
        text-align: center;
    color: #fff;
        zoom: 1;
}
#content{
    width: 920px;
    padding: 50px 50px 100px;
}
fieldset {
    border: 0;
        display: block;
}
div{
   display:block;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}
.filebox label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}
.form-control-category {
    display: inline_block;
    width: 30%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
</style>
<html>
	<div id="product_register_content">
		<div class="top_nav" position="relative">
				<div align="float">
				<h2>레시피 상품 수정</h2>
				</div>
				<div class="fr">
					<div class="save">
						<a href="#" class="btn_type2">저장</a>
					</div>
				</div>
		</div>
		<br>
				
		<div id="content" class="form">
			<form action="RTP_update" method="post" enctype="multipart/form-data">	
				<input type="hidden" name="statusType">
					<fieldset class="fieldSet_value">
						<h3 class="">기본 정보</h3>
						<h4 class=""><label>카테고리명</label></h4>
						<select name="p_category1" required="required" class="form-control-category">
                           <option value="">레시피카테고리</option>
                           <option value="밥" <c:if test="${updateList.p_category1 eq '밥'}">selected="selected"</c:if> >밥</option>
                           <option value="국/찌개" <c:if test="${updateList.p_category1 eq '국/찌개'}">selected="selected"</c:if>>국/찌개</option>
                           <option value="밑반찬" <c:if test="${updateList.p_category1 eq '밑반찬'}">selected="selected"</c:if>>밑반찬</option>
                           <option value="메인반찬" <c:if test="${updateList.p_category1 eq '메인반찬'}">selected="selected"</c:if>>메인반찬</option>
                           <option value="일품요리" <c:if test="${updateList.p_category1 eq '일품요리'}">selected="selected"</c:if>>일품요리</option>
                           <option value="간식" <c:if test="${updateList.p_category1 eq '간식'}">selected="selected"</c:if>>간식</option>
                           <option value="기타" <c:if test="${updateList.p_category1 eq '기타'}">selected="selected"</c:if>>기타</option>
                        </select> 
                       <select name="p_category2" required="required" class="form-control-category">
                           <option value="">테마카테고리</option>
                           <option value="한잔의 술상" <c:if test="${updateList.p_category2 eq '한잔의 술상'}">selected="selected"</c:if>>한잔의 술상</option>
                           <option value="달콤한 오후" <c:if test="${updateList.p_category2 eq '달콤한 오후'}">selected="selected"</c:if>>달콤한 오후</option>
                           <option value="사랑을 담은 밥상" <c:if test="${updateList.p_category2 eq '사랑을 담은 밥상'}">selected="selected"</c:if>>사랑을 담은 밥상</option>
                           <option value="혼자 먹는 밥상" <c:if test="${updateList.p_category2 eq '혼자 먹는 밥상'}">selected="selected"</c:if>>혼자 먹는 밥상</option>
                           <option value="웰빙&다이어트" <c:if test="${updateList.p_category2 eq '웰빙&다이어트'}">selected="selected"</c:if>>웰빙&다이어트</option>
                           <option value="아이를 위한 밥상" <c:if test="${updateList.p_category2 eq '아이를 위한 밥상'}">selected="selected"</c:if>>아이를 위한 밥상</option>
                           <option value="재료하나 愛">재료하나 愛</option>
                        </select>
                        
                        <h4 class=""><label>상품명</label></h4>
                  		<input type="text" id="pro_name" title="상품명" name="p_title"  maxlength="100" size="100" value="${updateList.p_title}" required="required">
                  		<strong class="nameRealLength">/100</strong>
                  
                  		<h4 class=""><label>상품번호</label></h4>
                  		<input type="text" name="p_no" id="pro_no" title="상품번호" value="${updateList.p_no}" disabled="disabled">
                  
                  		<h4 class=""><label>상품가격</label></h4>
                  		<input type="text" name="p_price" id="pro_price" title="상품가격" maxlength="100" size="100" required="required" value="${updateList.p_price}" >
                  
                  		<h4 class=""><label>상품상세이미지</label></h4>
                  		<input type="file" name="files[0]" required="required">
                  		<h4 class=""><label>상품썸네일이미지</label></h4>
                  		<input type="file" name="files[1]" required="required">

						<input type ="hidden" value="${updateList.p_no}" name ="p_no">
						<input type="hidden" value="${searchRange}" name="searchRange">
		               <input type="hidden" value="${searchNo}" name="searchNo">
		               <input type="hidden" value="${searchTitle}" name="searchTitle">
		               <input type="hidden" value="${searchWriter}" name="searchWriter">
		               <input type="hidden" value="${searchCategory}" name="searchCategory">
		               <input type="hidden" value="${searchKeyword}" name="searchKeyword">
		               <input type="hidden" value="${startRegdate}" name="startRegdate">
		               <input type="hidden" value="${endRegdate}" name="endRegdate">
						<br><br>						
					</fieldset>
				<div>
					<input type="submit" class="btn_type2" value="상품수정"> 
					<input type="reset" class="btn_type2" value="취소">
				</div>
			</form>
		</div>
	</div>
</html>