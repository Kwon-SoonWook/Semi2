<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- Pretendard 폰트 적용 -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<style>
@font-face {
  font-family: "Pretendard-Regular";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff") format("woff");
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-SemiBold";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff") format("woff");
  font-weight: 600;
  font-style: normal;
}
body {
    font-family: "Pretendard-Regular", Helvetica, Arial, sans-serif;
    background: #fafbfc;
    margin: 0;
    padding: 0;
    min-height: 100vh;
}
.signup-container {
    max-width: 420px;
    margin: 60px auto 0 auto;
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 4px 24px 0 rgba(60,60,60,0.07);
    padding: 48px 36px 36px 36px;
}
.signup-title {
    font-family: "Pretendard-SemiBold";
    font-size: 1.6rem;
    color: #1c1c1e;
    margin-bottom: 24px;
    text-align: center;
    letter-spacing: -0.5px;
}
.form-group {
    margin-bottom: 22px;
}
.form-group label {
    display: block;
    font-family: "Pretendard-SemiBold";
    font-size: 1rem;
    color: #222;
    margin-bottom: 7px;
    letter-spacing: -0.2px;
}
.form-group input[type="text"],
.form-group input[type="password"],
.form-group input[type="file"] {
    width: 100%;
    padding: 11px 13px;
    font-size: 1rem;
    border: 1px solid #d5d5d5;
    border-radius: 7px;
    background: #fafbfc;
    transition: border 0.2s;
    font-family: "Pretendard-Regular";
}
.form-group input[type="text"]:focus,
.form-group input[type="password"]:focus {
    border: 1.5px solid #6d8132;
    outline: none;
}
.form-group input[type="file"] {
    padding: 7px 0;
    background: none;
}
.form-inline {
    display: flex;
    gap: 10px;
    align-items: center;
}
.btn-check {
    font-family: "Pretendard-SemiBold";
    font-size: 0.80rem;
    border-radius: 7px;
    padding: 7px 17px;
    border: 1px solid #6d8132;
    background: #fff;
    color: #6d8132;
    cursor: pointer;
    transition: all 0.18s;
}
.btn-check:hover {
    background: #6d8132;
    color: #fff;
}
.signup-btn {
    width: 100%;
    background: #6d8132;
    color: #fff;
    font-family: "Pretendard-SemiBold";
    font-size: 1.1rem;
    border: none;
    border-radius: 8px;
    padding: 13px 0;
    margin-top: 10px;
    cursor: pointer;
    transition: all 0.2s;
}
.signup-btn:hover {
    background: #fff;
    color: #6d8132;
    border: 1.5px solid #6d8132;
}
@media (max-width: 600px) {
    .signup-container {
        max-width: 92vw;
        padding: 28px 5vw 18px 5vw;
    }
}
</style>
<script>
function popup() {
    window.open('duptest.jsp', 'popup', 'width=700,height=300');
}
function popup2() {
    window.open('nickduptest.jsp', 'popup', 'width=700,height=300');
}
</script>
</head>
<body>
<div class="signup-container">
    <div class="signup-title">회원가입</div>
    <form action="signUp_ok.jsp" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="id">아이디</label>
            <div class="form-inline">
                <input type="text" name="id" id="id" readonly>
                <button type="button" class="btn-check" onclick="popup()">중복검사</button>
            </div>
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" name="pwd" id="pwd" required
       onkeydown="return event.key !== ' ';"
       oninput="this.value = this.value.replace(/\s/g, '');">
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" id="name" required
            onkeydown="return event.key !== ' ';"
       		oninput="this.value = this.value.replace(/\s/g, '');">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" name="email" id="email" required
            onkeydown="return event.key !== ' ';"
       		oninput="this.value = this.value.replace(/\s/g, '');">
        </div>
        <div class="form-group">
            <label for="nickname">닉네임</label>
            <div class="form-inline">
                <input type="text" name="nickname" id="nickname" readonly>
                <button type="button" class="btn-check" onclick="popup2()">중복검사</button>
            </div>
        </div>
        <div class="form-group">
            <label for="location">거주 지역 (00구)</label>
            <input type="text" name="location" id="location" required
            onkeydown="return event.key !== ' ';"
       		oninput="this.value = this.value.replace(/\s/g, '');">
        </div>
        <div class="form-group">
            <label for="img">프로필 사진</label>
            <input type="file" name="img" id="img" accept="image/*">
        </div>
        <button type="submit" class="signup-btn">회원가입</button>
    </form>
</div>
</body>
</html>
