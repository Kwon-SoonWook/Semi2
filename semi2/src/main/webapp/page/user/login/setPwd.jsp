<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<% 
String pwd = (String)session.getAttribute("pwd");
%>
<!-- Pretendard 폰트 적용 -->
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
form {
    background: #fff;
    padding: 32px 28px 22px 28px;
    border-radius: 14px;
    box-shadow: 0 4px 24px 0 rgba(60,60,60,0.07);
    max-width: 340px;
    margin: 100px auto;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.current-pwd, .form-group {
    margin-bottom: 18px;
    font-size: 1.07em;
    color: #222;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    font-family: "Pretendard-Regular";
}
.current-pwd span {
    font-family: "Pretendard-SemiBold";
    color: #444;
}
input[type="password"] {
    width: 100%;
    padding: 10px 13px;
    border: 1px solid #d5d5d5;
    border-radius: 7px;
    font-size: 1em;
    margin-top: 7px;
    box-sizing: border-box;
    background: #fafbfc;
    font-family: "Pretendard-Regular";
    transition: border 0.2s;
}
input[type="password"]:focus {
    border: 1.5px solid #6d8132;
    outline: none;
}
.button-group {
    width: 100%;
    display: flex;
    gap: 10px;
    justify-content: space-between;
    margin-top: 10px;
}
input[type="button"], input[type="submit"] {
    background: #6d8132;
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 12px 0;
    width: 48%;
    font-size: 1em;
    font-family: "Pretendard-SemiBold";
    cursor: pointer;
    transition: all 0.18s;
}
input[type="button"]:hover, 
input[type="submit"]:hover {
    background: #fff;
    color: #6d8132;
    border: 1.5px solid #6d8132;
}
</style>
<script>
function centerPopup() {
    if (window.opener) {
        var width = window.outerWidth;
        var height = window.outerHeight;
        var screenX = window.screenX !== undefined ? window.screenX : window.screenLeft;
        var screenY = window.screenY !== undefined ? window.screenY : window.screenTop;
        var screenW = window.screen.width;
        var screenH = window.screen.height;
        var left = Math.max(0, (screenW - width) / 2);
        var top = Math.max(0, (screenH - height) / 2);
        window.moveTo(left, top);
    }
}
window.onload = centerPopup;
</script>
</head>
<body>
<form action="setPwd_ok.jsp">
    <div class="current-pwd">
        현재 비밀번호 <span>: <%=pwd %></span>
    </div>
    <div class="form-group">
        새로운 비밀번호
        <input type="password" name="pwd" autocomplete="off" required>
    </div>
    <div class="form-group">
        비밀번호 확인
        <input type="password" name="check_pwd" autocomplete="off" required>
    </div>
    <input type="hidden" name="originpwd" value="<%=pwd%>">
    <div class="button-group">
        <input type="button" value="기존 비밀번호 사용" onclick="window.close();">
        <input type="submit" value="비밀번호 변경">
    </div>
</form>
</body>
</html>
