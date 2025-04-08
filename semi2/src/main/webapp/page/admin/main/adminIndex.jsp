<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>
    <link rel='stylesheet' type='text/css' href='/semi2/css/adminLayout.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    display: flex;
    min-height: 100vh;
    background-color: #f4f7fc;
}

.container {
    display: flex;
    flex-direction: row;
    width: 100%;
}

.sidebar {
    width: 250px;
    background-color: #2c3e50;
    color: white;
    padding: 20px;
    height: 100vh;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
}

.sidebar ul {
    list-style-type: none;
}

.sidebar ul li {
    margin-bottom: 20px;
}

.sidebar ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
}

.sidebar ul li a:hover {
    color: #3498db;
}

.content {
    flex-grow: 1;
    padding: 30px;
}

h1 {
    color: #333;
    font-size: 2em;
    margin-bottom: 30px;
}

.cards {
    display: flex;
    justify-content: space-between;
}

.card {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 30%;
    padding: 20px;
    text-align: center;
}

.card-icon {
    font-size: 40px;
    margin-bottom: 20px;
    color: #3498db;
}

.card-info h3 {
    font-size: 1.2em;
    margin-bottom: 10px;
}

.card-info p {
    font-size: 1.5em;
    font-weight: bold;
}

.container {
    display: flex;
    flex-direction: row;
    width: 100%;
}

.sidebar {
    width: 250px;
    background-color: #2c3e50;
    color: white;
    padding: 20px;
    height: 100vh;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
}

.sidebar ul {
    list-style-type: none;
}

.sidebar ul li {
    margin-bottom: 20px;
}

.sidebar ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
}

.sidebar ul li a:hover {
    color: #3498db;
}

.content {
    flex-grow: 1;
    padding: 30px;
}

h1 {
    color: #333;
    font-size: 2em;
    margin-bottom: 30px;
}

.cards {
    display: flex;
    justify-content: space-between;
}

.card {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 30%;
    padding: 20px;
    text-align: center;
}

.card-icon {
    font-size: 40px;
    margin-bottom: 20px;
    color: #3498db;
}

.card-info h3 {
    font-size: 1.2em;
    margin-bottom: 10px;
}

.card-info p {
    font-size: 1.5em;
    font-weight: bold;
}

</style>
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