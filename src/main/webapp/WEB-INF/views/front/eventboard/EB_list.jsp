<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
 -->
<title>kosta th109</title>

<style> 
#wrap{
   width:80%; 
   margin: 0; 
   margin-right: auto;
   margin-left: auto;
   
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
    position: relative;
    right: 10px;
    top: 0px;
    float: right;

}
ul.breadcrumb li {
    float: left;
    font-size: 13px;
}
ul.breadcrumb li a {
    color: #888;
    padding: 0 0 0 22px;
}
h1{
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 100%;
    font-weight: normal;
    vertical-align: baseline;
    background: }
</style>



</head>
<body> 
   <div id="wrap" class="table">
   <ul class="breadcrumb sub_content">
          <li><a href="/">홈</a></li>
          <li><a href="">고객센터</a></li>
          <li><a href="">공지사항</a></li>
      </ul>
      <h1 class="subtlt_h1">이벤트 </h1>
      
      
      
      <table width = "100%" class="nb" >
         
           <thead >
           <tr class="thead-inverse"> 
            <th width="7%">번호</th>
            <th width="30%">제목</th>
            <th width="20%">작성자</th>
            <th width="23%">작성일</th>
            <th width="10%">조회수</th>
         </tr>
         </thead>
         <c:forEach items="${ list }" var="dto">
            <tr>                  
               <td>${dto.e_no }</td>
               <td><a href="EB_content_view?e_no=${dto.e_no }">${dto.e_title }</a></td>
               <td>${dto.e_writer }</td>
               <td>${fname}</td>
               <td>${dto.e_hit }</td>
            </tr>
         </c:forEach>   
      </table>
      
   <!-- 페이징 table -->
         <table width="100%">
            <tr>
               <td align="center">
                  <!-- 처음 이전 링크 --> 
                  <c:if test="${pg>block}">
                     <a href="EB_list?pg=${fromPage-1}"><img
                        src="<c:url value='resources/img/arrowsleft.gif'/>"></a>
                     <a href="EB_list?pg=${pg-1}"><img
                        src="<c:url value='resources/img/arrowleft.gif'/>"></a>
                  </c:if> 
                  <c:if test="${pg<=block}">
                      <c:if test="${pg>1}">
                           <img src="<c:url value='resources/img/arrowsleft.gif'/>">
                           <a href="EB_list?pg=${pg-1}">
                           <img
                          src="<c:url value='resources/img/arrowleft.gif'/>"></a>
                      </c:if>   
                      
                      <c:if test="${pg==1}">
                      		<c:if test="${allPage >=1 }">
		                        <img src="<c:url value='resources/img/arrowsleft.gif'/>">
		                        <img src="<c:url value='resources/img/arrowleft.gif'/>"> 
		                    </c:if>
                     </c:if>
                  </c:if> 
                  <!-- 블록 범위 찍기 --> 
                  <c:forEach begin="${fromPage}" end="${toPage}"
                     var="i">
                     <c:if test="${i==pg}"><font color="green">${i}</font></c:if>
                     <c:if test="${i!=pg}">
                        <a href="EB_list?pg=${i}">${i}</a>
                     </c:if>
                  </c:forEach>  
                  <!-- 다음, 이후 --> 
                  <c:if test="${toPage<allPage}">
                     <!-- 20<21 : true -->
                     <a href="EB_list?pg=${pg+1}"><img
                        src="resources/img/arrowright.gif"></a>
                     <a href="EB_list?pg=${toPage+1}"><img
                        src="resources/img/arrowsright.gif"></a>
                  </c:if> 
                  
                  <c:if test="${toPage>=allPage}">
                       <c:if test="${pg<allPage }">
                           <a href="EB_list?pg=${pg+1}"><img
                        src="resources/img/arrowright.gif"></a>
                        <img src="resources/img/arrowsright.gif">
                       </c:if>
                       <c:if test="${pg==allPage }">
                       <img src="resources/img/arrowright.gif">
                       <img src="resources/img/arrowsright.gif">
                    </c:if>
                  </c:if>
               </td>
            </tr>
         </table> 
   </div>
   
</body>
</html>

