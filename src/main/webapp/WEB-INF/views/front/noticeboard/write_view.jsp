<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta th109</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="NB_write" method="post">
			<tr>
				<td>제목</td>
				<td><input type="text" name="n_title" size="50"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="n_writer" size="50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="n_content" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
		</form>
	</table>
	
	
	<a href="NB_list">목록보기</a>&nbsp;&nbsp; 
</body>
</html>
