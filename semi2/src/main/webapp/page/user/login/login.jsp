<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function show(){
	window.open('findId.jsp','idpopup','width = 500 height = 500')
	
}
function show2(){
	window.open('findPwd.jsp','pwdpopup','width = 500 height = 500')
	
}

</script>
<title>Insert title here</title>
</head>
<h2>로 그 인 </h2>
<body>
<form action = "login_ok.jsp">
<div>
아이디 : 
<input type = "text" name = "id">
</div>
<div>
비밀번호 : 
<input type = "password" name = "pwd">
</div>
<input type ="submit" value = "로그인">
<input type ="button" value = "회원가입" onclick="location.href='signUp.jsp'">
<input type ="button" value = "아이디찾기" onclick="show();">
<input type ="button" value = "비밀번호찾기" onclick="show2();">
<div><input type = "checkbox" name = "rememid" value = "아이디 기억">아이디 기억하기</div>
</form>
</body>
</html>