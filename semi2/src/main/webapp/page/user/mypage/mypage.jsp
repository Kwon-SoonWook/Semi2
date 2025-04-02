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
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<%@include file="../main/header.jsp" %> 
<body>
    <div id="container">
        <%@include file="/page/user/main/category.jsp" %>
        <main class="main-content">
	        <div class="mypage-container">
                <div class="page">
                	<div class="mypage-header"></div>
                   	<i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 100px;"></i>
                	<div class="txt-wrap">
                		<h2>닉네임칸</h2>
                		<p>등록한 게시물 수</p>
                		<p>댓글 수</p>
                	</div>
                	<button type="button" class="btn-subscribe">수정</button>
                </div>	          
			</div>
        </main>   
    </div>
</body>
<footer>
<%@include file="../main/footer.jsp" %>
</footer>
</html>