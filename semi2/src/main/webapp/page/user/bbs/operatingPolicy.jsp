<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>중고거래 플랫폼 운영정책 | 노후재활센터</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<style>
body{
background-color: #EBEDE0;
}
:root {
  --main-color: #6d8132;
  --accent-color: #f8f8f8;
  --text-color: #222;
  --border-color: #e0e0e0;
}
.terms-container {
  max-width: 900px;
  margin: 50px auto 60px auto;
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
  margin-bottom: 4px;
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
<div class="terms-container">
  <div class="terms-title">중고거래 플랫폼 운영정책</div>
  <div class="terms-subtitle">노후재활센터 중고거래 서비스 운영정책</div>

  <div class="terms-section">
    <h2>1. 운영 원칙</h2>
    <ul class="terms-list">
      <li><b>존중</b>: 모든 이용자는 서로를 존중하며, 예의 바른 커뮤니티 문화를 지향합니다.</li>
      <li><b>신뢰</b>: 신뢰할 수 있는 거래 환경 조성을 위해 노력합니다.</li>
      <li><b>프라이버시</b>: 개인정보 보호와 안전한 정보 관리를 최우선으로 합니다.</li>
      <li><b>안전</b>: 사기, 위조상품, 불법·유해 행위로부터 이용자를 보호합니다.</li>
      <li><b>커뮤니티</b>: 건전하고 활발한 커뮤니티 조성을 위해 노력합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>2. 거래 및 서비스 정책</h2>
    <ul class="terms-list">
      <li><b>실명 인증 및 신원 확인</b>: 모든 판매자 및 일정 금액 이상 거래자는 본인 인증 절차(휴대폰, 신분증, 계좌 등)를 거쳐야 합니다.</li>
      <li><b>거래 금지 품목</b>: 법령상 금지된 물품(위조품, 의료기기, 건강기능식품, 리콜제품 등)과 플랫폼이 별도 지정한 금지품목의 거래를 엄격히 금지합니다.</li>
      <li><b>상품 정보의 정확한 제공</b>: 판매자는 상품의 상태, 하자, 거래 조건 등 중요 정보를 정확히 기재해야 하며, 허위·과장 게시글은 제재 대상입니다.</li>
      <li><b>거래 보호 프로그램</b>: 에스크로(안전결제) 등 거래 보호 시스템을 도입하여, 상품 수령 후 결제되는 방식 등으로 구매자와 판매자 모두를 보호합니다.</li>
      <li><b>거래 이력 및 평가 시스템</b>: 거래 후 상호 평가가 가능하며, 신뢰할 수 있는 판매자 인증 제도를 운영합니다.</li>
      <li><b>모니터링 및 신고</b>: AI·FDS 등 이상 거래 탐지 시스템을 운영하고, 신고된 게시물·이용자에 대한 신속한 조치를 취합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>3. 이용자 보호 및 분쟁 해결</h2>
    <ul class="terms-list">
      <li><b>분쟁 해결 기준</b>: 분쟁 발생 시 공정하고 투명한 분쟁해결 절차 및 기준을 마련·운영합니다. 하자·미배송 등 피해 발생 시 환불·보상 기준을 명확히 안내합니다.</li>
      <li><b>피해 구제 지원</b>: 사기·피해 신고 접수, 피해자 지원 및 수사기관 연계 등 신속한 피해 구제 시스템을 운영합니다.</li>
      <li><b>위해제품 유통 차단</b>: 리콜·불법 제품 유통을 신속히 차단하고, 관련 정보를 이용자에게 공지합니다.</li>
      <li><b>개인정보 보호</b>: 거래 과정에서 취득한 개인정보는 거래 목적 외로 사용하지 않으며, 외부 유출을 엄격히 금지합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>4. 금지 행위 및 제재</h2>
    <ul class="terms-list">
      <li>불법·유해·위조 상품 거래, 사기, 허위·과장 광고, 반복 도배, 타인 명의 도용, 욕설·비방 등 커뮤니티 질서를 해치는 행위는 엄격히 금지되며, 위반 시 서비스 이용 제한, 게시글 삭제, 회원 자격 정지·탈퇴, 법적 조치 등이 즉시 이루어집니다.</li>
      <li>사기 등 중대한 위반자는 블랙리스트 등록과 함께 일정 기간 또는 영구적으로 거래 제한 및 관련 사실을 공개할 수 있습니다.</li>
      <li>반복적·악의적 피해 유발자는 수사기관 및 관계기관에 즉시 신고됩니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>5. 교육·안내 및 협력</h2>
    <ul class="terms-list">
      <li>이용자 대상 사기 예방 교육, 안전거래 가이드, 거래 전 체크리스트 등 정보를 적극 제공하고, 의심 거래 신고 방법을 안내합니다.</li>
      <li>정부·공공기관과 협력하여 분쟁 예방, 위해제품 차단, 시장 건전성 제고에 앞장섭니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>6. 기타</h2>
    <ul class="terms-list">
      <li>본 운영정책은 법령 및 서비스 운영 상황에 따라 변경될 수 있으며, 변경 시 사전 공지합니다.</li>
      <li>운영정책에 명시되지 않은 사항은 관련 법령 및 이용약관, 사회 일반의 원칙에 따릅니다.</li>
    </ul>
    <div class="terms-note">
      본 운영정책은 2025년 4월 21일부터 시행합니다.<br>
      신뢰와 안전이 보장되는 중고거래 문화를 만들기 위해 항상 최선을 다하겠습니다.
    </div>
  </div>
</div>
<%@include file="/page/user/main/footer.jsp"%>
</body>
</html>
