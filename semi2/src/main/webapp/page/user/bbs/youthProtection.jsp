<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>청소년보호정책 | 노후재활센터 중고거래</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<style>
body{
background-color: #EBEDE0;
}
:root {
  --main-color: #6d8132;
  --accent-color: #f8f8f8;
  --text-color: #222;
}
.terms-container {
  max-width: 900px;
  margin: 40px auto 60px auto;
  background: #fff;
  border-radius: 16px;
  box-shadow: 0 4px 16px rgba(109,129,50,0.07);
  padding: 48px 32px 40px 32px;
  font-family: 'Pretendard', 'Malgun Gothic', Arial, sans-serif;
  color: var(--text-color);
  line-height: 1.7;
}
.terms-title {
  font-size: 2.2rem;
  font-weight: 700;
  color: var(--main-color);
  margin-bottom: 8px;
  letter-spacing: -1px;
}
.terms-subtitle {
  font-size: 1.25rem;
  color: #666;
  margin-bottom: 32px;
}
.terms-section {
  margin-bottom: 36px;
}
.terms-section h2 {
  font-size: 1.3rem;
  color: var(--main-color);
  margin-bottom: 12px;
  font-weight: 600;
  border-left: 5px solid var(--main-color);
  padding-left: 12px;
  background: var(--accent-color);
  border-radius: 4px;
}
.terms-list {
  margin-left: 18px;
  margin-bottom: 7px;
}
.terms-list li {
  margin-bottom: 10px;
}
.terms-list b {
  color: var(--main-color);
}
.terms-note {
  background: #f9fbe7;
  border-left: 4px solid var(--main-color);
  padding: 10px 18px;
  border-radius: 6px;
  font-size: 0.98rem;
  color: #4b5b1e;
  margin: 16px 0 0 0;
}
@media (max-width: 900px) {
  .terms-container {
    padding: 24px 10px 24px 10px;
    margin: 20px 4px 36px 4px;
  }
  .terms-title {
    font-size: 1.4rem;
  }
  .terms-section h2 {
    font-size: 1.08rem;
    padding-left: 7px;
  }
}
</style>
</head>
<body>
<%@include file="/page/user/main/header.jsp"%>
<%@include file="/page/user/main/category.jsp" %>
<main class="main-content">
<div class="terms-container">
  <div class="terms-title">청소년보호정책</div>
  <div class="terms-subtitle">노후재활센터 중고거래 플랫폼 청소년보호정책</div>

  <div class="terms-section">
    <h2>1. 청소년 보호의 기본 원칙</h2>
    <ul class="terms-list">
      <li>노후재활센터는 청소년이 안전한 환경에서 건전하게 성장할 수 있도록 <b>청소년 보호정책</b>을 수립·시행합니다.</li>
      <li>청소년 유해정보로부터의 보호, 개인정보 보호, 미디어 역량 강화, 피해 예방 및 신속한 구제에 최선을 다합니다.</li>
      <li>관련 법령(청소년보호법, 정보통신망법 등)과 사회적 책임을 준수합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>2. 유해정보에 대한 청소년 접근 제한 및 관리</h2>
    <ul class="terms-list">
      <li>청소년에게 유해한 정보(성인물, 도박, 폭력, 약물, 음란·선정적·자극적 콘텐츠 등)는 별도의 인증 및 차단장치를 통해 노출을 제한합니다.</li>
      <li>게시글, 댓글, 이미지, 링크 등 모든 콘텐츠에 대해 AI 및 인력 모니터링을 실시하고, 신고 및 자동 필터링 시스템을 운영합니다.</li>
      <li>유해정보 발견 시 신속하게 삭제·차단하며, 청소년 계정에는 추천·노출되지 않도록 조치합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>3. 개인정보 보호 및 권리 보장</h2>
    <ul class="terms-list">
      <li>만 14세 미만 아동·청소년의 개인정보는 법정대리인(부모 등)의 동의 없이 수집·이용하지 않습니다.</li>
      <li>청소년 회원의 개인정보는 최소한으로 수집·이용하며, 높은 수준의 보호 기본값을 적용합니다.</li>
      <li>청소년이 언제든지 자신의 개인정보에 대해 열람, 정정, 삭제, 처리정지, 동의 철회를 요청할 수 있도록 합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>4. 청소년 유해정보 피해상담 및 고충처리</h2>
    <ul class="terms-list">
      <li>청소년 유해정보로 인한 피해상담 및 고충처리를 위한 전문 상담 채널을 운영합니다.</li>
      <li>피해 접수 시 신속히 조사·조치하며, 필요 시 관계기관과 협력합니다.</li>
      <li>상담 및 신고는 고객센터, 이메일, 신고버튼 등을 통해 24시간 접수 가능합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>5. 청소년보호 책임자 지정 및 교육</h2>
    <ul class="terms-list">
      <li>청소년보호책임자를 지정하여 청소년보호 업무를 총괄합니다.</li>
      <li>업무 담당자 및 임직원을 대상으로 청소년보호 관련 법령, 유해정보 식별·대응, 고충처리 절차 등에 대한 정기 교육을 실시합니다.</li>
      <li>청소년보호책임자 연락처: [담당자명] / [이메일] / [전화번호]</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>6. 미디어·디지털 리터러시 및 예방 교육</h2>
    <ul class="terms-list">
      <li>청소년과 보호자 대상 미디어 이용 교육, 안전한 인터넷 사용법, 유해정보 대처법 등 다양한 교육 자료와 가이드를 제공합니다.</li>
      <li>청소년의 미디어 자기결정권과 정보주체 권리 강화를 지원합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>7. 정책의 지속적 개선 및 공지</h2>
    <ul class="terms-list">
      <li>청소년보호정책은 사회 변화와 법령 개정, 서비스 환경 변화에 따라 정기적으로 점검·개선합니다.</li>
      <li>정책 변경 시 홈페이지를 통해 사전 공지합니다.</li>
    </ul>
    <div class="terms-note">
      노후재활센터는 청소년 여러분이 안전하고 건강하게 성장할 수 있는 온라인 환경을 만들기 위해 최선을 다하겠습니다.<br>
      [시행일: 2025년 4월 21일]
    </div>
  </div>
</div>
</main>
<%@include file="/page/user/main/footer.jsp"%>
</body>
</html>
