<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav id="navbar" class="navbar navbar-default" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-brand-centered">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar-brand-centered">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" id="dropdown1">레시피</a>
					<ul id="dropdown-menu1" class="dropdown-menu">
						<li><a href="recipe_list">전체보기</a></li>
						<li><a href="recipe_list?p_category1=밥">밥</a></li>
						<li><a href="recipe_list?p_category1=국/찌개">국/찌개</a></li>
						<li><a href="recipe_list?p_category1=밑반찬">밑반찬</a></li>
						<li><a href="recipe_list?p_category1=메인반찬">메인반찬</a></li>
						<li><a href="recipe_list?p_category1=일품요리">일품요리</a></li>
						<li><a href="recipe_list?p_category1=간식">간식</a></li>
						<li><a href="recipe_list?p_category1=기타">기타</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" id="dropdown2">테마</a>
					<ul id="dropdown-menu2" class="dropdown-menu">
						<li><a href="theme_list">전체보기</a></li>
						<li><a href="theme_list?p_category2=한잔의 술상">한잔의 술상</a></li>
						<li><a href="theme_list?p_category2=달콤한 오후">달콤한 오후</a></li>
						<li><a href="theme_list?p_category2=사랑을 담은 밥상">사랑을 담은 밥상</a></li>
						<li><a href="theme_list?p_category2=혼자 먹는 밥상">혼자 먹는 밥상</a></li>
						<li><a href="theme_list?p_category2=웰빙&다이어트">웰빙&다이어트</a></li>
						<li><a href="theme_list?p_category2=아이를 위한 밥상">아이를 위한 밥상</a></li>
						<li><a href="theme_list?p_category2=재료하나 愛">재료하나 愛</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" id="dropdown3">Talk</a>
					<ul id="dropdown-menu3" class="dropdown-menu">
						<li><a href="#">요리톡</a></li>
						<li><a href="#">수다톡</a></li>
					</ul></li>
			</ul>
			<a id="logo" href="index"><img alt="logo"
				src="resources/img/logo.png"></a>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" id="dropdown4">골라담기</a>
					<ul id="dropdown-menu4" class="dropdown-menu">
						<li><a href="farmProduct_list">전체보기</a></li>
						<li><a href="farmProduct_list?s_category=정육">정육</a></li>
						<li><a href="farmProduct_list?s_category=야채">야채</a></li>
						<li><a href="farmProduct_list?s_category=과일">과일</a></li>
						<li><a href="farmProduct_list?s_category=유제품">유제품</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" id="dropdown5">About Us</a>
					<ul id="dropdown-menu5" class="dropdown-menu">
						<li><a href="companyInfo">회사 소개</a></li>
						<li><a href="NB_list">공지사항</a></li>
						<li><a href="EB_list">이벤트</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>