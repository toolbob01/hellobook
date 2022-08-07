/**
 * 회원가입 유효성 검사 및 작동 function
 */

	/* 생년월일 기본값(오늘 날짜)
	window.onload = function(){
		const dateInput = $("#birth")
		let time = new Date();
		let month = ('0'+(time.getMonth()+1)).slice(-2);
		let date = ('0'+time.getDate()).slice(-2);
		let today = time.getFullYear()+'-'+month+'-'+date;
		console.log(today);
		dateInput.val(today);
	} */
	
	function checkOnlyOne(element) {
		const checkboxes = document.getElementsByName("language");
		checkboxes.forEach((cb)=> {
			cb.checked = false;
		})
		
		element.checked = true;
	}
	
	const email = $("#email");
	const nickname = $("#nickname");
	const pw = $("#pw");
	const pw2 = $("#pw2");
	const password = $("#password");
	const language = document.getElementsByName("language");
	const birth = $("#birth");
	const sex = $("#sex");
	const hobbys = document.getElementsByName("hobbys");
	const hobby = $("#hobby");
	const agree = $("#agreement");
	
	const emailNotice = $("#email-notice");
	const nicknameNotice = $("#nickname-notice");
	const pwNotice = $("#pw-notice");
	const pw2Notice = $("#pw2-notice");
	const lanNotice = $("#lan-notice");
	const birthNotice = $("#birth-notice");
	
	var pwCheck = /^(?=.*?[a-zA-Z0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	

	//blur 이벤트
	email.on("blur",function(){
		emailNotice.css('display','none')
		
		if(email.val() == ''){
			emailNotice.html("이메일을 입력해주세요.")
			emailNotice.css('display','flex')
			email.focus();
			return
		}
	})
	
	nickname.on("blur",function(){
		nicknameNotice.css('display','none')
		
		if(nickname.val() == ''){
			nicknameNotice.html("닉네임을 입력해주세요.");
			nicknameNotice.css('display','flex')
			nickname.focus();
			return
		}
		
		if(nickname.val().search(/\s/) != -1){
			nicknameNotice.html("닉네임은 공백을 포함할 수 없습니다.");
			nicknameNotice.css('display','flex')
			nickname.focus();
			return
		}
	})
	
	pw.on("blur",function(){
		pwNotice.css('display','none')
		
		if(pw.val() == ''){
			pwNotice.html("비밀번호를 입력해주세요.")
			pwNotice.css('display','flex')
			pw.focus();
			return
		}
		
		if(pw.val().search(/\s/) != -1){
			pwNotice.html("비밀번호는 공백을 포함할 수 없습니다.")
			pwNotice.css('display','flex')
			pw.focus();
			return
		}
		
		if(pw.val().length < 8 || !pwCheck.test(pw.val())){
			pwNotice.html("8자리 이상, 두가지 이상의 영어 대·소문자, 숫자, 특수문자의 조합이어야 합니다.")
			pwNotice.css('display','flex')
			pw.focus();
			return
		}
	})
	
	pw2.on("blur",function(){
		pw2Notice.css('display','none')
		
		if(pw2.val() == ''){
			pw2Notice.html("비밀번호를 입력해주세요.")
			pw2Notice.css('display','flex')
			pw2.focus();
			return
		}
		
		if(pw2.val() != pw.val()){
			pw2Notice.html("비밀번호가 일치하지 않습니다.")
			pw2Notice.css('display','flex')
			return
		}
	})
	
	birth.on("blur",function(){
		birthNotice.css('display','none')
		
		if(birth.val() == ''){
			birthNotice.html("생년월일을 입력해주세요.")
			birthNotice.css('display','flex')
			birth.focus();
			return
		}
		
		if(birth.val().substr(0,4) < 1900){
			birthNotice.html("1900년 미만은 입력하실 수 없습니다.")
			birthNotice.css('display','flex')
			birth.val("");
			birth.focus();
			return
		}
	})
	
	//유효성 검사
	function formCheck(){
		
		if(!agree.is(":checked")){
			alert("약관에 동의 후 가입이 가능합니다.");
			return
		}
		
		if(email.val() == ''){
			alert("이메일을 입력해주세요.");
			email.focus();
			return
		}
		
		if(nickname.val() == ''){
			alert("닉네임을 입력해주세요.");
			nickname.focus();
			return
		}
		
		if(nickname.val().search(/\s/) != -1){
			alert("닉네임은 공백을 포함할 수 없습니다.");
			nickname.focus();
			return
		}
		
		if(pw.val() == ''){
			alert("비밀번호를 입력해주세요.");
			pw.focus();
			return
		}
		
		if(pw.val().search(/\s/) != -1){
			alert("비밀번호는 공백을 포함할 수 없습니다.");
			pw.focus();
			return
		}
		
		if(pw.val().length < 8 || !pwCheck.test(pw.val())){
			alert("8자리 이상, 두가지 이상의 영어 대·소문자, 숫자, 특수문자의 조합이어야 합니다.");
			pw.focus();
			return
		}
		
		if(pw2.val() == ''){
			alert("비밀번호를 입력해주세요.")
			pw2.focus();
			return
		}
		
		if(pw2.val() != pw.val()){
			alert("비밀번호가 일치하지 않습니다.")
			pw2.focus();
			return
		}
		
		var i=0;
		
		language.forEach((lan)=> {
			if(lan.checked){
				i++;
			}
		})
		
		if(i != 1){
			alert("모국어를 선택해주세요.")
			return
		}
		
		if(birth.val() == ''){
			alert("생년월일을 입력해주세요.")
			birth.focus();
			return
		}
		
		if(birth.val().substr(0,4) < 1900){
			alert("1900년 미만은 입력하실 수 없습니다.")
			birth.val("");
			birth.focus();
			return
		}
		
		var hb="";
		
		hobbys.forEach((arr)=> {
			if(arr.checked){
				hb += arr.value+','
				arr.setAttribute('disabled','disabled');
			}
		})
		
		hb = hb.substr(0,hb.length-1);
		
		hobby.val(hb);
		password.val(pw.val());
		
		$("#regForm").submit();
	}