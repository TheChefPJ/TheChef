<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>관심상품</title>
<script type="text/javascript">
   
   function check() { //전체선택
      cbox = aform.chk;
      if (cbox.length) {//여러개인 경우
         for (var i = 0; i < cbox.length; i++) {
            cbox[i].checked = aform.allc.checked;
         }
      } else { //한개인 경우
         cbox.checked=true;
          //alert(cbox.value);
      }
   }

   function send() { // 필수동의항목 체크
      var result = "";
      var count = 0;
      var p_code = [];
      var j = 0;
      var url = "";
      var q = confirm("정말 삭제하시겠습니까?");
      if (q == true) {
         alert("삭제되었습니다.");
         if(aform.chk.length){//체크박스가 여러개인 경우
            for (i = 0; i < document.aform.chk.length; i++) {//전체 체크되어 있는 거 검색
               if (document.aform.chk[i].checked) {//체크 박스에 체크되어 있다면,
                  p_code[j] = document.aform.chk[i].value;//p_code배열에 그 값을 넣는다.
                  j++;
                  //location.href="deleteFavoriteForm.do?p_code[]=" + document.aform.chk[i].value;   
               }
            }//for
         } else {//체크박스가 한개인 경우
               p_code[0] = aform.chk.value;
         }
         //alert(document.aform.chk.length);
         
         url = "deleteCart?";
         for (i = 0; i < p_code.length; i++) {
            url += "f_no=";
            url += p_code[i];
            if (i < p_code.length - 1) {
               url += "&";
            }
            location.href = url;
         }
      } else {
         window.close();
      }
   }
   
   function removeCart(fno){
      var result = "";
         var count = 0;
         var p_code = [];
         var j = 0;
         var url = "";
         var q = confirm("정말 삭제하시겠습니까?");
         if (q == true) {
            alert("삭제되었습니다.");
            
            p_code[0] = fno;
            //alert(document.aform.chk.length);
            
            url = "deleteCart?f_no=" + p_code[0];
            location.href = url;
         } else {
            window.close();
         }
   }
</script>
</head>
<body>
   <c:if test="${count1==0}">
      <center>
         <table id="table2">
            <tr>
               <td colspan="4">관심상품 목록에 저장된 상품이 없습니다.</td>
            </tr>
         </table>
      </center>
   </c:if>

   <c:if test="${count1>0}">
   
   <form name="aform">
   <div class="container">
      <div class="row">
         <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th colspan="8" height="50px" class="text-center"><big><b>장바구니</b></big></th>
                  </tr>
                  <tr>
                     <th class="text-center"><input type="checkbox" name="allc" onclick="check();"><br>선택</th>
                     <th class="text-center">상품<br>번호</th>
                     <th class="text-center">상품사진</th>
                     <th class="text-center">상품명</th>
                     <th class="text-center">개수</th>
                     <th class="col-sm-2 col-md-2 text-center">가격</th>
                     <th class="text-center">총 합계</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="list" items="${ searchOnePageList }">
                  <tr>
                     <td class="col-sm-5 col-md-4" style="text-align: center">
                        <input type="checkbox" name="chk" value="${list.fno}"> <!-- 체크박스 -->
                     </td>
                     <td class="col-sm-4 col-md-2"> <!-- 상품번호 -->
                        <div class="media" style="text-align: center">
                            ${list.fno}
                        </div>
                     </td>
                     <td class="col-sm-4 col-md-2"> <!-- 상품 이미지 -->
                        <div class="media">
                           <img alt="상품이미지" src="upload/RTP/${list.p_thumbFile}"  width="200" height="150">
                        </div>
                     </td>
                     <td class="col-sm-2 col-md-2" style="text-align: center"> <!-- 상품명 -->
                        <a href="../content/content.do?p_code=${list.fno}"><big><b>${list.p_title}</b></big></a>
                           <br> <br> <small> Category >> ${list.p_category1}</small>
                     </td>
                     <td class="col-sm-2 col-md-2" style="text-align: center"> <!-- 개수 -->
                        <%-- <input type="email" class="form-control" id="exampleInputEmail1"
                        value="${list.total_count}"> --%>
                        ${list.total_count}개
                     </td>
                     <td class="col-sm-2 col-md-2 text-center">${list.p_price}<strong></strong></td> <!-- 가격 -->
                     <td class="col-sm-2 col-md-2 text-center"><strong>${list.total_price}</strong></td> <!-- 총 합계 -->
                     <td class="col-sm-2 col-md-2">
                        <button type="button" class="btn btn-danger" onclick="removeCart(${list.fno})">
                           <span class="glyphicon glyphicon-remove"></span> Remove
                        </button>
                     </td>
                  </tr>
                  </c:forEach>
                  <tr align="center">
                  <td colspan="8" >
                     <!-- 페이지 카운트 --> 
                     <c:if test="${count1>0 || count2>0}">
                        <c:set var="pageCount" value="${Allcount / pageSize + ( Allcount % pageSize == 0 ? 0 : 1 )}"></c:set>
                        <%-- <c:out value="pageCount: ${pageCount}"></c:out> --%>

                        <c:set var="startPage" value="${1}"></c:set>
                        <c:set var="pageBlock" value="${5}"></c:set>


                        <fmt:parseNumber var="result" value="${currentPage/pageBlock}"
                           integerOnly="true"></fmt:parseNumber>
                        <%-- <c:out value="result: ${result}"></c:out> --%>

                        <c:if test="${currentPage%pageBlock !=0 }">
                           <c:set var="startPage" value="${result*pageBlock+1}"></c:set>
                           <%-- <c:out value="currentPage%pageBlock!= 0 startPage: ${startPage}"></c:out> --%>
                        </c:if>

                        <c:if test="${currentPage%pageBlock==0}">
                           <c:set var="startPage" value="${(result-1)*pageBlock+1}"></c:set>
                           <%-- <c:out value="currentPage%pageBlock!=0 startPage: ${startPage}"></c:out> --%>
                        </c:if>

                        <c:set var="endPage" value="${startPage+pageBlock-1}"></c:set>
                        <%-- <c:out value="endPage: ${endPage}"></c:out> --%>

                        <c:if test="${endPage>pageCount}">
                           <c:set var="endPage" value="${pageCount}"></c:set>
                           <%-- <c:out value="endPage>pageCount endPage: ${endPage}"></c:out> --%>
                        </c:if>

                        <c:if test="${startPage>5}">
                           <a href="cartList?pageNum=${startPage-5}">[이전]</a>
                        </c:if>

                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                           <a href="cartList?pageNum=${i}">[${i}]</a>
                        </c:forEach>

                        <c:if test="${endPage<pageCount}">
                           <a href="cartList?pageNum=${startPage+5}">[다음]</a>
                        </c:if>
                     </c:if>
                     <br><br><br>
                  </td>
               </tr>
                  <tr>
                     <td> </td>
                     <td> </td>
                     <td> </td>
                     <td>
                        <button type="button" class="btn btn-default" onclick="javascript:document.location='index'">
                           <span class="glyphicon glyphicon-shopping-cart"></span>
                           Continue Shopping
                        </button>
                     </td>
                     <td>
                        <button type="button" class="btn btn-default" onclick="send()">
                           <span class="glyphicon glyphicon-shopping-cart"></span>
                           Delete
                        </button>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </div>
   </form>
   </c:if>
</body>
</html>