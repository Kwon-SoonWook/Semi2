<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='/semi2/css/adminLayout.css'>
<style>
h2{
	text-align: center;
}
table{
	width: 800px;
	margin: 0px auto;
	border-top: 3px solid gray;
	border-bottom: 3px solid gray;
	font-size: 12px;
}
table th{
	background-color: silver;
}
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
<script>
function show(){
	var input =  document.userManagement.input.value;
	var select = document.userManagement.select.value;
	location.href="userManagement.jsp?input="+input+"&select="+select;
}
</script>
</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
    <div class="container">
        <!-- 사이드바 -->
		<%@include file="../main/adminCategory.jsp" %>
        <!-- 대시보드 내용 -->
        <main class="main-content">
			<section style="width: 800px; margin: auto;">
				<article>
				<h2>사용자 관리</h2>
				<form name='userManagement' action='deleteUserInfo.jsp'>
					<%@include file="userInfoList.jsp" %>
					<br>
					<div style="text-align: center;">
					<select name="select">
					<option>전체</option>
					<option>ID</option>
					<option>이름</option>
					<option>닉네임</option>
					</select>
					<input type="text" name="input">
					<input type="button" value="검색" onclick="show();">
					</div>
				</form>
				</article>
			</section>	           
			</main>
    </div>
</body>
</html>