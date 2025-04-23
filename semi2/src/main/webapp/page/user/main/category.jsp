<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link rel="stylesheet" type="text/css" href="mainLayout.css">
<style>
@font-face {
  font-family: "Pretendard-Regular";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff")
    format("woff");
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-Medium";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Medium.woff")
    format("woff");
  font-weight: 500;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-SemiBold";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff")
    format("woff");
  font-weight: 600;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-Bold";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Bold.woff")
    format("woff");
  font-weight: 700;
  font-style: normal;
}
/**category페이지*/
:root{
	--side-bar-width: 200px;
	--side-bar-height: 90vh;
}
.side-bar {
	font-family: "Pretendard-SemiBold", Helvetica;
	position: fixed;
	background: white;
    width: var(--side-bar-width);
    min-height: var(--side-bar-height);
    margin-top: calc((100vh - var(--side-bar-height)) /10);
    border-radius: 20px;
    transform: translate(calc(var(--side-bar-width)*-0.8),0);
    transition: .3s;
    padding: 20px 0; /* 내부 여백 살짝 줌 */
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.side-bar:hover{
	transform: translate(-20px, 0);
}
.side-bar nav {
    width: 100%;
}
.side-bar span {
	opacity: 0;
	transition: .3s .1s;
	margin-left: 10px;
}
.side-bar:hover span{
	opacity: 1;
}
.custom-divider {
    height: 1px;
    background: linear-gradient(to right, transparent, #ddd, transparent);
    margin: 10px 10%;
}
.side-bar .menu-item a {
    display: flex;
    align-items: center;
    padding: 15px 20px;
    color: black;
    font-size: 1.0rem;
    text-decoration: none;
    margin-left: 20px;
}

.side-bar .menu-item a:hover {
    color: gray;
    background-color: #f1f1f1;
}

.login-p{
	font-family: "Pretendard-Regular";
	margin-left: 40px;
	margin-right: 40px;
	text-align: justify;
	font-size: 14px;
}
.category-button{
	display: flex;
    flex-direction: column; /* 세로 정렬 */
    align-items: center;     /* 가운데 정렬 */
    gap: 10px;
    margin-top: 10px;
    margin-bottom: 20px;
}
.btn-login2,
.btn-signup2{
    font-family: "Pretendard-SemiBold", Helvetica;
    font-size: 14px; /* 폰트 크기 조정 */
    padding: 10px 20px;
    border: 2px solid #ccc;
    border-color: #111111;
    border-radius: 30px;
    background: #ffffff;
    transition: all 0.3s ease;
    width: 100px;
    text-align: center;
}

.btn-login2:hover,
.btn-signup2:hover {
    color: #bbb;
    border-color: #bbb;
}
</style>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script>
<%
String categoryid = (String)session.getAttribute("sid");
%>
</head>
<aside class="side-bar">
     <nav>
        <%if(categoryid == null){ %>
        <p class="login-p">노후재활센터를 이용하기 위해서는 회원가입 및 로그인이 필요합니다.</p>
        <div class="category-button">
        	<a href="/semi2/page/user/login/login.jsp" class="btn-login2">로그인
    		</a>
   	 		<a href="/semi2/page/user/login/signUp.jsp" class="btn-signup2">회원가입
   	 		</a>   	 		
    	</div>
        <%}else{ %>
        <div class="menu-item"><a href="/semi2/page/user/main/index.jsp"><i class="fas fa-home"></i><span> 홈</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/product/writeSaleProduct.jsp"><i class="fa-solid fa-pen-to-square"></i><span> 판매등록</span></a></div>
        <div class="custom-divider"></div>
        <div class="menu-item"><a href="/semi2/page/user/mypage/mypage.jsp"><i class="fa-regular fa-circle-user"></i><span> 마이페이지</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/mypage/mypage.jsp?page=saleList.jsp"><i class="fas fa-list"></i><span> 판매물품</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/mypage/mypage.jsp?page=myReviewList.jsp"><i class="fas fa-comments"></i><span> 거래후기</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/mypage/mypage.jsp?page=interestList.jsp"><i class="fas fa-heart"></i><span> 찜 목록</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/mypage/mypage.jsp?page=recentList.jsp"><i class="fas fa-history"></i><span> 최신 본 상품</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/mypage/mypage.jsp?page=userAskList.jsp"><i class="fa-regular fa-circle-question"></i><span> 나의 문의</span></a></div>
        <%} %>
        <%if("admin".equals(categoryid)){ %>
        <div class="custom-divider"></div>
        <div class="menu-item"><a href="/semi2/page/admin/main/adminIndex.jsp"><i class="fa-solid fa-user-tie"></i><span> 관리자페이지</span></a></div>
   		<%} %>
    </nav>
</aside>
</body>
</html>