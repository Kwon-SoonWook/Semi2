<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
function popup() {
    window.open('duptest.jsp', 'popup', 'width=700,height=300');
}
function popup2() {
    window.open('nickduptest.jsp', 'popup', 'width=700,height=300');
}
</script>
<style>
/* 기본 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    margin-top: 20px;
    color: #333;
}

form {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

form div {
    margin-bottom: 15px;
}

form div label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

form div input[type="text"],
form div input[type="password"],
form div input[type="file"] {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

form div input[type="button"] {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 4px;
    cursor: pointer;
}

form div input[type="button"]:hover {
    background-color: #0056b3;
}

form input[type="submit"] {
    width: calc(100% - 20px);
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 4px;
    cursor: pointer;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>


<form action="signUp_ok.jsp" method="post" enctype="multipart/form-data">
    
<div>
<h2>회원가입</h2>
<label for="id">아이디:</label>
<input type="text" name="id" id="id" readonly>
<input type="button" value="중복검사" onclick="popup()">
</div>

<div>
<label for="pwd">비밀번호:</label>
<input type="password" name="pwd" id="pwd">
</div>

<div>
<label for="name">이름:</label>
<input type="text" name="name" id="name">
</div>

<div>
<label for="email">이메일:</label>
<input type="text" name="email" id="email">
</div>

<div>
<label for="nickname">닉네임:</label>
<input type="text" name="nickname" id="nickname" readonly>
<input type="button" value="중복검사" onclick="popup2()">
</div>

<div>
<label for="location">거주 지역 (00구):</label>
<input type="text" name="location" id="location">
</div>

<div>
<label for="img">프로필 사진:</label>
<input type="file" name="img" id="img">
</div>

<input type="submit" value="회원가입">

</form>

</body>
</html>
