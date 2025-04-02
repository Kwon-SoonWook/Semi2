<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
String pwd = (String)session.getAttribute("pwd");
%>
</head>
<body>
<form action="setPwd_ok.jsp">
현재 비밀번호 : <%=pwd %>
<div>
바꿀 비밀번호
<input type = "password" name = "pwd">
</div>
<div>
비밀번호 확인
<input type = "password" name = "check_pwd">
</div>
<div>
<input type = "button" value = "기존 비밀번호 사용" onclick="window.close();">
<input type = "submit" value = "비밀번호 변경">
</div>
</form>
</body>
</html>