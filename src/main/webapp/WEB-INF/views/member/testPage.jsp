<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/memberHeader.jsp"%>
<style>
.textBoxs{
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
}
.textBox{
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
    min-height: 43px;
    display: flex;
    justify-content: space-between;
    height: auto;
    align-items: center;
}
.textBox >p{
	margin-top: 5px;
	max-width: 60%;
}
.translateBtns{
}
</style>
일단 페이지가 잘 만들어 졌는가 확인부터 합시다
<div class="container_fluid">
	<div class="container">
		<div class="textBoxs">
		</div>
		<div class="textAreavBox">
		<textarea id="textArea"></textarea>
		<button type="button" id="inputBtn" onclick="inputText()">입력</button>
		</div>
	</div>
</div>
<script>
	const textBoxs = $('.textBoxs');
	
	function inputText(){
		var text = $('#textArea').val();
		if(text == ''){
			alert("내용을 입력하세요.");
			return
		}else{
			var str = textBoxs.html();
			str += '<div class="textBox"><p>'+text+'</p><div class="translateBtns">';
			str += '<button id="tarnslateBtn" data-in="ko" data-out="ja">한>일</button>';
			str += '<button id="tarnslateBtn" data-in="ja" data-out="ko">일>한</button>';
			str += '<button id="tarnslateBtn" data-in="ko" data-out="en">한>영</button>';
			str += '<button id="tarnslateBtn" data-in="ja" data-out="en">일>영</button>';
			str += '</div></div>';
			textBoxs.html(str);
			$('#textArea').val("");
		}
	}
	
	textBoxs.on("click","button#tarnslateBtn",function(){
		const selectedBox = $(this).parent().siblings('p');
		var inLang = $(this).data('in');
		var outLang = $(this).data('out');
		var text = selectedBox.text();
		
		var data = {
				inLang:inLang,
				outLang:outLang,
				text:text
		} 
		$.ajax({
			type:"post",
			url:"/translate/translate",
			data:JSON.stringify(data),
			contentType:'application/json; charset=utf-8',
			success: function(result,status,xhr) {
				console.log(result);
				selectedBox.text(result['message']['result']['translatedText']);
			},error: function(xhr,status,er){
				console.log("에러!")
			}
		})
	})
</script>


</body>
</html>