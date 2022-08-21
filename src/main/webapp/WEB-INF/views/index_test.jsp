<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<style>
    body {
        padding: 30px;
        background-color: gray;
    }

    #container {
        margin: 0px auto;
        width: 500px;
    }

    #list {
        padding: 0px;
    }

    #list li {
        height: 250px;
        line-height: 250px;
        display: block;
        background-color: aliceblue;
        margin-bottom: 15px;
        text-align: center;
        vertical-align: middle;
        font-size: 3em;
    }

    #msg-loading {
        background-color: honeydew;
        color: red;
        text-align: center;
        border-radius: 5px;
    }

    .fade-in {
        opacity: 1;
        animation-name: fadeInOpacity;
        animation-iteration-count: 1;
        animation-timing-function: ease-in;
        animation-duration: 0.5s;
    }

    .fade-out {
        opacity: 0;
        animation-name: fadeOutOpacity;
        animation-iteration-count: 1;
        animation-timing-function: ease-in;
        animation-duration: 0.5s;
    }

    @keyframes fadeInOpacity {
        0% {
            opacity: 0;
        }

        100% {
            opacity: 1;
        }
    }

    @keyframes fadeOutOpacity {
        0% {
            opacity: 0;
        }

        100% {
            opacity: 1;
        }
    }
</style>

			<div class="row">
				<div class="col-md-12">
					
					<div id="like-user-list">
						<p class="text-center fs-3 my-4">ハート</p>
						<div id="like-user-list-detail">
						
							<div class="d-flex justify-content-between align-items-center luld">
								<div class="top post-header ms-5">
									<div class="user_container" onclick="location.href='#'">
										<div class="profile_img">
											<img src="/hello_img/member/lego_worker.jpg" alt="프로필이미지">
										</div>
										<div class="profile_flag">
											<img class="flag_icon" src="https://img.icons8.com/color/25/000000/japan-circular.png"/>
	<!-- 									<img class="flag_icon" src="https://img.icons8.com/color/25/000000/south-korea-circular.png"/> -->
										</div>
										<div class="user_name">
											<div class="nick_name m_text">Hello_User</div>
											<div class="mt-1 s_text">東京, 日本</div>
										</div>
									</div>
								</div>
								<div class="me-5">
									<button type="button" class="btn btn-outline-info">친구 추가</button>
								</div>
							</div>
							
						</div>
					</div>
					
				</div>
			</div>

	<div class="fs-3 border border-3 border-dark m-3 text-center" id="btn-test">
		Test Button
	</div>
	<div class="fs-1 border border-3 border-dark m-3 text-center" id="div-test">
		yn
	</div>

	<div class="fs-3 border border-3 border-dark m-3 text-center" id="btn-test2">
		Test Button2
	</div>
	<div class="fs-1 border border-3 border-dark m-3 text-center" id="div-test2">
		yn
	</div>

    <div id="container">
        <ul id="list">

        </ul>
        <p id="msg-loading">....... 次のデータをローディング中 .......</p>
        <!-- ID 값 : msg-loading, class 명 : loading-fade-in, loading-fade-out 값 css 설정 (상단 style)  -->
    </div>
  
	<!-- Pagination -->
	<div class="pagination">
	    <a class="prevPage" href="/?pageNum=${pageVO.cri.pageNum - 1}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 
	
	    <c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
		  <a href="/?pageNum=${num}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 			
	    </c:forEach>
	  
	    <a class="nextPage" href="/?pageNum=${pageVO.cri.pageNum + 1}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 
	</div>
    
