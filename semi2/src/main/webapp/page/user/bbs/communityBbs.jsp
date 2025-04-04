<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<%String indexid = (String)session.getAttribute("sid"); %>
</head>
<%@include file="/page/user/main/header.jsp" %> 
<title>Insert title here</title>
<body>
<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">

<h2 style = text-align:center;>자 유 게 시 판</h2>
<input type = "submit" value="글쓰기" onclick="location.href='writeBbsPost.jsp'">




    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>