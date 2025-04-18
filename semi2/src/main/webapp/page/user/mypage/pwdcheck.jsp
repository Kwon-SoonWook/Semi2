<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<style>
@font-face {
  font-family: "Pretendard-Regular";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff")
    format("woff");
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-Medium";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Medium.woff")
    format("woff");
  font-weight: 500;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-SemiBold";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff")
    format("woff");
  font-weight: 600;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-Bold";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Bold.woff")
    format("woff");
  font-weight: 700;
  font-style: normal;
}
html, body {
    width: 500px;
    height: 300px;
    margin: 0;
    padding: 0;
    overflow: hidden;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f9f9f9;
    display: flex;
    align-items: center;
    justify-content: center;
}

form {
    background-color: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    text-align: center;
}

h2 {
	font-family: "Pretendard-Bold", Helvetica;
    margin-bottom: 20px;
    color: #333;
}

input[type="text"], input[type="password"] {
    width: 80%;
    padding: 10px;
    font-size: 16px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 6px;
    transition: border 0.3s;
}

input[type="text"]:focus, input[type="password"]:focus {
    border-color: #6E8233;
    outline: none;
}

button {
	font-family: "Pretendard-SemiBold", Helvetica;
    background-color: #6E8233;
    color: white;
    padding: 10px 25px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background: #f5f5f5;
    color: #000;
    border-color: #bbb;
}
</style>
</head>
<%
String spwd = (String)session.getAttribute("pwd");
%>
<script>
function pwdcheck(){
	let input = document.querySelector('input[type="password"]');
	if(input.value == '<%=spwd%>'){
		alert('확인되셨습니다.');
		window.opener.location = 'myInfoUpdate.jsp';
		window.close();
	}else{
		alert('비밀번호가 다릅니다.');
	}
}
</script>
<body>
	<form onsubmit="return pwdcheck();">
		<h2>비밀번호 확인</h2>
		<input type = "password" name="password">
		<button type = "submit">확인</button>
	</form>
</body>
</html>