<script>

	var like_list = ['jgc6@naver.com','jgc2@naver.com','jgc3@naver.com'];
	var user = '${username}';
	
	$("#btn-test").on("click", function() {
		var yn = 'n';
		for( var i in like_list ) {
			if( like_list[i] == user ) {
				yn = 'y';
			}
		}
		if( yn == 'y' ) {
			$("#div-test").html('y');
		}else {
			$("#div-test").html('n');
		}
	})
	
	$("#btn-test2").on("click", function() {
		var yn = 'n';
		for( var i in like_list ) {
			if( like_list[i] == user ) {
				yn = 'y';
			}
		}
		if( yn == 'y' ) {
			$("#div-test2").html('y');
		}else {
			$("#div-test2").html('n');
		}
	})

	var totalRow = parseInt('${pageVO.total}');
	var realEnd = parseInt('${pageVO.realEnd}');
	var pageNum = parseInt('${pageVO.cri.pageNum}');
	var nextPage = pageNum + 1 > realEnd ? realEnd : pageNum + 1;
	var amount = parseInt('${pageVO.cri.amount}'); 
	var startPage = parseInt('${pageVO.startPage}');
	var endPage = parseInt('${pageVO.endPage}');
	var type = '${pageVO.cri.type}'; 
	var keyword = '${pageVO.cri.keyword}'; 
	
	console.log("total : " + totalRow);
	console.log("pageNum : " + pageNum);
	console.log("nextPage : " + nextPage);
	console.log("realEnd : " + realEnd);
	console.log("amount : " + amount);
	console.log("type : " + type);
	console.log("keyword : " + keyword);
	
    const msgLoading = document.getElementById("msg-loading") 

    // 데이터 추가 함수
    function addData(currentPage) { 

        const $list = document.getElementById("list")
        for (let i = startPage; i <= amount; i++) {
            const $li = document.createElement("li")
            $li.textContent = `${pageNum}페이지 : ${i}번째 데이터`
            $li.classList.add("fade-in")
            $list.appendChild($li)
        }
    }

    // IntersectionObserver 갱신 함수 (마지막 artice 요소를 감시하도록 함)
    function observeLastChild(intersectionObserver) {

        const listChildren = document.querySelectorAll("#list li")
        listChildren.forEach(el => {
            if (!el.nextSibling && pageNum < realEnd) { ///// *currentPage, *lastPage
                intersectionObserver.observe(el) // el에 대하여 관측 시작
            } else if (pageNum >= realEnd) { ///// *currentPage, *lastPage
                intersectionObserver.disconnect()
                msgLoading.textContent = "最後のページ" ///// *msgLoading
            }
        })
    }

    // IntersectionObeserver 부분 (옵저버 옵션)
    const observerOption = {
        root: null,
        rootMargin: "0px 0px 0px 0px",
        threshold: 0.5
    }

    // IntersectionObserver 인스턴스 생성
    const io = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            // entry.isIntersecting: 특정 요소가 뷰포트와 50%(threshold 0.5) 교차되었으면
            if (entry.isIntersecting) {
                msgLoading.classList.add("fade-in") ///// *msgLoading
                // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
                setTimeout(() => {
                    addData(++pageNum) ///// *currentPage
                    observer.unobserve(entry.target)
                    observeLastChild(observer)

                    msgLoading.classList.remove("fade-in") ///// *msgLoading
                }, 1000)
            }
        })
    }, observerOption)

    // 초기 데이터 생성
    addData(pageNum) // 데이터 추가 함수  ///// *currentPage
    observeLastChild(io) // IntersectionObserver 갱신 함수
	
	
/* 
	let currentPage = 1
    const DATA_PER_PAGE = 10,
          lastPage = 5
    const msgLoading = document.getElementById("msg-loading")

    // 데이터 추가 함수
    function addData(currentPage) { 

        const $list = document.getElementById("list")
        for (let i = (currentPage - 1) * DATA_PER_PAGE + 1; i <= currentPage * DATA_PER_PAGE; i++) {
            const $li = document.createElement("li")
            $li.textContent = `${currentPage}페이지 : ${i}번째 데이터`
            $li.classList.add("fade-in")
            $list.appendChild($li)
        }
    }

    // IntersectionObserver 갱신 함수 (마지막 artice 요소를 감시하도록 함)
    function observeLastChild(intersectionObserver) {

        const listChildren = document.querySelectorAll("#list li")
        listChildren.forEach(el => {
            if (!el.nextSibling && currentPage < lastPage) { ///// *currentPage, *lastPage
                intersectionObserver.observe(el) // el에 대하여 관측 시작
            } else if (currentPage >= lastPage) { ///// *currentPage, *lastPage
                intersectionObserver.disconnect()
                msgLoading.textContent = "最後のページ" ///// *msgLoading
            }
        })
    }

    // IntersectionObeserver 부분 (옵저버 옵션)
    const observerOption = {
        root: null,
        rootMargin: "0px 0px 0px 0px",
        threshold: 0.5
    }

    // IntersectionObserver 인스턴스 생성
    const io = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            // entry.isIntersecting: 특정 요소가 뷰포트와 50%(threshold 0.5) 교차되었으면
            if (entry.isIntersecting) {
                msgLoading.classList.add("fade-in") ///// *msgLoading
                // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
                setTimeout(() => {
                    addData(++currentPage) ///// *currentPage
                    observer.unobserve(entry.target)
                    observeLastChild(observer)

                    msgLoading.classList.remove("fade-in") ///// *msgLoading
                }, 1000)
            }
        })
    }, observerOption)

    // 초기 데이터 생성
    addData(currentPage) // 데이터 추가 함수  ///// *currentPage
    observeLastChild(io) // IntersectionObserver 갱신 함수
*/
</script>


<%@ include file="footer.jsp"%>