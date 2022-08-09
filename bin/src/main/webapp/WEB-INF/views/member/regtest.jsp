<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 id="email" data-lang="email">[email]</h1>
<p id="nickname" data-lang="nickname">[nickname]</p>
<p id="password" data-lang="password">[password]</p>
<p id="hobby" data-lang="hobby">[hobby]</p>
<p id="sex" data-lang="sex">[sex]</p>
<p id="birth" data-lang="birth">[birth]</p>
<p id="language" data-lang="language">[language]</p>
언어 설정을 바꿔도 기본 설정된 언어는 바뀌지 않는다  -->  <label id="lng">123</label>
<br>

<select onchange="changeLang(this.value)">
	<option id="option-kr" value="ko">한국어</option>
	<option id="option-en" value="en">English</option>
</select>
<script>

	//언어별 대응 값 설정 //일일이 지정해줘야 하는 번거로움이 있음
	const lang = {
			en:{
				//[]안에 들어가는 이름 : 입력될 내용
				email: "email: ${mvo.email }",
				nickname: "nickname: ${mvo.nickname }",
				password: "password: ${mvo.password }",
				hobby: "hobby: ${mvo.hobby }",
				sex: "sex: ${mvo.sex }",
				birth: "birth: ${mvo.birth }",
				language: "language: ${mvo.language }"
			},
			ko:{
				email: "이메일: ${mvo.email }",
				nickname: "닉네임: ${mvo.nickname }",
				password: "비밀번호: ${mvo.password }",
				hobby: "취미: ${mvo.hobby }",
				sex: "성별: ${mvo.sex }",
				birth: "생년월일: ${mvo.birth }",
				language: "모국어: ${mvo.language }"
			}
	};
	
	//페이지가 불러와질 떄 현재 '사용자의 언어(locale)'가 뭘로 설정되어 있는지 확인
	function getLanguage() {
		return navigator.language || navigator.userLanguage;
	}
	
	const currentLang = getLanguage();
	console.log('사용자의 언어는 '+currentLang+' 입니다.');
	
	//사용자의 언어가 무엇인지 표출 //셀렉트 박스에서 값을 바꾼다고 기본 설정언어가 바뀌지 않음.
	//한국 사람이 eng보고 싶어서 eng로 바꿔도 다른 페이지로 이동하면 다시 한국어로 바뀜.
	function init(localeStr){
		document.getElementById('lng').textContent = localeStr;
	}
	
	init(navigator.language);
	
	
	//페이지 내용을 각 언어에 맞게 수정해주는 함수
	function render(locale) {
		//data-lang이라는 attribute를 가진 모든 태그를 $lang이라는 객체에 담는다.
		const $lang = document.querySelectorAll("[data-lang]");
		
		//$lang의 길이만큼 반복
		$lang.forEach(el => { //각 내용물을 el(엘리먼트)라고 명명하고 el에 대해서 다음을 실행
			const code = el.dataset.lang; //el의 data-로 시작하는 것중 lang에 해당하는 값을 code에 담는다.
			el.textContent = lang[locale][code] //자료 lang에서 lacale에 해당하는 값에서 code를 표출시켜라.
		})
	}
	
	
	
	//페이지 실행과 동시에 기본 설정된 언어로 페이지를 로드 //한국사람은 한글로, 외국인은 영어
	render(currentLang.substr(0, 2)||'en');
	
	
	
	
	//선택된 언어에 따라 글이 변경되게 하는 함수
	//select의 value를 가져와서(한국어-ko, english-en) 자동으로 rend한다.
	function changeLang(language) {
		render(language);
		init(navigator.language);
	}
</script>
</body>
</html>