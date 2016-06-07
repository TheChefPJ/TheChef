<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript">
   function recipe_cart(p_no, p_price) { 
	  var quantity = document.getElementById("quantity").value;
      location.href="recipe_cart?p_no=" + p_no + "&p_price=" + p_price + "&quantity=" + quantity; 
   }
   
   function login(){
       alert("로그인을 해주세요. 로그인 페이지로 이동합니다");
       window.location = "login";
   }
   
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
	   
	   function writeReview(p_no,code) { 
		      location.href="review_write?p_no=" + p_no + "&code=" + code; 
		}
	   
	   function checkOut(){
		   var quantity = document.getElementById("quantity").value;
		   var p_no = document.getElementById("p_no").value;
		   var p_price = document.getElementById("p_price").value;
		   var code = document.getElementById("code").value;
		   var p_thumbFile = document.getElementById("p_thumbFile").value;
		   
		   location.href="check_out?quantity=" + quantity + "&p_no=" + p_no + "&p_price=" + p_price + "&code=" + code + "&p_thumbFile=" + p_thumbFile;
	   }
</script>
</head>

<c:forEach var="list" items="${ list }">
<div class="container-fluid">
   <div class="content-wrapper">
      <div class="item-container">
         <div class="container">
            <div id="product_img" class="col-md-12">
               <div class="product col-md-5 service-images">
                  <center>
                     <img id="item-display" src="upload/RTP/${list.p_thumbFile}" alt="레시피/테마"></img>
                  </center>
               </div>
            </div>

            <div id="product_list" class="col-md-7">
               <div class="product-title" style="font-size: 20px;">${list.p_title}</div>
               <div class="product-desc">
               		<c:if test="${code==1}">
               			Recipe >> ${list.p_category1}
               		</c:if>
               		<c:if test="${code==2}">
               			Theme >> ${list.p_category1}
               		</c:if>
               
               </div>
               <hr>
               <div class="product-price">$ ${list.p_price}
               		<c:if test="${list.p_price >= 10000}">
               			<font size="3px" style="font-family:Gulim;">(배송비 : 무료) </font>
               		</c:if>
               		<c:if test="${list.p_price < 10000 }">
               			<font size="3px" style="font-family:Gulim;">(배송비 : 2,500원) </font>
               		</c:if><h6>10,000원 이상 구매 시, 배송비 <font color="red">무료</font> 입니다.</h6>
               </div>
               <hr>
               <div>
               		<select class="selectpicker show-menu-arrow" name="quantity" id="quantity" style="width: 180px; height: 35px;">
					  <option selected="selected" value="1">1개</option>
					  <option value="2">2개</option>
					  <option value="3">3개</option>
					</select>
			   <hr>
               </div>
               		<se:authorize access="isAnonymous()"> <!-- 로그인을 하지 않았는데 장바구니 담기 클릭시 로그인 페이지로 넘어감 -->
	               		<button type="button" class="btn btn-default" onclick="login()">
	                           <span class="glyphicon glyphicon-shopping-cart"></span>장바구니 담기
	               		</button>
               		</se:authorize>
               		<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')"> <!-- 로그인 후 장바구니 담기를 클릭하였을 때 -->
               			<button type="button" class="btn btn-default" onclick="recipe_cart(${list.p_no},${list.p_price})">
	                           <span class="glyphicon glyphicon-shopping-cart"></span>장바구니 담기
	               		</button>
               		</se:authorize>
               <input type="hidden" id="p_no" value="${list.p_no}"/>
               <input type="hidden" id="p_price" value="${list.p_price}"/>
               <input type="hidden" id="code" value="${code}"/>
               <input type="hidden" id="p_thumbFile" value="${list.p_thumbFile}"/>
               
               <div class="btn-group wishlist">
               		<se:authorize access="isAnonymous()"> <!-- 로그인을 하지 않았는데 결제하기 클릭시 로그인 페이지로 넘어감 -->
	               		 <button type="button" class="btn btn-danger" onclick="login()">구매하기</button>
               		</se:authorize>
               		<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')"> <!-- 로그인 후 결제하기를 클릭하였을 때 -->
               			<button type="button" class="btn btn-danger" onclick="checkOut()">구매하기</button>
               		</se:authorize>
               </div>
            </div>
         </div>
      </div>
      <div class="container-fluid">
         <div class="col-md-12 product-info">
            <ul id="myTab" class="nav nav-tabs nav_tabs">

               <li class="active"><a href="#service-one" data-toggle="tab">DESCRIPTION</a></li>
               <li><a href="#service-two" data-toggle="tab">PRODUCT INFO</a></li>
               <li><a href="#service-three" data-toggle="tab">REVIEWS</a></li>

            </ul>
            <div id="myTabContent" class="tab-content">
               <div class="tab-pane fade in active" id="service-one">

                  <section class="container product-info text-center">
                  		<img id="item-display" src="upload/RTP/${list.p_contentFile}" alt="contents"></img>
                  </section>
                  <br><br>
                  <div class="text-center">
                  	<iframe width="560" height="330" src="https://www.youtube.com/embed/${list.p_src}" frameborder="0" allowfullscreen></iframe>
                  </div>

               </div>
               <div class="tab-pane fade" id="service-two">

                  <section class="container">
                     <p>HI</p>
                  </section>

               </div>
               <div class="tab-pane fade" id="service-three">
               		<!-- 리뷰부분 -->
               		
   <form name="aform">
   <div class="container">
      <div class="row">
         <div class="col-sm-12 col-md-10 col-md-offset-1">
         <br><br>
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th colspan="3" height="50px"><big><b>일반 상품평</b></big></th>
                     <se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')">
						<th><button type="button" class="btn btn-default" onclick="writeReview(${list.p_no},${code})">
                           <span class="glyphicon glyphicon-shopping-cart"></span>
                           		글쓰기
                        </button>
                     	</th>
				 	 </se:authorize>
                  </tr>

						<c:if test="${count1==0}">
							<center>
								<table id="table2">
									<tr>
										<td colspan="4" class="text-center col-sm-2 col-md-2">저장된 리뷰가 없습니다.</td>
									</tr>
								</table>
							</center>
							<br><br><br><br>
						</c:if>
						
			   <c:if test="${count1>0}">
			   	  <se:authorize access="hasRole('ROLE_ADMIN')">
					<tr>
                    	<th class="text-center"><input type="checkbox" name="allc" onclick="check();"><br>선택</th>
                 	</tr>
				  </se:authorize>
				  
               </thead>
               <tbody>
                  <c:forEach var="list2" items="${ searchOnePageList }">
                  <tr>
                  	 <se:authorize access="hasRole('ROLE_ADMIN')">
						<td class="col-sm-1 col-md-1" style="text-align: center">
                        	<input type="checkbox" name="chk" value="${list2.r_no}"> <!-- 체크박스 -->
                     	</td>
					 </se:authorize>
                     <td class="col-sm-2 col-md-2" style="text-align: center"> <!-- 평점 -->
                     	<c:if test="${list2.score==5}"><big><b style="color:#FF4040;">★★★★★</b></big></c:if>
                     	<c:if test="${list2.score==4}"><big><b style="color:#FF4040;">★★★★</b></big></c:if>
                     	<c:if test="${list2.score==3}"><big><b style="color:#FF4040;">★★★</b></big></c:if>
                     	<c:if test="${list2.score==2}"><big><b style="color:#FF4040;">★★</b></big></c:if>
                     	<c:if test="${list2.score==1}"><big><b style="color:#FF4040;">★</b></big></c:if>
                     </td>
                     <td class="col-sm-10 col-md-8"> <!-- 상품명 -->
                        <big><b>${list2.r_title}</b><br></big>
                        <br><small> ${list2.r_review}</small>
                     </td>
                     <se:authorize access="!hasRole('ROLE_ADMIN')">
						<td></td>
				     </se:authorize>
				     <td class="col-sm-8 col-md-6">작성자 : ${list2.id}<br>
                     	등록일 : ${list2.reg_date}
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
               </tbody>
                </c:if>
            </table>
         </div>
      </div>
   </div>
   </form>
  
               		<!-- 리뷰부분 끝 -->
               </div>
            </div>
            <hr>
         </div>
      </div>
   </div>
</div>
</c:forEach>
</html>