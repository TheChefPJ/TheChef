<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<form action="productSelect_Modify" method="post">

	<div id="container" class="_product_index">
		<div id="content">
			<div >
				<h2 >
					<span class="blind">상품정보 조회 / 수정</span>
				</h2>
				<hr>
			</div>
			<div class="blue_box">
				<ul class="case_list">
					<li>
						<strong>전체</strong> 
						<a href="#">${rtpCountAll+farmProductCountAll}</a>건 
						<span class="bar">&nbsp;|&nbsp; </span> 
						
						<strong>레시피 테마</strong> 
						<a href="#">${rtpCountAll}</a>건 
						<span class="bar"> &nbsp;|&nbsp; </span> 
						
						<strong>골라담기</strong> 
						<a href="#">${farmProductCountAll}</a>건
						<span class="bar"> &nbsp;|&nbsp; </span> 
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="span7">
		<div class="widget stacked widget-table action-table" >
			<div class="widget-content" >
				<table class="table table-striped table-bordered" style=" margin-left:40px; padding:20px;">
					<tr>
						<td>검색범위</td>
						<td class="td-actions">
							<div class="_selectbox_auto selectbox-open" style="float: left; margin: 0 5px 0 0">
								<select title="검색범위선택" name="searchRange" class="_category_selector selectbox-source">
									<option value="rangeAll">전체검색</option>
									<option value="recipe_theme_Products">레시피테마</option>
									<option value="farm_Products">골라담기</option>
								</select>
								<div class="selectbox-box" style="width: 140px; padding: 0px; overflow-x: hidden;"></div>
								<input type="hidden" class="_option" value="{}">
							</div>
						</td>
					</tr>
					<tr>
						<td>검색어</td>
						<td class="td-actions">
							<input type="checkbox" name="searchNo" value="searchNo" checked> 상품코드
							<input type="checkbox" name="searchTitle" value="searchTitle" checked> 상품명
							<input type="checkbox" name="searchWriter" value="searchWriter" checked> 작성자ID
							<input type="checkbox" name="searchCategory" value="searchCategory" checked> 카테고리
							<br> 
							<input type="text" maxlength="50" name="searchKeyword"
								placeholder="검색내용 입력" title="검색 내용 입력" />
							<span class="_validation_message_layer_base txt"></span>
						</span></td>
					</tr>
					<tr>
						<td>기간</td>
						<td class="td-actions">
							<div>			
								<div class="form-group">
									상품등록일 &nbsp;
									<input type="date" name="startRegdate" id="dateSelect"  class="form-control input-lg" placeholder="검색기간 설정">
									<input type="date" name="endRegdate" id="dateSelect" class="form-control input-lg" placeholder="검색기간 설정">
								</div>
							</div>			
						</td>
					</tr>
				</table>
			</div>
			<!-- /widget-content -->
			<input type="submit" class="btn_type2" value="상품정보조회">	
		</div>
		<!-- /widget -->
	</div>
		<div>
		<table width="80%" class="nb">
				<thead>
					<tr class="thead-inverse">
						<th width="5%">번호</th>
						<th width="13%">작성자ID</th>
						<th width="20%">제목</th>
						<th width="10%">가격</th>
						<th width="10%">등록일자</th>
						<th width="12%">레시피 카테고리</th>
						<th width="12%">테마 카테고리</th>
						<th width="12%">골라담기 카테고리</th>
					</tr>
				</thead>
				<c:forEach items="${search_onePageList}" var="list">
					<tr class="thead-inverse">
						<td>${list.no}</td>
						<td>${list.id}</td>
						<td>${list.title}</td>
						<td>${list.price}</td>
						<td>${list.regdate}</td>
						<td>${list.category1}</td>
						<td>${list.category2}</td>
						<td>${list.category3}</td>
						<td>
							<c:if test="${list.category1!=' '}">
								<input type="button" value="삭제" onclick="location.href='RTP_delete?p_no=${list.no}&searchRange=${searchRange}&searchNo=${searchNo}&searchTitle=${searchTitle}&searchWriter=${searchWriter}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&startRegdate=${startRegdate}&endRegdate=${endRegdate}'">
								<input type="button" value="수정" onclick="location.href='RTP_updateView?p_no=${list.no}&searchRange=${searchRange}&searchNo=${searchNo}&searchTitle=${searchTitle}&searchWriter=${searchWriter}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&startRegdate=${startRegdate}&endRegdate=${endRegdate}'">
							</c:if>
							<c:if test="${list.category3!=' '}">
								<input type="button" value="삭제" onclick="location.href='farmProduct_delete?s_no=${list.no}&searchRange=${searchRange}&searchNo=${searchNo}&searchTitle=${searchTitle}&searchWriter=${searchWriter}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&startRegdate=${startRegdate}&endRegdate=${endRegdate}'">
								<input type="button" value="수정" onclick="location.href='farmProduct_updateView?s_no=${list.no}&searchRange=${searchRange}&searchNo=${searchNo}&searchTitle=${searchTitle}&searchWriter=${searchWriter}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&startRegdate=${startRegdate}&endRegdate=${endRegdate}'">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pagesize">
		<table>
			<tr>
				<td colspan="3" height="100px">
					<!-- 페이지 카운트 --> 
					<c:if test="${count>0}">
						<c:set var="pageCount" value="${allCount / pageSize + ( allCount % pageSize == 0 ? 0 : 1 )}" />
						<c:set var="startPage" value="${1}" />
						<c:set var="pageBlock" value="${5}" />
						<fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" />
						<c:if test="${currentPage%pageBlock !=0 }">
							<c:set var="startPage" value="${result*pageBlock+1}" />
						</c:if>
						<c:if test="${currentPage%pageBlock==0}">
							<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
						</c:if>
						<c:set var="endPage" value="${startPage+pageBlock-1}" />
						<c:if test="${endPage>pageCount}">
							<c:set var="endPage" value="${pageCount}" />
						</c:if>
						<c:if test="${startPage>5}">
							<a href="productSelect_Modify?pageNum=${startPage-5}&searchRange=${searchRange}&searchNo=${searchNo}&searchTitle=${searchTitle}&searchWriter=${searchWriter}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&startRegdate=${startRegdate}&endRegdate=${endRegdate}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="productSelect_Modify?pageNum=${i}&searchRange=${searchRange}&searchNo=${searchNo}&searchTitle=${searchTitle}&searchWriter=${searchWriter}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&startRegdate=${startRegdate}&endRegdate=${endRegdate}">[${i}]</a>
						</c:forEach>
						<c:if test="${endPage<pageCount}">
							<a href=productSelect_Modify?pageNum=${startPage+5}&searchRange=${searchRange}&searchNo=${searchNo}&searchTitle=${searchTitle}&searchWriter=${searchWriter}&searchCategory=${searchCategory}&searchKeyword=${searchKeyword}&startRegdate=${startRegdate}&endRegdate=${endRegdate}">[다음]</a>
						</c:if>
					</c:if>
				</td>
			</tr>
		</table>
		</div>
		
 