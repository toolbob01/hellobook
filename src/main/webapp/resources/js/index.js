
    // Post CRUD Alert Script
	$(document).ready(function() {
		var insert_post_result = "${insert_post_result}";
		if( insert_post_result != null && insert_post_result != "" && !history.state ){
			if( parseInt(insert_post_result) == 1 ){
				alert('Insert Post Success ! ' + insert_post_result);
			}else{
				alert('Insert Post Fail ! ' + insert_post_result);
			}
		}
		var insert_file_result = "${insert_file_result}";
		if( insert_file_result != null && insert_file_result != "" && !history.state ){
			if( parseInt(insert_file_result) == 1 ){
				alert('Insert File Success ! ' + insert_file_result);
			}else{
				alert('Insert File Fail ! ' + insert_file_result);
			}
		}
		history.replaceState({},null,null);
	})

	// original Template Script
	onclick = function deligationFunc(e) {
		let elem = e.target;
		if(elem.getAttribute('data-name') == null){
			elem = null;
			return;
		}
		if (elem.matches('[data-name="heartbeat"]')) {
			console.log("하트");
		} else if (elem.matches('[data-name="bookmark"]')) {
			console.log("북마크");
		} else if (elem.matches('[data-name="share"]')) {
			console.log("공유");
		} else if (elem.matches('[data-name="commentheart"]')) {
			console.log("코멘트하트");
		}
		if (elem.matches('[data-name="more"]')) {
			console.log("더보기");
		}

		elem.classList.toggle('on');
	}
	
	// Click heart-btn -> By status of data-heart, Adding or Removing user in like_list
	$(".heart-btn").on("click", function(e){
		var heart_stat = $(this).data("heart");
		var heart_user = '${username}';
		var heart_pno = $(this).data("pno");
		if( heart_stat == 'y' ) {
			e.preventDefault();
			$.ajax({
				type:"get",
				url:"/post/like_delete?email=" + heart_user + "&pno=" + heart_pno,
				dataType:"json",
				success:function(data){
					$(".heart-count ???").html(data);
				}, error:function(){
					alert("Error - Like Delete");
				}
			})
		}else {
			e.preventDefault();
			$.ajax({
				type:"get",
				url:"/post/add_delete?email=" + heart_user + "&pno=" + heart_pno,
				dataType:"json",
				success:function(data){
					$(".heart-count ???").html(data);
				}, error:function(){
					alert("Error - Like Add");
				}
			})
		}
	})
	
	// Side Bar - Hover
	$(".thumb_user").hover(function(){
		$(this).css("background-color", "rgb(204 204 204 / 19%)");
		$(this).children('.msg-link').css("display","block");
	},function(){
		$(this).css("background-color", "#ffffff");
		$(this).children('.msg-link').css("display","none");
	})
	
	// Modal - Detail
	$(".more-comment").on("click", function(){
		$(".modal-background").css("display","block");
	})
	
	$(document).mouseup(function (e){
		var modal = $(".modal-background");
		if( modal.has(e.target).length === 0){
			$(".modal-background").css('display','none');
		}
	});
	
	// Click 'X' in Detail Modal to make display none
	 $('.closeModalBtn').on('click', function(){
		 $('.modal-background').css("display", "none");  
	 });
	
	
	// Infinity Scroll
 	function YesScroll () {
		const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
		const fullContent = document.querySelector('.post-box'); // 전체를 둘러싼 컨텐츠 정보획득
		const screenHeight = screen.height; // 화면 크기
		let oneTime = false; // 일회용 글로벌 변수
		document.addEventListener('scroll',OnScroll,{passive:true}) // 스크롤 이벤트함수정의
	 	function OnScroll () { //스크롤 이벤트 함수
	    	const fullHeight = fullContent.clientHeight; // infinite 클래스의 높이   
	    	const scrollPosition = pageYOffset; // 스크롤 위치
	    	if (fullHeight-screenHeight/2 <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
				oneTime = true; // oneTime 변수를 true로 변경해주고,
	      		madeBox(); // 컨텐츠를 추가하는 함수를 불러온다.
	    	}
	  	}
		
		const nextLink = pagination.querySelector('.nextPage'); // .pagination 의 .nextPage 링크
		const nextURL = nextLink.getAttribute('href'); // .nextPage의 링크 주소
		
		function madeBox() {
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() { 
			  if (xhr.readyState === xhr.DONE) { 
			    if (xhr.status === 200 || xhr.status === 201) {
			      const data = xhr.response; // 다음페이지의 정보
			      const addList = data.querySelector('.contents'); // 다음페이지에서 list아이템을 획득 (contents = article)
			      fullContent.appendChild(addList); // infinite에 list를 더해주기
			      oneTime = false; // oneTime을 다시 false로 돌려서 madeBox를 불러올 수 있게 해주기
			    } else {
			      console.error(xhr.response);
			    }
			  }
			};
			xhr.open('GET', nextURL); // 다음페이지의 정보를 get
			xhr.send();
			xhr.responseType = "document";
		}
	}
	YesScroll()