<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   <head>
   <link href="resources/css/bootstrap.min.css" rel="stylesheet">
   <link href="resources/css/recipe.css" rel="stylesheet">
   
   </head>
<!DOCTYPE htmL>
<header>
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

#content {
   width: 920px;
   padding: 50px 50px 100px;
}

fieldset {
   border: 0;
   display: block;
}

div {
   display: block;
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
</header>
<html>
<body>
   <div id="product_register_content">

      <div class="top_nav" position="relative"    display=inline_block;>
         <div  display= inline_block;>
            <h2>골라담기 상품 수정</h2>
         </div>
      </div>
      <br>


      <div id="content" class="form">

         <form action="farmProduct_update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="statusType">
            <fieldset class="fieldSet_value">
               <h3 class="">기본 정보</h3>
               <h4 class="">
                  <label>카테고리명</label>
               </h4>
               <select name="s_category" required="required" class="form-control-category">
                  <option value="" >골라담기 카테고리</option>
                  <option value="정육" <c:if test="${updateList.s_category eq '정육'}">selected="selected"</c:if>>정육</option>
                  <option value="야채" <c:if test="${updateList.s_category eq '야채'}">selected="selected"</c:if>>야채</option>
                  <option value="과일" <c:if test="${updateList.s_category eq '과일'}">selected="selected"</c:if>>과일</option>
                  <option value="유제품" <c:if test="${updateList.s_category eq '유제품'}">selected="selected"</c:if>>유제품</option>
               </select>
               <h4 class=""><label>상품명</label></h4>
               <input type="text" id="farm_name" title="상품명" value="${updateList.s_title}" maxlength="100" size="100" class="form-control"  name="s_title" required="required"> 
               <strong class="nameRealLength" >/100</strong>
               
               <h4 class=""><label>상품번호</label></h4>
               <input type="text" name="s_no" id="farm_no" title="상품번호" value="${updateList.s_no}" maxlength="100" size="100" disabled="disabled">
               
               <h4 class=""><label>상품가격</label></h4>
               <input type="text" name="s_price" id="farm_price" title="상품가격" value="${updateList.s_price}" maxlength="100" size="100" required="required">
                  
               <h4 class=""><label>상품상세이미지</label></h4>
               <input type="file" name="files[0]" required="required">
               <h4 class=""><label>상품썸네일이미지</label></h4>
               <input type="file" name="files[1]" required="required">
               <input type ="hidden" value="${updateList.s_no}" name ="s_no">   
               <input type="hidden" value="${searchRange}" name="searchRange">
               <input type="hidden" value="${searchNo}" name="searchNo">
               <input type="hidden" value="${searchTitle}" name="searchTitle">
               <input type="hidden" value="${searchWriter}" name="searchWriter">
               <input type="hidden" value="${searchCategory}" name="searchCategory">
               <input type="hidden" value="${searchKeyword}" name="searchKeyword">
               <input type="hidden" value="${startRegdate}" name="startRegdate">
               <input type="hidden" value="${endRegdate}" name="endRegdate">
               <br><br>
               <div>
                  <input type="submit" class="btn_type2" value="상품수정"> 
                  <input type="reset" class="btn_type2" value="취소"> 
               </div>
            </fieldset>
         </form>
      </div>
   </div>
</body>
</html>