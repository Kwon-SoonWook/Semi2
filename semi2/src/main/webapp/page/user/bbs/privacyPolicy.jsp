<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>개인정보처리방침 | 노후재활센터</title>
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
  <div class="terms-title">개인정보처리방침</div>
  <div class="terms-subtitle">노후재활센터 중고거래 플랫폼 개인정보처리방침</div>

  <div class="terms-section">
    <h2>1. 개인정보의 수집 및 이용 목적</h2>
    <p>
      노후재활센터(이하 "회사")는 회원가입, 본인확인, 상품 거래, 문의 및 상담, 서비스 개선, 법령상 의무 이행 등 서비스 제공을 위해 최소한의 개인정보를 수집·이용합니다.
    </p>
  </div>

  <div class="terms-section">
    <h2>2. 수집하는 개인정보 항목</h2>
    <ul class="terms-list">
      <li>회원가입: 이름, 아이디, 비밀번호, 휴대전화번호, 이메일</li>
      <li>상품 거래 및 문의: 닉네임, 연락처, 주소(배송 시), 결제정보, 거래내역</li>
      <li>서비스 이용과정에서 자동 수집: IP주소, 쿠키, 접속기록, 기기정보</li>
      <li>비회원 거래 시: 이름, 연락처, 배송지 정보</li>
      <li>법령상 의무 이행 또는 분쟁처리: 거래기록, 상담내역 등</li>
    </ul>
    <div class="terms-note">
      서비스별로 추가 정보가 필요한 경우 별도 동의를 받아 수집합니다.
    </div>
  </div>

  <div class="terms-section">
    <h2>3. 개인정보의 보유 및 이용기간</h2>
    <ul class="terms-list">
      <li>회원 탈퇴 시 즉시 파기(단, 관련 법령에 따라 일정 기간 보존 필요 시 해당 기간 동안 보관)</li>
      <li>전자상거래 등에서의 소비자보호에 관한 법률에 따른 보존
        <ul>
          <li>계약 또는 청약철회, 대금결제, 재화 등의 공급기록: 5년</li>
          <li>소비자 불만 또는 분쟁처리에 관한 기록: 3년</li>
          <li>표시·광고에 관한 기록: 6개월</li>
        </ul>
      </li>
      <li>부정이용 방지 및 제재 기록: 최대 5년</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>4. 개인정보의 제3자 제공</h2>
    <p>
      회사는 정보주체의 동의, 법령의 특별한 규정 등 「개인정보보호법」에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>
      예) 결제, 배송, 법적 의무 이행 등
    </p>
  </div>

  <div class="terms-section">
    <h2>5. 개인정보 처리의 위탁</h2>
    <p>
      회사는 서비스 제공을 위해 필요한 경우 일부 업무를 외부 전문업체에 위탁할 수 있으며, 위탁 시 관련 법령에 따라 관리·감독합니다.
    </p>
  </div>

  <div class="terms-section">
    <h2>6. 개인정보의 파기 절차 및 방법</h2>
    <ul class="terms-list">
      <li>수집 및 이용 목적 달성, 보유기간 경과 시 즉시 파기</li>
      <li>전자적 파일: 복구 불가능한 방법으로 영구 삭제</li>
      <li>종이 문서: 분쇄 또는 소각 처리</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>7. 이용자와 법정대리인의 권리 및 행사 방법</h2>
    <ul class="terms-list">
      <li>이용자 및 법정대리인은 언제든지 자신의 개인정보 열람, 정정, 삭제, 처리정지, 동의 철회를 요청할 수 있습니다.</li>
      <li>14세 미만 아동의 개인정보는 법정대리인 동의 하에만 수집·이용합니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>8. 개인정보의 안전성 확보조치</h2>
    <ul class="terms-list">
      <li>관리적 조치: 내부관리계획 수립, 직원 교육 등</li>
      <li>기술적 조치: 개인정보 접근 제한, 암호화, 접속기록 보관 등</li>
      <li>물리적 조치: 전산실, 자료보관실 접근 통제 등</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>9. 개인정보 자동수집 장치의 설치·운영 및 거부</h2>
    <ul class="terms-list">
      <li>서비스 이용 과정에서 쿠키 등 자동수집 장치를 운영할 수 있습니다.</li>
      <li>이용자는 브라우저 설정을 통해 쿠키 저장을 거부할 수 있습니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>10. 개인정보 보호책임자 및 문의처</h2>
    <ul class="terms-list">
      <li>개인정보 보호책임자: 권순욱</li>
      <li>연락처: 010-8593-9331 / tnsdnr9331@naver.com</li>
      <li>기타 개인정보 침해에 대한 신고나 상담이 필요한 경우, 개인정보분쟁조정위원회, 개인정보침해신고센터 등 외부 기관에 문의하실 수 있습니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>11. 고지의 의무</h2>
    <ul class="terms-list">
      <li>본 개인정보처리방침은 시행일로부터 적용됩니다.</li>
      <li>법령, 방침, 서비스 변경 시 사전 공지 후 개정합니다.</li>
    </ul>
  </div>

  <div class="terms-note">
    본 방침은 2025년 4월 21일부터 시행합니다.<br>
    본 방침의 내용은 법령 및 회사 정책에 따라 변경될 수 있습니다.
  </div>
</div>
<%@include file="/page/user/main/footer.jsp"%>
</body>
</html>
