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
	font-family: "Pretendard-Regular", Helvetica;
	position: fixed;
	background: white;
    width: var(--side-bar-width);
    min-height: var(--side-bar-height);
    margin-top: calc((100vh - var(--side-bar-height)) /10);
    border-radius: 20px;
    transform: translate(calc(var(--side-bar-width)*-0.8),0);
    transition: .3s;
}
.side-bar:hover{
	transform: translate(-20px, 0);
}
.side-bar a {
  	color: black;
 	font-size: 1.0rem;
 	font-weight: bold ;
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
</style>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script>
<%

String categoryid = (String)session.getAttribute("sid");

%>
</head>
<aside class="side-bar">
     <nav>
        <div class="menu-item"><a href="/semi2/page/user/main/index.jsp"><i class="fas fa-home"></i><span> 홈</span></a></div>
        
        <%if(categoryid != null){ %>
        <div class="menu-item"><a href="/semi2/page/user/product/writeSaleProduct.jsp"><i class="fa-solid fa-pen-to-square"></i><span> 글쓰기</span></a></div>
        <%} %>
        <div class="menu-item"><a href="/semi2/page/user/bbs/noticeBbs.jsp"><i class="fa-solid fa-bullhorn"></i><span> 공지사항</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/bbs/communityBbs.jsp"><i class="fa-solid fa-comments"></i><span> 자유게시판</span></a></div>
        <div class="menu-item"><a href="/semi2/page/user/bbs/buyBbs.jsp"><i class="fa-solid fa-cart-shopping"></i><span> 구매게시판</span></a></div>
        <%if("admin".equals(categoryid)){ %>
        <div class="menu-item"><a href="/semi2/page/admin/main/adminIndex.jsp"><i class="fa-solid fa-user-tie"></i><span> 관리자페이지</span></a></div>
   		<%} %>
    </nav>
</aside>
</body>
</html>