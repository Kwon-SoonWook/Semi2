<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
}
.container {
    min-height: 100vh;	/*스크린 화면 전체를 가득 채움*/
    white-space: nowrap; /*띄어쓰기 방지*/
}
/*mypage main 페이지*/
.main-content {
    flex: 1;
    padding: 20px;
    margin-left: 50px;
}

/*흰색 페이지*/
.page {
    background: white;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
/*사용자 정보*/
.info{
	padding: 50px;	
}
</style>
<script>
document.addEventListener("DOMContentLoaded", categoryCheck); //페이지가 새로 로딩될 때마다 이벤트 발생

//카테고리 클래스 확인 이벤트
function categoryCheck(){
	let categories = document.querySelectorAll(".category");	//category class 요소 전체 반환
	categories.forEach(category =>{	//카테고리 배열 순환 - forEach문
		category.addEventListener("click", categoryClick);
	}); 
}

//카테고리 클릭 이벤트
function categoryClick(){
	event.preventDefault(); //링크 이동 막기
	let targetPage = event.target.dataset.page;	//데이터셋을 이용해 해당 data-page를 읽음
	document.getElementById("iframe").src = targetPage; //id가 iframe인 doc에 src에 targetPage를 넣음
	
}
//iframe 높이 설정 
function IframeHeight(){
	let height = document.getElementById('iframe').contentWindow.document.body.scrollHeight;	//id가 iframe인 화면의 스크롤 높이를 가져와 변수에 저장
	iframe.style.height = height+50+"px"; //iframe의 높이를 위에서 얻은 값으로 설정
	iframe.style.overflow = "hidden"; //iframe의 overflow 숨기기
}

</script>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<%@include file="../main/header.jsp" %> 
<body>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
	<main class="main-content">
		<div class="page">
			<div class="info">
	      		<i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 100px;"></i>
	         	<div class="txt-wrap">
	         		<h2>닉네임칸</h2>
	         		<p>등록한 게시물 수 : ?</p>
	         		<p>댓글 수 : ?</p>
	         	</div>
			    <button type="button" onclick="location.href='myInfoUpdate.jsp'">수정</button>     	
			</div>
     		
			<nav id="mypage-nav">
				<div class="category-container">
					<ul class="flex-start">
						<li><a href="#" class="category" data-page="saleList.jsp">판매물품</a></li>
						<li><a href="#" class="category" data-page="myReviewList.jsp">거래후기</a></li>
						<li><a href="#" class="category" data-page="interestList.jsp">관심목록</a></li>
						<li><a href="#" class="category" data-page="recentList.jsp">최신본상품</a></li>
						<li><a href="#" class="category" data-page="userAskList.jsp">1:1문의</a></li>
					</ul>
				</div>
			</nav>
			<div id="mypage-content">
				<div class="category-container">
					<div id="category-recent" class="flex-align-start">
					<iframe src="saleList.jsp" id="iframe" onload="IframeHeight();"frameborder="0" scrolling="auto" style="width:100%; overflow:auto; overflow-x:hidden;"></iframe>
					</div>
				</div>
			</div>        	
		</div>	          
	</main>   
</div>
</body>
<footer>
<%@include file="../main/footer.jsp" %>
</footer>
</html>