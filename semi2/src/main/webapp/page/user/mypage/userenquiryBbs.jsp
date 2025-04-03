<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="abao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 리스트</title>
<style>
h2{
	text-align: center;
}
table{
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

%>
<body>
<section>
<article>
	<h2>문의사항 리스트</h2>
	<table border="0" width="350">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>상태</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
		<tfoot>
			<tr>
			</tr>
		</tfoot>
	</table>
</article>
</section>
</body>
</html>