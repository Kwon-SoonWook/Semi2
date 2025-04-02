<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<link rel="stylesheet" type="text/css" href="mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<script>
</script>
</head>
<%@include file="header.jsp" %>
<body>
    <div class="container">
        <%@include file="category.jsp" %>
        <main class="main-content">
        	<h2>오늘의 추천 아이템</h2>
            <div class="photo-grid">
            <%for(int i=0; i<60; i++){ %>
                <div class="photo-card">
                	<a href="#">
                    <div class="page"></div>
                    <h3>제목1</h3>
                    <p>내용1</p>
                    </a>
                </div>
             <% }%>  
            </div>
        </main>
    </div>
</body>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>