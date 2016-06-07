<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.container_bg2 .wrap .content.sub {
    position: relative;
    float: right;
    width: 700px;
    padding: 50px 50px;
    min-height: 300px;
}
.content {
    position: relative;
    width: 980px;
    margin: 0 auto;
    overflow: hidden;
}
h1.subtlt_h1 {
    clear: both;
    font-size: 24px;
    font-family: NanumBold, sans-serif;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
    margin-bottom: 50px;
}
ul.breadcrumb.sub_content {
    position: absolute;
    right: 50px;
    top: 60px;
    float: right;
}
ol, ul, dl {
    list-style: none;
}

</style>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>



<!--  ajax 문법
<script type="text/javascript">
   $.ajax({
        url: 'FQ_list?category=주문/결제',
        type: 'GET',
        data: 'twitterUsername=jquery4u',
        success: function(data) {
         //called when successful
         $('body').html(data);
        },
      });
</script> 
--> 
<script type="text/javascript"> 
$(document).ready(function(){
   $(".list1").click(function(){ 
       $.get("FQ_list", function(list){
          $('body').html(list);
          $('.category1').attr("class","active");
       });
   });
});
$(document).ready(function(){
   $(".list2").click(function(){ 
       $.get("FQ_list?category=회원가입/계정정보", function(list){
          $('body').html(list);
          $('.category2').attr("class","active");
       });
   });
});
$(document).ready(function(){
   $(".list3").click(function(){ 
       $.get("FQ_list?category=주문/결제", function(list){
          $('body').html(list);
          $('.category3').attr("class","active");
       });
   });
});
$(document).ready(function(){
   $(".list4").click(function(){ 
       $.get("FQ_list?category=배송", function(list){
          $('body').html(list);
          $('.category4').attr("class","active");
       });
   });
});
$(document).ready(function(){
   $(".list5").click(function(){ 
       $.get("FQ_list?category=취소/교환/반품", function(list){
          $('body').html(list);
          $('.category5').attr("class","active");
       });
   });
});
</script> 

<script>
$(document).ready(function(){ 
    $(".title_toggle").click(function(){ 
       $(".hm").hide();
        $(this).parents('tr').next().show();
    });
});
</script>

</script> 

<body>
   <div class="content sub">
      <h1 class="subtlt_h1">자주 하는 질문</h1>
      <ul class="breadcrumb sub_content">
           <li><a href="">홈</a></li>
           <li><a href="">고객센터</a></li>
           <li><a href="">자주 하는 질문</a></li>
       </ul>
       <div class="board board_list">
       <!-- <div class="container-fluid"> -->
         <div class="col-md-12 product-info">
            <ul id="myTab" class="nav nav-tabs nav_tabs">

               <li class="category1"><a href="#service-one" data-toggle="tab" class="list1">모두 보기</a></li>
               <li class="category2"><a href="#service-two" data-toggle="tab" class="list2">회원가입/계정정보</a></li>
               <li class="category3"><a href="#service-three" data-toggle="tab" class="list3">주문/결제</a></li>
               <li class="category4"><a href="#service-four" data-toggle="tab" class="list4">배송</a></li>
               <li class="category5"><a href=#service-five"" data-toggle="tab" class="list5">취소/교환/반품</a></li> 
               
            </ul>
            <div id="myTabContent" class="tab-content">
               <div class="tab-pane fade in active" id="service-one">

                  <section class="container product-info">
                  
                  <table>
                        <colgroup>
                           <col width="50px">
                           <col width="150px"> 
                           <col width="*">
                        </colgroup>
                        
                        <c:forEach items="${ list }" var="dto">
                        
                        <tr class="normal_row">
                           <td class="no">${ dto.fq_no}</td>
                           <td class="category">${ dto.fq_category}</td>
                           <td class="title_toggle">${dto.fq_title }</td> 
                        </tr>
                        
                        <tr class="hm" style="display: none;" > 
                           <td colspan="3">
                              <div class="content">
                                 ${dto.fq_contents }
                              </div>
               
                              <div class="btns right">
                                 <a href="javascript:mariExec('write@del','7','3')">삭제</a> <a
                                    href="javascript:mariExec('write@write@edit','7','3')">수정</a>
                              </div>
                           </td>
                        </tr>
                        </c:forEach>
                     </table>
                     <button><a href="FQ_write_view" style="text-decoration:none">글쓰기</a></button>
                  
                  </section>

               </div>
            </div>
            <hr>
         </div>
      </div>
    </div>

</body>
</html>

