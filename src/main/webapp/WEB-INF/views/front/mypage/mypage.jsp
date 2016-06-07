<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MyPage</title>
</head>
<body>
<script type="text/javascript" src="https://cdn.bmf.kr/web/js/form/3.51/jquery.form.min.js"></script>
<div class="snb_wrap">
    <h2><span>마이페이지</span></h2>
    <ul class="snb_lst">
            <li><a href="editmember" >회원정보수정</a></li>
            <li><a href="/board/?db=counsel">주문내역조회</a></li>
            <li><a href="/board/?db=exchange">장바구니 보기</a></li>
            <li><a href="deleteMember">회원탈퇴</a></li>
    </ul>

    <div class="cs_center_info">
            <h3>The Chef 고객센터</h3>
            <p class="call_number"><a href="tel:7168-8089">7168-8089</a></p>
            <dl>
                    <dt>평&nbsp;&nbsp;&nbsp;일</dt><dd>06:30 ~ 18:00</dd>
                    <dt>토요일 </dt><dd>06:30 ~ 15:00</dd>
            </dl>
            <p class="comment">일요일/공휴일 휴무 <br />(배송있는 공휴일은 운영)</p>
    </div>
</div>

</body>
</html>