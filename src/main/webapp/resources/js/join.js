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
	
	var joinService = (function() {
		function checkEmail(email,callback){
			$.ajax({
				type:"get",
				url:"/member/checkEmail?email="+email,
				success : function(result){
					if(callback){
						callback(result);
					}
				},error: function(xhr,status,er){
					consol.log(er);
					return
				}
			})
		}
		
		function checkNickname(nickname,callback){
			$.ajax({
				type:"get",
				url:"/member/checkNickname?nickname="+nickname,
				success : function(result){
					if(callback){
						callback(result);
					}
				},error: function(xhr,status,er){
					consol.log(er);
					return
				}
			})
		}
		
		return {checkEmail:checkEmail, checkNickname:checkNickname};
	})();
	
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