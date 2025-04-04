<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
text-align: center;
position : relative;
top: 300px;
}
.out {
position : relative;
top : 670px;
left : 700px;
}
</style>
</head>
<body>
<div>
정말로 탈퇴 하실건가요..?<br>
<input type = "button" value="아니오" onclick="location.href='../main/index.jsp'">
<input type = "button" value="탈퇴안하기" onclick="location.href='../main/index.jsp'">
</div>
<div class = "out">
<input type = "button" name = "out" value="탈퇴하기" onclick="location.href='myInfoDelete_ok.jsp'">
</div>
</body>
</html>