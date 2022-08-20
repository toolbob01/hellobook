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
</script>


<%@ include file="footer.jsp"%>