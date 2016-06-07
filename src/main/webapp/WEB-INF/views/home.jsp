<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/recipe.css" rel="stylesheet">
<link href="resources/css/nav.css" rel="stylesheet">
<link href="resources/css/productSelect_Modify.css" rel="stylesheet">
<link href="resources/css/farmProductResgister.css" rel="stylesheet">
<link href="resources/css/eventManager.css" rel="stylesheet">
<link href="resources/css/noticeManage.css" rel="stylesheet">
<link href="resources/css/snsProductManage.css" rel="stylesheet">
<link href="resources/css/recipeRegister.css" rel="stylesheet">
<link href="resources/css/deliveryStatus.css" rel="stylesheet">
<link href="resources/css/cancelManage.css" rel="stylesheet">
<link href="resources/css/orderSendManage.css" rel="stylesheet">
<link href="resources/css/returnManage.css" rel="stylesheet">
<link href="resources/css/ConsumerDealList.css" rel="stylesheet">
<link href="resources/css/SellerDealList.css" rel="stylesheet">
<link href="resources/css/member.css" rel="stylesheet">
<link href="resources/css/detailpage.css" rel="stylesheet">
<link href="resources/css/review_write.css" rel="stylesheet">
<link href="resources/css/checkout.css" rel="stylesheet">
</head>
<body>
	<%-- <header><jsp:include page="front/main/header.jsp" /></header>
	<nav><jsp:include page="front/main/nav.jsp" /></nav>
	<article><jsp:include page="front/member/login.jsp" /></article>
	<footer></footer> --%>
	<!-- Header  영역  --> 
	<tiles:insertAttribute name="header" />

	<!-- Main 영역 --> 
	<tiles:insertAttribute name="nav" />

	<!-- article영역 -->
	<tiles:insertAttribute name="article" />

	<!-- Footer  영역  -->
	<tiles:insertAttribute name="footer" />

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/member.js"></script>
	<script
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script src="//code.jquery.com/jquery.min.js"></script>
</body>
</html>
