<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta th109</title>

<style> 
#wrap{
   width:1200px; 
   margin: 0; 
   margin-right: auto;
   margin-left: auto;
   
}

table.nb {
   /*  margin : auto;  */
   
   border-collapse:collapse;
   font-size:0.8em;
   border:none;
   border-top:2px solid #333;
   border-bottom:1px solid #999;
}
table.nb th, table.nb td {
   padding: 8px 10px;
   text-align:center;   
}
table.nb tr {
   border-bottom:1px solid #CCC;
}
table.nb tr:first-child{ 
   background-color: #f2f2f2
}
table.nb tr:last-child {
   border-bottom:none;
}

</style>

</head>
<body>

   <div id="wrap" class="table">  
      <table width="100%"  class="nb">
         <form action="NB_modify_view" method="post">
            <input type="hidden" name="n_no" value="${content_view.n_no}">
         <thead >
           <tr class="thead-inverse"> 
            <th width="40%">제목</th>
            <th width="30%">작성자</th>
            <th width="30%">작성일</th>
         </tr>
         </thead>
            
            <tr>
               <td>${content_view.n_title}</td>
               <td>${content_view.n_writer}</td>
               <td>${fname}</td>
            </tr>
            <tr>
               <td colspan="3">
                  ${content_view.n_contents}
               </td>
            </tr>
            
            <tr>
               <td colspan="3">  
                  <%-- <input type="submit" value="수정">&nbsp;&nbsp;
                  <input type="button" value="삭제" onclick="location.href='NB_delete?n_no=${content_view.n_no}'"> --%>
                  <input type="button" value="목록보기" onclick="location.href='NB_list'">
               </td>
            </tr>
         </form>
      </table>
      
      <form action="NB_content_view_comment" method="post">
		<div class="CenterGo" >
			<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')"><!-- 권한을 검사한다. 관리자나 일반 사용자, 판매자일 경우 -->
			<se:authentication property="name" var="LoginUser" />
							<div align="center">
				<div id="guestBook_upload">
					<input type="hidden" name="n_no" value="${content_view.n_no}"/>
					<input type="hidden" name="comment_name" value="${LoginUser}"/>
					<input type="hidden" name="comment_seq" value="${LoginUser}"/>
					
					<input type="text" name ="comment_comm" style="height:35px; width:400px; display: inline-block;" placeholder="하고싶은 말을 작성해주세요." class="form-control"/>
					<input type="submit" value="올리기" class="btn btn-default">
				</div>
			</div>
      		</se:authorize>
      	</div>
      	<table class="bbsTable table-condensed table-bordered table-hover" id="guestBook_tab" align="center" width="60%" cellpadding="0" cellspacing="0">
						
						 <c:forEach var="ListComment" items="${ListComment}"> 
							<tr align="center">
								<%-- <td width="5%">
									<c:out value="${number}"/>
									<c:set var="number" value="${number-1}"/>
								</td> --%>
															
								<td width="30%">
									${ListComment.comment_name}	
								</td>
								<td width="60%">
									${ListComment.comment_comm}						
								</td>
								<td width="30%">
									
								<%-- 	<c:if test="${m_id==guestBook.my_id}"> --%>
											<input onclick="location.href='CM_delete?n_no=${content_view.n_no}&comment_seq=${ListComment.comment_seq}'" type="button" value="삭제" >
									<%-- </c:if> --%>
									
								</td>
							</tr>	
						 </c:forEach> 
					
					</table>	
      </form>
</div>
</body>
</html>

