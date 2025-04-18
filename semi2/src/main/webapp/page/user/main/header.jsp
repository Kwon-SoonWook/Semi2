<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="headudao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="headudto" class="com.ksj.user.UserDTO"></jsp:useBean>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
/* 공통 폰트 및 색상 */
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
body, input, a, button {
    color: #1c1c1e;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 헤더 컨테이너 */
.top-bar {
    height: 80px; /* 헤더 높이 줄임 */
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #ffffff;
    padding: 0 20px; /* 좌우 여백 줄임 */
    position: sticky;
    top: 0;
    z-index: 999;
}

/* 로고 및 텍스트 */
.top-bar .logo {
    display: flex;
    flex-direction: column; /* 아이콘과 텍스트를 세로로 정렬 */
    align-items: center;
    gap: 4px; /* 텍스트와 로고 간격 조정 */
}

.top-bar .logo img {
    width: 40px; /* 로고 크기 조정 */
    height: 40px;
}

.top-bar .logo span {
    font-family: "Pretendard-SemiBold", Helvetica;
    font-size: 18px;
    color: #000000;
    letter-spacing: -0.4px;
    vertical-align: 60%;
}
.top-category {
	margin-left: 150px;
	display: inline-flex;
	gap: 34px;
	font-family: "Pretendard-SemiBold", Helvetica;
	font-size: 16px;
	letter-spacing: -0.40px;
}
.top-category a{
	color: #505050;
}
.top-category a:hover {
	color: #111111;
}
.top-right {
	justify-content: flex-end;
}
.mypage	{
	font-family: "Pretendard-Medium", Helvetica;
	margin-right: 20px;
    display: flex;
    align-items: center;
    gap: 8px;
}
.mypage a {
    display: flex;
    align-items: center;
    gap: 8px; /* 간격 줄임 */
    font-size: 14px; /* 폰트 크기 줄임 */
    font-weight: 500;
    text-decoration: none;
    color: #333;
}
.mypage a img {
    border-radius: 50%;
    width: 44px;
    height: 44px;
    object-fit: cover;
}

.mypage a:hover {
    color: #1c1c1e;
}

.mypage, .signup-button .logout-button {
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 12px;
}
/* 로그인/로그아웃 버튼 */
.btn-login,
.btn-logout {
    border: 1px solid #ccc;
    padding: 10px 20px; /* 패딩 줄임 */
    font-family: "Pretendard-SemiBold", Helvetica;
    font-size: 16px; /* 폰트 크기 조정 */
    font-weight: 600;
    color: #ffffff;
    border-radius: 8px;
    background: #6d8132;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
}
.btn-signup {
    padding: 10px 20px; 
    font-family: "Pretendard-SemiBold", Helvetica;
    font-size: 16px;
    color: #505050;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
    margin-right: 10px;
}
.btn-signup:hover {
	color: #111111;
}
.btn-login:hover,
.btn-logout:hover {
    background: #f5f5f5;
    color: #000;
    border-color: #bbb;
}
a {
    text-decoration: none;
}

a:hover {
    text-decoration: none; /* 호버 시에도 밑줄 없앰 */
}
</style>

<% 
String headname = (String)session.getAttribute("sname");
String headid = (String)session.getAttribute("sid");
ArrayList<UserDTO> arr2 = headudao.myinfo(headid);
for(int i=0; i<arr2.size(); i++){
	session.setAttribute("pwd", arr2.get(i).getPwd());
	session.setAttribute("email", arr2.get(i).getEmail());
	session.setAttribute("nickname", arr2.get(i).getNickname());
	session.setAttribute("location", arr2.get(i).getLocation());
}

String headpwd = (String)session.getAttribute("pwd");
String heademail = (String)session.getAttribute("email");
String headnickname = (String)session.getAttribute("nickname");
String headlocation = (String)session.getAttribute("location");

%>
<script>
function searchClick(){
	document.getElementById('searchform').submit();
	return false;
}
</script>
<header class="top-bar">
	<div class="logo">
		<a href="/semi2/page/user/main/index.jsp">
		<image src="/semi2/page/user/main/logo2.png" alt="로고">
		<span>노후재활센터</span>
		</a>
	</div>
    <div class="top-category">
    	<a href="/semi2/page/user/main/index.jsp">홈</a>
    	<a href="/semi2/page/user/bbs/noticeBbs.jsp">공지사항</a>
    	<a href="/semi2/page/user/bbs/communityBbs.jsp">자유게시판</a>
    	<a href="/semi2/page/user/bbs/buyBbs.jsp">구매게시판</a>
    	<%if(headid != null){ %>
	    	<%if(headid.equals("admin")){ %>
	    		<a href="/semi2/page/admin/main/adminIndex.jsp">관리자페이지</a>
	    	<%}%>
    	<%} %>
    </div>
    <div class="top-right">
     <%if(headname == null){ %>
     	<div style="display: flex; align-items: center; margin-left: auto;">
	     	<div class="signup-button">
	   	 		<a href="/semi2/page/user/login/signUp.jsp" class="btn-signup">회원가입
	   	 		</a>
	    	</div>
	     	<div class="login-button">
	   	 		<a href="/semi2/page/user/login/login.jsp" class="btn-login">로그인
	   	 		</a>
	    	</div>
    	</div>
    <%}else{ %>
	    <div style="display: flex; align-items: center; margin-left: auto;">
	    	<div class="mypage">
		    	<a href="/semi2/page/user/mypage/mypage.jsp">
			    	<p style="font-size: 16px;"><%=headnickname %>님</p>
			    	<%if(!arr2.isEmpty() && arr2.get(0).getProfile_uri() != null){ %>
						<img src="/<%=arr2.get(0).getProfile_uri() %>" alt="프로필 이미지">
				    <%}else{ %>
				         <i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 44px;"></i>
				    <%} %>
		    	</a>
	    	</div>
	    	<div class="logout-button">
	    		<a href="/semi2/page/user/login/logout.jsp" class="btn-logout">
	    		로그아웃</a>
	    	</div>
	    </div>
    <%} %>
    </div>
</header>