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

/* 흰색 페이지*/
.page {
    background: white;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
.top{
	padding: 50px;
	
}
.mypage-category{

}

</style>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<%@include file="../main/header.jsp" %> 
<body>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
	<main class="main-content">
		<div class="page">
			<div class="top">
	      		<i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 100px;"></i>
	         	<div class="txt-wrap">
	         		<h2>닉네임칸</h2>
	         		<p>등록한 게시물 수</p>
	         		<p>댓글 수</p>
	         	</div>
			    <button type="button" class="btn-subscribe">수정</button>     	
			</div>
     		
			<nav id="mypage-nav">
				<div class="category-container">
					<ul class="flex-start">
						<li><a href="#">판매물품</a></li>
						<li><a href="#">거래후기</a></li>
						<li><a href="#">관심목록</a></li>
						<li><a href="#">최신본상품</a></li>
						<li><a href="#" class="category" data-page="enquiryBbs.jsp">1:1문의</a></li>
					</ul>
				</div>
			</nav>
			<div id="mypage-content">
				<div class="category-container">
					<div id="channel-recent" class="flex-align-start">
					
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