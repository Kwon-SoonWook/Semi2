<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>이용약관 | 노후재활센터</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<style>
/* 메인 컬러 및 폰트 설정 */
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
  box-shadow: 0 4px 16px rgba(109, 129, 50, 0.07);
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

.terms-section h3 {
  font-size: 1.07rem;
  margin: 18px 0 7px 0;
  color: #444;
  font-weight: 600;
}

.terms-list {
  margin-left: 18px;
  margin-bottom: 7px;
}

.terms-list li {
  margin-bottom: 4px;
}

.terms-highlight {
  color: var(--main-color);
  font-weight: 600;
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

  <div class="terms-title">이용약관</div>
  <div class="terms-subtitle">노후재활센터 중고 물품 거래 플랫폼 서비스 이용약관</div>

  <div class="terms-section">
    <h2>제1장 총칙</h2>
    <h3>제1조 (목적)</h3>
    <p>
      이 약관은 <span class="terms-highlight">노후재활센터</span>(이하 "회사")가 운영하는 중고 물품 거래 플랫폼(이하 "사이트")에서 제공하는 서비스(이하 "서비스")의 이용과 관련하여 회사와 회원 간의 권리, 의무 및 책임사항, 서비스 이용 절차 등 기본적인 사항을 규정함을 목적으로 합니다.
    </p>
    <h3>제2조 (정의)</h3>
    <ul class="terms-list">
      <li>1. “사이트”: 회사가 재화 또는 용역(중고물품 포함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장</li>
      <li>2. “회원”: 사이트에 개인정보를 제공하여 회원 등록을 한 자로서, 회사가 제공하는 서비스를 지속적으로 이용할 수 있는 자</li>
      <li>3. “비회원”: 회원으로 가입하지 않고 회사가 제공하는 서비스를 이용하는 자</li>
      <li>4. “판매자”: 사이트를 통해 중고 물품을 판매하고자 하는 자</li>
      <li>5. “구매자”: 사이트를 통해 중고 물품을 구매하고자 하는 자</li>
      <li>6. “상품”: 사이트에 등록된 중고 물품 및 기타 거래 대상 재화 또는 용역</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제2장 서비스 이용</h2>
    <h3>제3조 (약관의 명시, 효력 및 변경)</h3>
    <ul class="terms-list">
      <li>1. 회사는 본 약관의 내용을 회원이 쉽게 알 수 있도록 사이트 초기화면에 게시합니다.</li>
      <li>2. 회사는 관련 법령을 위배하지 않는 범위에서 본 약관을 변경할 수 있으며, 변경 시 사전 공지합니다.</li>
    </ul>
    <h3>제4조 (서비스의 제공 및 변경)</h3>
    <ul class="terms-list">
      <li>1. 회사는 회원에게 중고 물품 거래를 위한 정보 제공, 거래 중개, 기타 관련 서비스를 제공합니다.</li>
      <li>2. 회사는 서비스의 내용, 운영상 또는 기술상 필요에 따라 서비스의 전부 또는 일부를 변경할 수 있습니다.</li>
    </ul>
    <h3>제5조 (서비스의 중단)</h3>
    <ul class="terms-list">
      <li>1. 회사는 시스템 점검, 교체, 고장, 통신 두절 등 사유 발생 시 서비스 제공을 일시적으로 중단할 수 있습니다.</li>
      <li>2. 천재지변 등 불가항력적 사유 발생 시 서비스 제공이 제한될 수 있습니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제3장 회원 및 거래</h2>
    <h3>제6조 (회원가입)</h3>
    <ul class="terms-list">
      <li>1. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입하고, 약관에 동의함으로써 회원가입을 신청합니다.</li>
      <li>2. 회사는 회원가입 신청에 대해 승낙함을 원칙으로 하며, 다음 각 호에 해당하는 경우 승낙을 거부할 수 있습니다:
        <ul>
          <li>- 허위 정보 기재</li>
          <li>- 타인 명의 가입</li>
          <li>- 기타 회사 기준에 부적합한 경우</li>
        </ul>
      </li>
    </ul>
    <h3>제7조 (회원의 의무 및 금지행위)</h3>
    <ul class="terms-list">
      <li>- 허위 또는 타인의 정보 등록 금지</li>
      <li>- 불법, 부적합 물품의 등록 및 거래 금지</li>
      <li>- 타인의 권리(지적재산권 등) 침해 금지</li>
      <li>- 회사 서비스 운영 방해 금지</li>
      <li>- 기타 법령 및 약관 위반 행위 금지</li>
    </ul>
    <h3>제8조 (거래의 성립 및 책임)</h3>
    <ul class="terms-list">
      <li>1. 거래는 판매자의 상품 등록과 구매자의 구매 의사 표시로 성립됩니다.</li>
      <li>2. 거래와 관련된 책임은 거래 당사자인 판매자와 구매자에게 있습니다.</li>
      <li>3. 회사는 거래의 중개자로서, 분쟁 발생 시 중재 또는 최소한의 책임만을 집니다.</li>
    </ul>
    <h3>제9조 (거래불가 상품 및 행위)</h3>
    <ul class="terms-list">
      <li>1. 불법복제품, 지적재산권 침해상품, 법령상 거래가 금지된 물품 등은 등록 및 거래가 불가합니다.</li>
      <li>2. 위반 시 등록 취소, 회원 자격 제한 등 조치가 취해질 수 있습니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제4장 환불·반품 및 분쟁처리</h2>
    <h3>제10조 (환불 및 반품)</h3>
    <ul class="terms-list">
      <li>1. 상품에 하자가 있거나, 판매자가 고지하지 않은 중대한 결함이 있는 경우 구매자는 환불 또는 반품을 요청할 수 있습니다.</li>
      <li>2. “환불/반품 불가” 표기가 있더라도, 법령 및 정당한 사유가 있으면 환불·반품이 가능합니다.</li>
    </ul>
    <h3>제11조 (분쟁 해결 및 책임 제한)</h3>
    <ul class="terms-list">
      <li>1. 회사는 이용자 간 거래로 발생한 분쟁에 대해 직접적인 책임을 지지 않으며, 분쟁은 당사자 간에 해결함을 원칙으로 합니다.</li>
      <li>2. 단, 회사는 신속한 분쟁 처리를 위해 피해보상처리기구를 운영할 수 있습니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>제5장 개인정보 보호</h2>
    <h3>제12조 (개인정보 보호)</h3>
    <ul class="terms-list">
      <li>1. 회사는 회원의 개인정보를 관련 법령 및 개인정보처리방침에 따라 보호합니다.</li>
      <li>2. 거래 과정에서 취득한 개인정보는 거래 목적 외로 사용할 수 없습니다.</li>
    </ul>
  </div>

  <div class="terms-section">
    <h2>부칙</h2>
    <ul class="terms-list">
      <li>1. 본 약관은 [시행일자]부터 시행합니다.</li>
      <li>2. 약관의 개정 및 시행일자는 별도 고지합니다.</li>
    </ul>
    <div class="terms-note">
      본 이용약관은 노후재활센터 중고거래 플랫폼의 신뢰와 투명한 거래를 위해 마련되었습니다.
    </div>
  </div>
</div>
<%@include file="/page/user/main/footer.jsp"%>
</body>
</html>
