<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<div class="container">
	<div>
		<h4>"${searchKeyword}"에 해당하는 검색내용 ${allCount}건</h4>
	</div>

	<div class="row">
		<c:forEach items="${searchList}" var="list">
			<div class="col-xs-12 col-sm-6 col-md-3  imglist">
				<div class="col-item">
					<div class="photo">
						<c:if test="${list.category1!=' '}">
						<a href="#"><img src="upload/RTP/${list.thumbFile}"
							class="img-responsive" alt="a" /></a>
						</c:if>
						<c:if test="${list.category3!=' '}">
						<a href="#"><img src="upload/farmProduct/${list.thumbFile}"
							class="img-responsive" alt="a" /></a>
						</c:if>
					</div>
					<div class="info">

						<div class="row namesize">
							<div>
								<c:if test="${list.category1!=' '}">
								<h6> >> ${list.category1}/${list.category2} </h6>
								</c:if>
								<c:if test="${list.category3!=' '}">
								<h6> >> ${list.category3}</h6>
								</c:if>
								<a href="#"><h5>${list.title}</h5></a>
							</div>
						</div>
						<div class="separator clear-left">
							<h5 id="listfont_size">
								<p class="btn-add">
									<i class="fa fa-shopping-cart"></i>
									<se:authentication property="name" var="LoginUser" />
									<se:authorize
										access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')">
										<!-- 권한을 검사한다. 관리자나 일반 사용자, 판매자일 경우 -->
										<a
											href="cart?p_price=${list.price}&p_no=${list.no}&id=${LoginUser}&code=${1}"
											class="hidden-sm">장바구니 담기</a>
									</se:authorize>
								</p>
							</h5>
							<p class="btn-details">$ ${list.price}</p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="pagesize">
		<tr>
			<td colspan="3" height="100px">
				<!-- 페이지 카운트 --> <c:if test="${count>0}">
					<c:set var="pageCount"
						value="${allCount / pageSize + ( allCount % pageSize == 0 ? 0 : 1 )}" />
					<c:set var="startPage" value="${1}" />
					<c:set var="pageBlock" value="${5}" />
					<fmt:parseNumber var="result" value="${currentPage/pageBlock}"
						integerOnly="true" />
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
						<a href="search?pageNum=${startPage-5}&searchKeyword=${searchKeyword}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="search?pageNum=${i}&searchKeyword=${searchKeyword}">[${i}]</a>
					</c:forEach>
					<c:if test="${endPage<pageCount}">
						<a href="recipe_list?pageNum=${startPage+5}&searchKeyword=${searchKeyword}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</tr>
	</div>
</div>