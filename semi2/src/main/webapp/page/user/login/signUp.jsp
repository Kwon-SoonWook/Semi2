 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function popup(){
	
	window.open('duptest.jsp','popup','width = 700 height = 300')
}

function popup2(){
	window.open('fileupload.jsp','popup2','width = 300 height = 300')
}
</script>
</head>
<body>
<h2>회 원 가 입</h2>
<form action = "signUp_ok.jsp">
<div>아이디 : 
<input type = "text" name = "id" id = "id" readonly>
<input type = "button" value = "중복검사" onclick = 'popup()'>
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
<div> 
<input type = "button" value = "프로필 사진 등록" onclick='popup2()'>
</div>
<input type="hidden" name = "profile_uri" id = "profile"> 
<input type = "submit" value = "회원가입">
</form>
</body>
</html>