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
        <%@include file="../main/adminCategory.jsp" %>
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