/**
 * 	매칭하기 누르면  matching.jsp 실행하게 하기
 */

const button2 = document.querySelector('#match-btn2');


button2.addEventListener("click", function() {
	window.open("matching/matching.jsp", "팝업2", "width=420, height=530, left=0, top=0");
});