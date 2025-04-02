 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회 원 가 입</h2>
<form action = "signUp_ok.jsp">
<div>아이디 : 
<input type = "text" name = "id">
<input type = "submit" value = "중복검사">
</div>
<div>비밀번호 : 
<input type = "password" name = "pwd">
</div>
<div>이름 : 
<input type = "text" name = "name">
</div>
<div>이메일 : 
<input type = "text" name = "email">
</div>
<div>닉네임 : 
<input type = "text" name = "nickname">
</div>
<div>거주 지역(00구) : 
<input type = "text" name = "location">
</div>
<div>프로필 사진 : 
<input type = "file" name = "uri">
</div>
<input type = "submit" value = "회원가입">
</form>
</body>
</html>