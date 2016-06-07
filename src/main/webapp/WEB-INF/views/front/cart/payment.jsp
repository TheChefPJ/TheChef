<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript"
   src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
   function payStart() {
	  var c_name = document.getElementById("c_name").value;
	  var c_address = document.getElementById("c_address").value;
	  var c_zip_code = document.getElementById("c_zip_code").value;
	  var c_phone = document.getElementById("c_phone").value;
	  var c_no = document.getElementById("c_no").value;
	  var id = document.getElementById("id").value;
	  var c_total_price = document.getElementById("c_total_price").value;
	  
      var IMP = window.IMP;
      IMP.init('imp48133453');
      IMP.request_pay({
         pg : 'inicis', // version 1.1.0부터 지원. 
         /*
             'kakao':카카오페이,
             'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제), 
             'nice':나이스, 
             'jtnet':jtnet, 
             'uplus':LG유플러스,
             'danal':다날
          */
         pay_method : 'card', // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : '주문명:결제테스트',
         amount : c_total_price,
         buyer_email : 'iamport@siot.do',
         buyer_name : c_name,
         buyer_tel : c_phone,
         buyer_addr : c_address,
         buyer_postcode : c_zip_code
      }, function(rsp) {
         if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
         } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            location.href="paymentFail?c_no=" + c_no + "&id=" + id;
         }
      });
   }
</script>
<body onload="javascript:payStart();">
	<input type="hidden" id="c_name" value="${c_name}">
	<input type="hidden" id="c_address" value="${c_address}">
	<input type="hidden" id="c_zip_code" value="${c_zip_code}">
	<input type="hidden" id="c_phone" value="${c_phone}">
	<input type="hidden" id="c_no" value="${c_no}">
	<input type="hidden" id="id" value="${id}">
	<input type="hidden" id="c_total_price" value="${c_total_price}">
</body>
</html>