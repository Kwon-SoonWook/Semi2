<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mainLayout.css">
<style>
/**category페이지*/
:root{
	--side-bar-width: 200px;
	--side-bar-height: 90vh;
}
.side-bar {
	position: fixed;
	background: white;
    width: var(--side-bar-width);
    min-height: var(--side-bar-height);
    margin-top: calc((100vh - var(--side-bar-height)) /10);
    border-radius: 20px;
    transform: translate(calc(var(--side-bar-width)*-0.8),0);
    transition: .3s;
}

section {
 	position: relative;
 	width: 20px;
 	height: 20px;
 	margin-top: 25px;
 	margin-left: 85px;
  
}
section > div {
 	position: absolute;
 	width: 100%;
  	height: 20%;
  	background-color: black;
}

section > div:nth-of-type(2) {
  	top: 40%;
}

section > div:nth-of-type(3) {
  	top: 80%;
}

section:hover > div:nth-of-type(2){
	transform-origin: left bottom;
	transform: rotate(45deg);
}
section:hover > div:nth-of-type(3) {
  	transform-origin: right bottom;
  	transform: rotate(-45deg);
}

section:hover > div:nth-of-type(2) {
  transform-origin: left bottom;
  transform: rotate(45deg);
  width: 70.5%
}

section:hover > div:nth-of-type(3) {
  transform-origin: right bottom; 
  transform: rotate(-45deg);
  top: 40%;
  width: 70.5%;
}
section > div:nth-of-type(3) {
  top: 80%;
  right: 0;
}

section > div:nth-of-type(1) {
  width: auto;
  left: 0;
  right: 0;
}
section:hover > div:nth-of-type(1) {
  left: 40%;
  right: 40%;
}

section > div:nth-of-type(1) {
  width: auto;
  left: 0;
  right: 0;
  transition: all 1s, left .5s .5s, right .5s .5s, height .5s 0s;
}

section:hover > div:nth-of-type(1) {
  left: 40%;
  right: 40%;
  height: 100%; 
  transition: all 1s, left .5s 0s, right .5s 0s, height .5s .5s;
}
.side-bar:hover{
	transform: translate(-20px, 0);
}
.side-bar a {
  	color: black;
 	font-size: 1.0rem;
 	font-weight: bold;
 	white-space: nowrap;
 	text-decoration: none;
  	padding-top: 20px;
  	padding-bottom: 20px;
  	padding-left: 50px;
}

.side-bar a:hover {
  	color: gray;
}
.side-bar span {
	opacity: 0;
	transition: .5s .1s;
}
.side-bar:hover span{
	opacity: 1;
}

.menu-item {
    padding: 0px;
    margin-top: 0px;
    font-size: 18px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 10px;
    transition: background 0.3s;
}

.menu-item:hover {
    background: #f1f1f1;
}

/**
.toolButton span{
	position:fixed;
	right: 0px;
	bottom: 0px;
	width: 80px;
	height: 80px;
	margin-bottom: 50px;
	margin-right: 50px;
	background: white;
	box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	border-radius:50%;
	text-align: center;
	line-height: 80px;
	font-size: 30px;
}
.toolButton span a{
	color: black;
}

.toolButton ul > li{
	position:fixed;
	right: 0px;
	bottom: 0px;
	width: 200px;
	height: 300px;
	margin-bottom: 100px;
	margin-right: 40px;
	background: darkgray;
}
.toolButton ul > li:hover{
	opacity: 1;
}
*/
</style>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script>
</head>
<aside class="side-bar">
	<section class="side-bar__icon-box">
		<section class="side-bar__icon-1">
			<div></div>
			<div></div>
			<div></div>
		</section>
	</section>
     <nav>
        <div class="menu-item"><a href="../main/index.jsp"><i class="fas fa-home"></i><span> 홈</span></a></div>
        <div class="menu-item"><a href="../bbs/noticeBbs.jsp"><i class="fa-solid fa-bullhorn"></i><span> 공지사항</span></a></div>
        <div class="menu-item"><a href="../bbs/enquiryBbs.jsp"><i class="fa-solid fa-circle-question"></i><span> 문의사항</span></a></div>
        <div class="menu-item"><a href="../bbs/communityBbs.jsp"><i class="fa-solid fa-comments"></i><span> 커뮤니티</span></a></div>
        <div class="menu-item"><a href="../bbs/buyBbs.jsp"><i class="fa-solid fa-cart-shopping"></i><span> 삽니다</span></a></div>
        <div class="menu-item"><a href="/semi2/page/admin/main/adminIndex.jsp"><i class="fa-solid fa-cart-shopping"></i><span> 관리자페이지</span></a></div>
    </nav>
</aside>
<!-- 
<aside class="toolButton">
	<li> 
	  <ul>
	    <li><a href="#">판매하기</a></li>
	    <li><a href="#">댓글</a></li>
	    <li><a href="#">찜한 상품</a></li>
	    <li><a href="#">최근 본 상품</a></li>
	  </ul>
	  <span><a href="#"><i class="fa-solid fa-pen-to-square"></i></a></span>
	</li>
</aside>
 -->
</body>
</html>