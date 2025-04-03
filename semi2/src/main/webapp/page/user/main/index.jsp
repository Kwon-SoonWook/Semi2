<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<link rel="stylesheet" type="text/css" href="mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<%String indexid = (String)session.getAttribute("sid"); %>
</head>
<%@include file="/page/user/main/header.jsp" %> 
<title>Insert title here</title>
<body>
<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">
      	<%if(indexid!=null){ %>
        	<h2>오늘의 추천 목록</h2>
	    	<div class="photo-grid">
	        <%for(int i=0; i<60; i++){ %>
	            <div class="photo-card">
		            <a href="#">
			            <div class="thumbnail"></div>
				        <h3>제목1</h3>
				        <p>내용1</p>
		            </a>
	            </div>
	        <% }%>  
	        </div>
       	<%}else{ %>
           	<h2>로그인 시 이용 가능합니다.</h2>
           	<h4>소중한 물건을 재활용하고 재탄생 시키는 공간! 노후재활센터에서 따뜻한 거래를 시작하세요.</h4>
        <%} %>
    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>