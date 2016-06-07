<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="HomeController" class="com.kosta.project.HomeController></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	boolean flag = true;
	String str = ";";
	if(id == null) {
		id = "";
	}
	if(!id.equals("")) {
		flag = homeController.idCheck(id);
	}
	if(flag) {
		str = "NO";
		out.print(str);
	} else {
		str = "YES";
		out.print(str);
	}
%>