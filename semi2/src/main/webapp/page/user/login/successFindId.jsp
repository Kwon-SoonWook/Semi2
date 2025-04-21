<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String id = request.getParameter("id");
%>
<title>아이디 안내</title>
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
}
.result-box {
    background: #fff;
    padding: 38px 30px 32px 30px;
    border-radius: 14px;
    box-shadow: 0 4px 24px 0 rgba(60,60,60,0.07);
    max-width: 340px;
    margin: 120px auto;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.result-box h2 {
    margin: 0 0 14px 0;
    font-size: 1.18em;
    color: #222;
    font-family: "Pretendard-SemiBold";
    font-weight: 600;
    text-align: center;
    letter-spacing: -0.4px;
}
.user-id {
    font-size: 1.35em;
    font-family: "Pretendard-SemiBold";
    font-weight: 600;
    color: #6d8132;
    margin-bottom: 16px;
    word-break: break-all;
    letter-spacing: 0.5px;
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
<div class="result-box">
    <h2>회원님의 아이디는</h2>
    <div class="user-id"><%=id %></div>
    <h2>입니다.</h2>
</div>
</body>
</html>
