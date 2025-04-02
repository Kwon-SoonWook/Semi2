<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String id = request.getParameter("id");
%>
<title>Insert title here</title>
</head>
<body>
<h2>회원님의 아이디는 </h2> <br>
<%=id %><br>
<h2>입니다.</h2>
</body>
</html>