<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='/semi2/page/admin/adminLayout.css'>
<style>
.container1 {
	display: flex;
}

.main-content1 {
	flex: 1;
	background-color: #fff;
	padding: 30px;
	box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #2f3640;
}

section {
	width: 1000px;
	margin: auto;
}

form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.search-bar {
	text-align: center;
	margin-top: 20px;
}

.search-bar select,
.search-bar input[type="text"] {
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

.search-bar input[type="button"] {
	padding: 10px 20px;
	background-color: #0984e3;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search-bar input[type="button"]:hover {
	background-color: #74b9ff;
}

/* 예: userInfoList.jsp에서 테이블이 있을 경우를 대비한 기본 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dcdde1;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #f1f2f6;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
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
    <div class="container1">
	<%@include file="../main/adminCategory.jsp" %>
	    <main class="main-content1">
	        <section>
	            <article>
	                <h2>사용자 관리</h2>
	                <form name='userManagement' action='deleteUserInfo.jsp'>
	                    <%@include file="userInfoList.jsp" %>
	
	                    <div class="search-bar">
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