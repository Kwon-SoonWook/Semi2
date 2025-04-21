<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
.withdraw-container {
    max-width: 420px;
    margin: 120px auto 0 auto;
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 4px 24px 0 rgba(60,60,60,0.07);
    padding: 48px 36px 36px 36px;
    text-align: center;
}
.withdraw-title {
    font-family: "Pretendard-SemiBold";
    font-size: 1.5rem;
    color: #1c1c1e;
    margin-bottom: 14px;
    letter-spacing: -0.5px;
}
.withdraw-desc {
    font-size: 1.08rem;
    color: #505050;
    margin-bottom: 36px;
    line-height: 1.7;
}
.button-group {
    display: flex;
    justify-content: center;
    gap: 18px;
}
.btn-cancel, .btn-withdraw {
    font-family: "Pretendard-SemiBold";
    font-size: 1.07rem;
    border-radius: 8px;
    padding: 12px 32px;
    border: none;
    cursor: pointer;
    transition: all 0.2s;
    outline: none;
}
.btn-cancel {
    background: #f5f5f5;
    color: #505050;
    border: 1px solid #d5d5d5;
}
.btn-cancel:hover {
    background: #e2e2e2;
    color: #222;
}
.btn-withdraw {
    background: #6d8132;
    color: #fff;
    border: 1px solid #6d8132;
}
.btn-withdraw:hover {
    background: #fff;
    color: #6d8132;
    border: 1px solid #6d8132;
}
@media (max-width: 600px) {
    .withdraw-container {
        max-width: 90vw;
        padding: 32px 10vw 28px 10vw;
    }
    .button-group {
        flex-direction: column;
        gap: 12px;
    }
}
</style>
</head>
<body>
<div class="withdraw-container">
    <div class="withdraw-title">정말로 탈퇴하시겠습니까?</div>
    <div class="withdraw-desc">
        탈퇴 시 회원님의 모든 정보가 삭제되며<br>
        복구가 불가능합니다.<br>
        <span style="color:#e74c3c;">탈퇴 후에는 동일한 계정으로 재가입이 불가할 수 있습니다.</span>
    </div>
    <div class="button-group">
        <button class="btn-cancel" onclick="location.href='/semi2/page/user/main/index.jsp'">취소</button>
        <button class="btn-withdraw" onclick="location.href='myInfoDelete_ok.jsp'">회원 탈퇴</button>
    </div>
</div>
</body>
</html>
