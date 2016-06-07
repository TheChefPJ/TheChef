<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<div class="containㄴer">

	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<c:url value="/j_spring_security_check" var="loginURL" />
			<form role="form" action="${loginURL}" method="post">
				<h2>로그인</h2>
				<hr class="colorgraph">
				<h4>이름</h4>
				<div class="form-group">
					<input type="text" name="username" id="id" class="form-control input-lg" placeholder="Id" tabindex="1">
				</div>
				<h4>이메일 주소</h4>
				<div class="form-group">
					<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="2">
				</div>

				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="submit" value="Login" class="btn btn-primary btn-block btn-lg" tabindex="3">
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
