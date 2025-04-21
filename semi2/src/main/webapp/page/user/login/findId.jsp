<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
  @font-face {
  font-family: "Pretendard-Regular";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff") format("woff");
  font-weight: 400;
  font-style: normal;
}
body {
    font-family: "Pretendard-Regular", Helvetica, Arial, sans-serif;
    background: #fafbfc;
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
div {
    margin-bottom: 18px;
    font-size: 1.07em;
    color: #222;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    font-family: "Pretendard-Regular";
}
input[type="text"] {
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
input[type="text"]:focus {
    border: 1.5px solid #6d8132;
    outline: none;
}
input[type="submit"] {
    background: #6d8132;
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 12px 0;
    width: 100%;
    font-size: 1.07em;
    font-family: "Pretendard-SemiBold";
    cursor: pointer;
    transition: all 0.18s;
    margin-top: 4px;
}
input[type="submit"]:hover {
    background: #fff;
    color: #6d8132;
    border: 1.5px solid #6d8132;
}

</style>
<script>
// 팝업창을 중앙에 띄우는 함수
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
<form action="findId_ok.jsp">
    <div>
        이름
        <input type="text" name="name" autocomplete="off"
        onkeydown="return event.key !== ' ';"
       oninput="this.value = this.value.replace(/\s/g, '');">
    </div>
    <div>
        이메일
        <input type="text" name="email" autocomplete="off"
        onkeydown="return event.key !== ' ';"
       oninput="this.value = this.value.replace(/\s/g, '');">
    </div>
    <input type="submit" value="아이디 찾기">
</form>
</body>
</html>
