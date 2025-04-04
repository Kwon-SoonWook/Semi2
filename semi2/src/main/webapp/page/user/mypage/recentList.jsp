<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품 리스트</title>
<style>
body{
	height: auto;
	overflow: hidden;
}
h2{
	text-align: center;
}
table{
	height: auto;
	width: 550px;
	margin: 0px auto;
	border-top:3px double darkgray;
	border-bottom: 3px double darkgray;
}
table thead th{
	background-color : lightgray;
}

</style>
</head>
<%
String rid = (String)session.getAttribute("sid");
%>
<body>
<section>
<article>
	<h2>아직 개발중입니다.</h2>
</article>
</section>
</body>
</html>