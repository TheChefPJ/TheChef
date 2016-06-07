<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

	<div id="container" class="_product_index">
		<div id="content">
			<div >
				<h2 >
					<span>공지사항 관리</span>
				</h2>
				<hr>
				<div class="hd_wrap">
					<h4 class="hd3 fl">공지사항 등록</h4>
					<br>
					<div class="image_form">
						<input type="hidden" name="" class="" value="">
						<div class="filebox file_upload_button">
							 <button><a href="NB_write_view" style="text-decoration:none">글쓰기</a></button>
						</div>


					</div>
				</div>
				<div class="hd_wrap">
					<h4 class="hd3 fl">공지사항 검색</h4>
					<span class="dsc_txt"><span class="f12">※</span> 공지사항을
						검색하세요.</span>
				
				<form action="NB_noticeManage" method="post" class="test">
					<div class="srch_tmp">
						<div>
							<div>
								<input type="hidden" class="">
								<div class="form-group">
						               검색기간 설정 &nbsp;
						               <input type="date" name="dataFrom" id="dateSelect"  class="form-control input-lg"
						                  placeholder="검색기간 설정" >
						               <input type="date" name="dataTo" id="dateSelect" class="form-control input-lg"
						                  placeholder="검색기간 설정" >
						            </div>
						            
									<!-- <button type="button" value="" >오늘</button>
									<button type="button" value="" >1주일</button>
									<button type="button" value="" >1개월</button>
									<button type="button" value="" >3개월<button>
									<button type="button" value="" >6개월</button>
									<button type="button" value="" >1년</button> -->
							</div>
							<div>
								<div class=""
									style="float: left; margin: 0 5px 0 0">
									<select title="1차분류 선택"
										class="_category_selector selectbox-source" name="category_selector">
										<option value="sub" name="category_option">공지사항 제목</option>
										<option value="name" name="category_option">공지사항 번호</option>
									</select> 
										<input type="text" name="dataForSearch"  placeholder="공지사항 제목을 입력하세요." style="width:300px">
								</div> 
									<input type="submit" value="검색">
							</div>
						</div>
					</div>
				</form>
					
				<div class="hd_wrap">
					<h4 class="hd3 fl">공지사항 검색 내역</h4>
					<span class="dsc_txt"><span class="f12">※</span> 등록된 공지사항 내역입니다.</span>
				</div>
				<div class="uio_grid" style="width:100%;height:440px">
					
					<table width = "100%" class="nb" >
         
			           <thead >
			           <tr class="thead-inverse"> 
			            <th width="7%">번호</th>
			            <th width="30%">제목</th>
			            <th width="20%">작성자</th>
			            <th width="23%">작성일</th>
			            <th width="10%">관리</th>
			         </tr>
			         </thead>
			         <c:forEach items="${ list }" var="dto">
			            <tr class="thead-inverse">                  
			               <td>${dto.n_no }</td>
			               <td><a href="NB_content_view?n_no=${dto.n_no }">${dto.n_title }</a></td>
			               <td>${dto.n_writer }</td>
			               <td>${fname }</td>
			               <%-- <td>${dto.n_regdate }</td> --%>
			               <td>
			               		<input type="button" value="삭제" onclick="location.href='NB_delete?n_no=${dto.n_no}'">
                  				<input type="button" value="수정" onclick="location.href='NB_modify_view?n_no=${dto.n_no}'">
                  		   </td>
			            </tr>
			         </c:forEach>   
			      </table>
			      
			    <%--   <a href="noticeList.do?pg=${toPage+1}&mean=chain"> --%>
			      <!-- 페이징 table -->
		         <table width="100%">
		            <tr>
		               <td align="center">
		                  <!-- 처음 이전 링크 --> 
		                  <c:if test="${pg>block}">
		                     <a href="NB_noticeManage?pg=${fromPage-1}&dataFrom=${dataFrom}&dataTo=${dataTo}&category_selector=${category_selector}&category_option=${category_option}&dataForSearch=${dataForSearch}"><img
		                        src="<c:url value='resources/img/arrowsleft.gif'/>"></a>
		                     <a href="NB_noticeManage?pg=${pg-1}&dataFrom=${dataFrom}&dataTo=${dataTo}&category_selector=${category_selector}&category_option=${category_option}&dataForSearch=${dataForSearch}"><img
		                        src="<c:url value='resources/img/arrowleft.gif'/>"></a>
		                  </c:if> 
		                  <c:if test="${pg<=block}">
		                      <c:if test="${pg>1}">
		                           <img src="<c:url value='resources/img/arrowsleft.gif'/>">
		                           <a href="NB_noticeManage?pg=${pg-1}&dataFrom=${dataFrom}&dataTo=${dataTo}&category_selector=${category_selector}&category_option=${category_option}&dataForSearch=${dataForSearch}">
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
		                        <a href="NB_noticeManage?pg=${i}&dataFrom=${dataFrom}&dataTo=${dataTo}&category_selector=${category_selector}&category_option=${category_option}&dataForSearch=${dataForSearch}">${i}</a>
		                     </c:if>
		                  </c:forEach>  
		                  <!-- 다음, 이후 --> 
		                  <c:if test="${toPage<allPage}">
		                     <!-- 20<21 : true -->
		                     <a href="NB_noticeManage?pg=${pg+1}&dataFrom=${dataFrom}&dataTo=${dataTo}&category_selector=${category_selector}&category_option=${category_option}&dataForSearch=${dataForSearch}"><img
		                        src="resources/img/arrowright.gif"></a>
		                     <a href="NB_noticeManage?pg=${toPage+1}&dataFrom=${dataFrom}&dataTo=${dataTo}&category_selector=${category_selector}&category_option=${category_option}&dataForSearch=${dataForSearch}"><img
		                        src="resources/img/arrowsright.gif"></a> 
		                  </c:if> 
		                  
		                  <c:if test="${toPage>=allPage}">
		                       <c:if test="${pg<allPage }">
		                            <a href="NB_noticeManage?pg=${pg+1}&dataFrom=${dataFrom}&dataTo=${dataTo}&category_selector=${category_selector}&category_option=${category_option}&dataForSearch=${dataForSearch}"><img
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
				
			</div>
		</div>
	</div>
</div>
