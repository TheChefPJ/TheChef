<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta th109</title>
</head>
<body>


<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="NB_modify" method="post">
			<input type="hidden" name="N_no" value="${content_view.n_no}">
			<tr>
				<td>번호</td>
				<td>${content_view.n_no}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="N_writer" value="${content_view.n_writer}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="N_title" value="${content_view.n_title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="N_contents">${content_view.n_contents}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
					<a href="NB_list">목록보기</a>&nbsp;&nbsp;
					<%-- <a href="delete?bId=${content_view.bId}">삭제</a>&nbsp;&nbsp;
					<a href="reply_view?bId=${content_view.bId}">답변</a>&nbsp;&nbsp; --%>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
