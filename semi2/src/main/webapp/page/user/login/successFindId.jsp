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
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        background: #fff;
    }
    body {
        width: 100vw;
        height: 50vh;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, sans-serif;
    }
    .result-box {
        background: #fff;
        padding: 35px 30px 30px 30px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        max-width: 340px;
        margin: 110px auto;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .result-box h2 {
        margin: 0 0 18px 0;
        font-size: 1.2em;
        color: #222;
        font-weight: 500;
        text-align: center;
    }
    .user-id {
        font-size: 1.4em;
        font-weight: bold;
        color: #0078ff;
        margin-bottom: 18px;
        word-break: break-all;
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
