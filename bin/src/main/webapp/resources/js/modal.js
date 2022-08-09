


//모달 클로즈 버튼
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
     modal.style.display = "none"
});

//모달 바깥쪽 클릭 종료

modal.addEventListener("click", e=> {
     const evTarget = e.target
     if(evTarget.classList.contains("modal-overlay")) {
         modal.style.display = "none"
     }
})

