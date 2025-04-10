<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>
    <link rel='stylesheet' type='text/css' href='/semi2/page/admin/adminLayout.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%@include file="adminHeader.jsp" %>
    <div class="container">
        <!-- 사이드바 -->
        <%@include file="adminCategory.jsp" %>
		<%
		int totalCount = (int)session.getAttribute("totalCount");
		int todayCount = (int)session.getAttribute("todayCount");
		%>
        <!-- 대시보드 내용 -->
        <div class="content">
            <h1>대시보드</h1>
            <div class="cards">
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="card-info">
                        <h3>총 방문자</h3>
                        <p><%=totalCount %>명</p>
                        <h3>오늘 방문자</h3>
                        <p><%=todayCount %>명</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="card-info">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-box"></i>
                    </div>
                    <div class="card-info">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>