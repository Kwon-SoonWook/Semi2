<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        background: #fff; /* 완전 흰색 배경 */
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
        max-width: 320px;
        margin: 100px auto;
        display: flex;
        flex-direction: column;
        align-items: center;
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
    input[type="text"] {
        width: 100%;
        padding: 8px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
        margin-top: 6px;
        box-sizing: border-box;
        transition: border 0.2s;
    }
    input[type="text"]:focus {
        border: 1.5px solid #0078ff;
        outline: none;
    }
    input[type="submit"] {
        background: #0078ff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 9px 0;
        width: 100%;
        font-size: 1.05em;
        cursor: pointer;
        transition: background 0.2s;
    }
    input[type="submit"]:hover {
        background: #005fcc;
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
        <input type="text" name="name" autocomplete="off">
    </div>
    <div>
        이메일
        <input type="text" name="email" autocomplete="off">
    </div>
    <input type="submit" value="아이디 찾기">
</form>
</body>
</html>
