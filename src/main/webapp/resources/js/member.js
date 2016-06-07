function SetEmailTail(emailValue) {
	var email = document.all("email") // 사용자 입력
	var emailTail = document.all("email2") // Select box
	if (emailValue == "") {
		emailTail.readOnly = false;
		emailTail.value = "";
		emailTail.focus();
	} else {
		emailTail.readOnly = true;
		emailTail.value = emailValue;
	}
}

function openAddr() {
	daum.postcode
			.load(function() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								document.getElementsByName("zip_code")[0].value = data.zonecode;
								document.getElementsByName("address1")[0].value = data.roadAddress;
							}
						}).open();
			});
}

function checkIt() {
	var userinput = eval("document.userinput");

	if (!userinput.id.value) {
		alert("ID를 입력하세요");
		return false;
	}

	if (!userinput.password.value) {
		alert("비밀번호를 입력하세요");
		return false;
	}
	
	if (userinput.password.value != userinput.password2.value) {
		alert("비밀번호를 동일하게 입력하세요");
		return false;
	}

	if (!userinput.name.value) {
		alert("이름을 입력하세요");
		return false;
	}

}

$(function(){
	$("#btnCheckUid").click(function(){
		$.ajax({
			type : "post",
			url : "/project/useridok",
			data : {"id" : $('#User_id').val()},
			success : function(data) { 
				if(data.member==1){
					alert("중복된 아이디입니다.");
				}else{
					alert("사용할 수 있는 아이디입니다.");
				}
			}
		});
	});
});

function checkIt1() {
	var userinput = eval("document.userinput");


	if (!userinput.password.value) {
		alert("변경할 새로운 비밀번호를 입력하세요");
		return false;
	}
	
	if (userinput.password.value != userinput.password2.value) {
		alert("변경할 새로운 비밀번호를 동일하게 입력하세요");
		return false;
	}

	if (!userinput.name.value) {
		alert("변경할 새로운 이름을 입력하세요");
		return false;
	}

}

function checkIt2() {
	
	var userinput = eval("document.userinput");
	
	if(userinput.password.value == ""){
        alert("비밀번호를 입력하지 않으셨습니다.");
        return false;
      }
}

