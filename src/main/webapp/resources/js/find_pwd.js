/**
 * 
 */
$(function() {
	const email = $("#email");
	const code = $("#code");
	const pw = $("#pw");
	const pw2 = $("#pw2");
	const button_div = $("#button_div");
	var setCode = '';
	
	button_div.on("click","button#findPwdBtn",function(){
		if (email.val() == '') {
			$("#notice").show();
			return;
		}
		
		if (email.val() != '') {
			findPwdService.checkEmail(email.val(), function(data) {
				findPwdService.getCode(email.val(),function(result){
					alert("메일로 인증번호를 보냈습니다.\n메일 확인 후 인증번호를 입력하세요.")
					setCode = result;
					email.hide();
					$("#notice").hide();
					$("#notice2").hide();
					code.show();
					button_div.html('<button type="button" class="btn btn-primary" id="checkCodeBtn">인증 확인</button>');
				 },function(){
					alert("서버오류로 접근할 수 없습니다.");
					$("#notice").hide();
					$("#notice2").hide();
				})
			},function(){
				$("#notice2").show();
				return;
			});
		}
	})
	
	button_div.on("click","button#checkCodeBtn",function(){
		if(code.val() == '' || code.val() != setCode || setCode == ''){
			$("#notice3").show();
			return;
		}
		
		if(code.val() == setCode){
			$("#notice3").hide();
			alert("인증번호가 일치합니다. \n비밀번호를 변경해주세요.")
			code.val("");
			code.hide();
			pw.show();
			pw2.show();
			button_div.html('<button type="button" class="btn btn-primary" id="changePwdBtn">비밀번호 변경</button>');
		}
	})

	button_div.on("click","button#changePwdBtn",function(){
		var pwCheck = /^(?=.*?[a-zA-Z0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		
		$("#notice4").hide();
		$("#notice5").hide();
		$("#notice6").hide();
		$("#notice7").hide();
		
		if(pw.val() == ''){
			$("#notice4").show();
			return
		}
		
		if(pw.val().search(/\s/) != -1){
			$("#notice5").show();
			return
		}
		
		if(pw.val().length < 8 || !pwCheck.test(pw.val())){
			$("#notice6").show();
			return
		}
		
		if(pw2.val() != pw.val()){
			$("#notice7").show();
			return
		}
		
		if(pw2.val() == pw.val()){
			var userData = {
					email:email.val(),
					password:pw.val()
			}
			
			findPwdService.changePwd(userData,function(data){
				email.val("");
				pw.val("");
				pw2.val("");
				pw.hide();
				pw2.hide();
				email.show();
				button_div.html('<button type="button" class="btn btn-primary" id="findPwdBtn">비밀번호 찾기</button>');
				alert("비밀번호가 변경되었습니다.");
				location.href = '/member/login';
			},function(){
				alert("비밀번호가 변경되었습니다.");
			});
		}
	})
})