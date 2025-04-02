<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <%@include file="category.jsp" %>
        <main class="main-content">
      <%if(sid!=null){ %>
           <h2></h2>
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
        <%}else{ %>
           <h2>로그인 시 이용 가능합니다.</h2>
           <h4>소중한 물건을 재활용하고 재탄생 시키는 공간! 노후재활센터에서 따뜻한 거래를 시작하세요.</h4>
        <%} %>
        </main>   
    </div>
</body>
</html>