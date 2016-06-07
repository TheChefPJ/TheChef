<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<script type="text/javascript">
function go(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value; 
	alert("name : " + name + "email : " + email);
	/* var a = document.querySelector('.kiki'); */
	/* a.setAttribute('href','idFindPro?name=' + name) */
	url = "idFindPro?name=" + name + "&email=" + email;
	location.href = url;
}

function checkRandom(random, id) {
	/* alert("checkRandom()");
	alert("random : " + document.getElementById("random").value);
	alert("random : " + document.getElementById("random2").value); */
	if(document.getElementById("random").value == document.getElementById("random2").value) {
		alert("고객님의 id는 " + document.getElementById("id").value + "입니다");
	} else {
		alert("알맞지 않은 인증번호 입니다.");
	}
}
</script>

<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" action="login" method="post" onsubmit="return checkRandom();">
				<h2>아이디 찾기</h2>
				<h6>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</h6>
				<hr class="colorgraph">
				<h4>이름</h4>
				<div class="form-group">
					<c:if test="${random == '0'}"> <!-- 인증번호 받기 전 -->
						<input type="text" name="name" id="name" class="form-control input-lg" placeholder="Id" tabindex="1">
					</c:if>
					<c:if test="${random != '0'}"> <!-- 인증번호 받고 나면 -->
						<input type="text" name="name" id="name" value="${name}" class="form-control input-lg" tabindex="1" disabled="disabled">
					</c:if>
				</div>
				<h4>이메일</h4>
				<div class="form-group">
					<c:if test="${random == '0'}"> <!-- 인증번호 받기 전 -->
						<input type="email" name="email" id="email" class="form-control input-lg" placeholder="email" tabindex="2" style="width:70%;">
					</c:if>
					<c:if test="${random != '0'}"> <!-- 인증번호 받고 나면 -->
						<input type="email" name="email" id="email" value="${email}" class="form-control input-lg" tabindex="2" style="width:70%;" disabled="disabled">
					</c:if>
					<a href="javascript:go();" class="kiki">인증번호 전송</a> 
					<c:if test="${random == '0'}"> <!-- 인증번호 받기 전 -->
						<input type="text" class="form-control input-lg" placeholder="인증번호 6자리 숫자 입력" tabindex="2" disabled="disabled">
					</c:if>
					<c:if test="${random != '0'}"> <!-- 인증 번호 받은 후 -->
						<input type="text" id="random" class="form-control input-lg" placeholder="인증번호 6자리 숫자 입력" tabindex="2">
					</c:if>
				</div>
				<input type="hidden" id="random2" value="${random}" />
				<input type="hidden" id="id" value="${id}" />
				
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="submit" value="아이디 찾기" class="btn btn-primary btn-block btn-lg" tabindex="3">
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
