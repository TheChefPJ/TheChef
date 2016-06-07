<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<div id="header" class="container-fluid">
	<header class="navbar navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-3">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse-3">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="btn btn-default btn-outline btn-circle collapsed"
						data-toggle="collapse" href="#nav-collapse3" aria-expanded="false"
						aria-controls="nav-collapse3">검색</a></li>
					<se:authorize access="isAnonymous()"><!-- 권한을 검사한다!!로그인 전 상태라면 -->
						<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
					</se:authorize>
					<se:authentication property="name" var="LoginUser" />
					<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')"><!-- 권한을 검사한다. 관리자나 일반 사용자, 판매자일 경우 -->
						<li><a href="${pageContext.request.contextPath}/logout">(${LoginUser})로그아웃</a></li>
					</se:authorize> 
					
					<se:authorize access="isAnonymous()"><!-- 권한을 검사한다!!로그인 전 상태라면 -->
						<li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
					</se:authorize>
					
					<se:authorize access="hasRole('ROLE_USER')">
						<li><a href="mypage">마이페이지</a></li>
					</se:authorize>
					<se:authorize access="hasRole('ROLE_COP')">
						<li><a href="${pageContext.request.contextPath}/sellerPage">판매자 페이지</a></li>
					</se:authorize>
					<se:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="${pageContext.request.contextPath}/recipeRegister">관리자 페이지</a></li>
					</se:authorize>
					
					<li><a href="FQ_list">고객센터</a></li>
					<li><a href="cartList">장바구니</a></li>
				</ul>
				<div class="collapse nav navbar-nav nav-collapse slide-down"
					id="nav-collapse3">
					<form action="search" class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" name="searchKeyword" class="form-control" placeholder="Search" />
						</div>
						<button type="submit" class="btn btn-danger">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</form>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</header>
	<!-- /.navbar -->
</div>
<!-- /.container-fluid -->