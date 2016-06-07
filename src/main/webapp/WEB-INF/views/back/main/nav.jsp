<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="container-fluid">
		<nav class="navbar navbar-default" role="navigation"> <!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Brand</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="productSelect_Modify">홈</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">매장관리<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="recipeRegister">레시피 상품 등록</a></li>
						<li><a href="farmProductRegister">판매자 상품 등록</a></li>
						<li><a href="productSelect_Modify">상품 정보 조회/수정</a></li>
						<li><a href="productSelect_Modify">재고 조회/수정</a></li>
						
						<li class="divider"></li>
						<li><a href="noticeManage">공지사항 관리</a></li>
						<li><a href="eventManage">이벤트 관리</a></li>
						<li class="divider"></li>
						<li><a href="snsProductManage">SNS상품공유관리</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">판매관리<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="orderSendManage">발주 발송 관리</a></li>
						<li><a href="deliveryStatus">배송 현황 관리</a></li>
						<li><a href="#">구매 확정 내역</a></li>
						<li><a href="cancelManage">취소 관리</a></li>
						<li><a href="returnManage">반품 관리</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">정산관리<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="SellerDealList">판매자 정산</a></li>
						<li><a href="ConsumerDealList">소비자 정산</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</nav>
	</div>