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
    form {
        background: #fff;
        padding: 30px 25px 20px 25px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        max-width: 340px;
        margin: 100px auto;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .current-pwd {
        width: 100%;
        margin-bottom: 18px;
        font-size: 1.05em;
        color: #333;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }
    div {
        margin-bottom: 18px;
        font-size: 1.05em;
        color: #333;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }
    input[type="password"] {
        width: 100%;
        padding: 8px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
        margin-top: 6px;
        box-sizing: border-box;
        transition: border 0.2s;
    }
    input[type="password"]:focus {
        border: 1.5px solid #0078ff;
        outline: none;
    }
    .button-group {
        width: 100%;
        display: flex;
        gap: 10px;
        justify-content: space-between;
        margin-bottom: 100;
    }
    input[type="button"], input[type="submit"] {
        background: #0078ff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 9px 0;
        width: 48%;
        font-size: 0.85em;
        cursor: pointer;
        transition: background 0.2s;
    }
    input[type="button"]:hover, input[type="submit"]:hover {
        background: #005fcc;
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
        현재 비밀번호 <span style="font-weight:600;">: <%=pwd %></span>
    </div>
    <div>
        새로운 비밀번호
        <input type="password" name="pwd" autocomplete="off">
    </div>
    <div>
        비밀번호 확인
        <input type="password" name="check_pwd" autocomplete="off">
    </div>
    <input type = "hidden" name = "originpwd">
    <div class="button-group">
        <input type="button" value="기존 비밀번호 사용" onclick="window.close();">
        <input type="submit" value="비밀번호 변경">
    </div>
</form>
</body>
</html>
