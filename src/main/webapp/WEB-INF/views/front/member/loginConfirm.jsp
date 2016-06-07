<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<fmt:requestEncoding value="UTF-8" />

<meta http-equiv="Refresh"  content="0; url=idFind?random=${random}&id=${id}&name=${name}&email=${email}">

<c:if test="${ id!=null }">
	<script type="text/javascript">
		<!--
		 	alert("해당 이메일로 인증번호가 전송되었습니다.");
		//-->
	</script>
</c:if>
<c:if test="${ id == null }">
	<script type="text/javascript">
		<!--
		 	alert("해당하는 아이디가 존재하지 않습니다.");
			history.go(-1);
		//-->
	</script>
</c:if>
