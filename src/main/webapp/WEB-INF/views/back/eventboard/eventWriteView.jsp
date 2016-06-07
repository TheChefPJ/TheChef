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
		<form action="EB_write" method="post">
			<tr>
				<td>제목</td>
				<td><input type="text" name="e_title" size="50" maxlength="15"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="e_writer" size="50"maxlength="10"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="e_content" rows="10" maxlength="500"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
		</form>
	</table>
	
	
	<a href="EB_list">목록보기</a>&nbsp;&nbsp; 
</body>
</html>
