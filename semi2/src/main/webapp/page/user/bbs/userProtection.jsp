<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>이용자보호 비전과 계획 | 노후재활센터 중고거래</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<style>
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
  <div class="terms-title">이용자보호 비전과 계획</div>
  <div class="terms-subtitle">노후재활센터 중고거래 플랫폼 이용자보호 비전과 실천 계획</div>

  <div class="terms-section">
    <h2>이용자보호 비전</h2>
    <ul class="terms-list">
      <li><b>신뢰 기반의 안전한 중고거래 환경 조성</b><br>
        모든 이용자가 안심하고 거래할 수 있는 신뢰와 투명성의 플랫폼을 지향합니다.
      </li>
      <li><b>이용자 피해 예방 및 신속한 구제</b><br>
        거래 과정에서 발생할 수 있는 피해를 사전에 예방하고, 피해 발생 시 신속하고 실질적인 구제책을 제공합니다.
      </li>
      <li><b>정보 비대칭 해소와 공정한 거래문화 정착</b><br>
        거래 당사자 간의 정보 격차를 줄이고, 누구나 공정하게 참여할 수 있는 거래문화를 만듭니다.
      </li>
      <li><b>지속적인 서비스 개선과 이용자 목소리 반영</b><br>
        이용자 의견을 적극 수렴하고, 서비스와 정책을 지속적으로 개선합니다.
      </li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>이용자보호 실천 계획</h2>
    <ul class="terms-list">
      <li><b>1. 안전결제 및 보상제도 강화</b><br>
        - 에스크로 기반의 안전결제 시스템을 기본 적용하고, 사기·미배송 등 피해 발생 시 신속한 보상제도를 운영합니다.<br>
        - 피해 발생 시 최대 보상 한도를 명확히 고지하고, 이용자 피해 구제에 최우선으로 대응합니다.<br>
        <span style="color:#6d8132;">(참고: 당근, 번개장터, 중고나라 등 주요 플랫폼의 안심결제·보상제도 도입 사례)</span>
      </li>
      <li><b>2. 거래 신뢰도 제고 및 모니터링 체계 구축</b><br>
        - 실명 인증, 신원 확인, 거래 후 상호 평가 시스템을 강화하여 신뢰할 수 있는 거래 환경을 만듭니다.<br>
        - 전문 모니터링팀을 운영해 허위·과장·사기성 게시물, 반복 도배, 불법 거래 등을 신속히 차단합니다.
      </li>
      <li><b>3. 이용자 피해 예방 교육 및 정보 제공</b><br>
        - 반품·환불 등 거래조건, 물품 상태 확인, 안전결제 이용법 등 분쟁 예방 가이드를 적극 안내합니다.<br>
        - 사기 예방 교육, 안전거래 체크리스트, 신고·구제 절차를 플랫폼 내외에서 상시 제공·홍보합니다.
      </li>
      <li><b>4. 분쟁조정 및 피해구제 지원</b><br>
        - 거래 분쟁 발생 시 전자거래분쟁조정위원회 등 외부 기관과 연계해 신속한 분쟁조정 및 피해구제를 지원합니다.<br>
        - 플랫폼 내 신속한 신고 및 상담 채널을 운영합니다.
      </li>
      <li><b>5. 개인정보 보호 및 안전한 거래환경 조성</b><br>
        - 거래 과정에서 취득한 개인정보는 엄격히 보호하며, 불필요한 노출을 최소화합니다.<br>
        - 메시지·결제 등 플랫폼 내 안전한 커뮤니케이션 환경을 제공합니다.
      </li>
      <li><b>6. 제도 개선 및 사회적 협력</b><br>
        - 관련 법령 개정, 정부·유관기관과의 협력을 통해 이용자 보호 제도를 지속적으로 개선합니다.<br>
        - 이용자보호 책임자를 지정하고, 운영정책·서비스를 정기적으로 점검 및 개선합니다.
      </li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>추진 일정 및 점검</h2>
    <ul class="terms-list">
      <li>분기별로 이용자보호 정책의 효과와 미비점을 점검하고, 실적 및 개선사항을 홈페이지에 투명하게 공개합니다.</li>
      <li>이용자 의견을 상시 수렴하여 서비스 및 정책에 반영합니다.</li>
    </ul>
    <div class="terms-note">
      노후재활센터는 이용자 여러분의 신뢰와 안전을 최우선 가치로 삼고, 모두가 안심하고 거래할 수 있는 중고거래 환경을 만들기 위해 최선을 다하겠습니다.
    </div>
  </div>
</div>
</main>
<%@include file="/page/user/main/footer.jsp"%>
</body>
</html>
