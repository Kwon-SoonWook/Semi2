<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>서비스 이용약관 | 노후재활센터 중고거래</title>
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
  <div class="terms-title">서비스 이용약관</div>
  <div class="terms-subtitle">노후재활센터 중고거래 플랫폼 서비스 이용약관</div>

  <div class="terms-section">
    <h2>제1장 총칙</h2>
    <ul class="terms-list">
      <li><b>제1조 (목적)</b><br>
        본 약관은 노후재활센터(이하 "회사"라 합니다)가 운영하는 중고거래 플랫폼(이하 "사이트")에서 제공하는 서비스(이하 "서비스")의 이용과 관련하여 회사와 회원 간의 권리, 의무 및 책임사항, 서비스 이용 절차 등 기본적인 사항을 규정함을 목적으로 합니다.
      </li>
      <li><b>제2조 (약관의 효력 및 변경)</b><br>
        1. 본 약관은 사이트에 게시하거나 기타의 방법으로 공지함으로써 효력이 발생합니다.<br>
        2. 회사는 필요 시 약관을 변경할 수 있으며, 변경 시 적용일자 및 사유를 명시하여 사전 공지합니다.<br>
        3. 회원이 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 탈퇴할 수 있습니다.
      </li>
      <li><b>제3조 (약관 외 준칙)</b><br>
        본 약관에 명시되지 않은 사항은 관련 법령, 개인정보처리방침, 운영정책 등 회사가 정한 기준에 따릅니다.
      </li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제2장 회원가입 및 서비스 이용</h2>
    <ul class="terms-list">
      <li><b>제4조 (회원가입)</b><br>
        1. 회원가입은 회사가 정한 절차에 따라 신청하고, 회사가 이를 승낙함으로써 성립합니다.<br>
        2. 회사는 실명이 아니거나 타인 명의, 허위 정보로 가입한 경우 승낙을 거부 또는 취소할 수 있습니다.
      </li>
      <li><b>제5조 (서비스의 제공 및 변경)</b><br>
        1. 회사는 회원에게 중고거래, 커뮤니티, 기타 관련 서비스를 제공합니다.<br>
        2. 회사는 서비스의 내용, 운영상 또는 기술상 필요에 따라 서비스의 전부 또는 일부를 변경할 수 있습니다.
      </li>
      <li><b>제6조 (서비스의 중단)</b><br>
        1. 회사는 시스템 점검, 교체, 고장, 통신 두절 등 사유 발생 시 서비스 제공을 일시적으로 중단할 수 있습니다.<br>
        2. 천재지변 등 불가항력적 사유 발생 시 서비스 제공이 제한될 수 있습니다.
      </li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제3장 회원의 의무 및 금지행위</h2>
    <ul class="terms-list">
      <li><b>제7조 (회원의 의무)</b><br>
        1. 회원은 본 약관, 회사의 공지사항, 서비스 이용안내 등을 준수해야 하며, 다음 행위를 하여서는 안 됩니다.<br>
        - 허위 또는 타인의 정보 등록<br>
        - 불법, 부적합 물품의 등록 및 거래<br>
        - 타인의 권리(지적재산권 등) 침해<br>
        - 회사 서비스 운영 방해<br>
        - 기타 법령 및 약관 위반 행위
      </li>
      <li><b>제8조 (거래의 성립 및 책임)</b><br>
        1. 거래는 판매자의 상품 등록과 구매자의 구매 의사 표시로 성립됩니다.<br>
        2. 거래와 관련된 책임은 거래 당사자인 판매자와 구매자에게 있습니다.<br>
        3. 회사는 거래의 중개자로서, 분쟁 발생 시 중재 또는 최소한의 책임만을 집니다.
      </li>
      <li><b>제9조 (거래불가 상품 및 행위)</b><br>
        1. 법령상 금지된 물품(위조품, 의료기기 등)과 회사가 별도 지정한 금지품목의 거래는 엄격히 금지됩니다.<br>
        2. 위반 시 등록 취소, 회원 자격 제한 등 조치가 취해질 수 있습니다.
      </li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제4장 환불·반품 및 분쟁처리</h2>
    <ul class="terms-list">
      <li><b>제10조 (환불 및 반품)</b><br>
        1. 상품에 하자가 있거나, 판매자가 고지하지 않은 중대한 결함이 있는 경우 구매자는 환불 또는 반품을 요청할 수 있습니다.<br>
        2. “환불/반품 불가” 표기가 있더라도, 법령 및 정당한 사유가 있으면 환불·반품이 가능합니다.
      </li>
      <li><b>제11조 (분쟁 해결 및 책임 제한)</b><br>
        1. 회사는 이용자 간 거래로 발생한 분쟁에 대해 직접적인 책임을 지지 않으며, 분쟁은 당사자 간에 해결함을 원칙으로 합니다.<br>
        2. 단, 회사는 신속한 분쟁 처리를 위해 피해보상처리기구를 운영할 수 있습니다.
      </li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제5장 개인정보 보호</h2>
    <ul class="terms-list">
      <li><b>제12조 (개인정보 보호)</b><br>
        1. 회사는 회원의 개인정보를 관련 법령 및 개인정보처리방침에 따라 보호합니다.<br>
        2. 거래 과정에서 취득한 개인정보는 거래 목적 외로 사용할 수 없습니다.
      </li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제6장 기타</h2>
    <ul class="terms-list">
      <li>본 약관은 2025년 4월 21일부터 시행합니다.</li>
      <li>약관의 개정 및 시행일자는 별도 고지합니다.</li>
    </ul>
    <div class="terms-note">
      본 서비스 이용약관은 노후재활센터 중고거래 플랫폼의 신뢰와 투명한 거래를 위해 마련되었습니다.
    </div>
  </div>
</div>
<%@include file="/page/user/main/footer.jsp"%>
</body>
</html>
