<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<div class="container">

	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		
			<!-- 로그인 실패 message 처리 -->
			<c:if test="${param.error != null}">
				<div>
					<!-- 로그인 실패<br> -->
					  <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
	      					<%-- 이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />  --%>
	      					<script type="text/javascript">
								<!--
								 	alert("잘못된 아이디와 비밀번호 입니다.");
								//-->
							</script> 
	     			  </c:if>			
				</div>
			</c:if>
			<c:url value="/j_spring_security_check" var="loginURL" />
			<form role="form" action="${loginURL}" method="post">
				<h2>로그인</h2>
				<hr class="colorgraph">
				<h4>아이디</h4>
				<div class="form-group">
					<input type="text" name="username" id="id"
						class="form-control input-lg" placeholder="Id" tabindex="1">
				</div>
				<h4>비밀번호</h4>
				<div class="form-group">
					<input type="password" name="password" id="password"
						class="form-control input-lg" placeholder="Password" tabindex="2">
				</div>

				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="submit" value="Login" class="btn btn-primary btn-block btn-lg" tabindex="3">
					</div>
				</div>
				<span><a href="idFind">아이디 찾기</a> / <a href="#">비밀번호 찾기</a></span>
			</form>
		</div>
	</div>

</div>
