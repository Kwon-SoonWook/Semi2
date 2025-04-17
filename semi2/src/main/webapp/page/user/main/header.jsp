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
body, input, a, button {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    color: #1c1c1e;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 헤더 컨테이너 */
.top-bar {
    height: 60px; /* 헤더 높이 줄임 */
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #ffffff;
    padding: 0 20px; /* 좌우 여백 줄임 */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 999;
    border-bottom: 1px solid #e0e0e0; /* 아래쪽 경계선 추가 */
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
    font-size: 18px; /* 텍스트 크기 조정 */
    font-weight: bold;
    color: #333;
    letter-spacing: -0.5px;
    vertical-align: 60%;
}

/* 검색창 */
.search-bar {
    border: 1px solid #ddd;
    padding: 4px 16px; /* 검색창 패딩 줄임 */
    border-radius: 40px;
    display: flex;
    align-items: center;
    gap: 10px; /* 간격 조정 */
    max-width: 400px;
    width: 100%;
    background: #fff;
}

.search-bar input {
    border: none;
    outline: none;
    font-size: 14px; /* 폰트 크기 줄임 */
    flex: 1;
    min-width: 0;
    background: transparent;
    padding: 6px 8px; /* 패딩 조정 */
}

.search-bar a {
    color: #6e6e73;
    font-size: 18px;
}

.search-bar i {
    font-size: 18px;
    cursor: pointer;
}
.mypage	{
	margin-right: 20px;
    display: flex;
    align-items: center;
    gap: 8px;
}
/* 마이페이지 */
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
    width: 36px;
    height: 36px;
    object-fit: cover;
}

.mypage a:hover {
    color: #1c1c1e;
}

.mypage, .logout-button {
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 12px;
}
/* 로그인/로그아웃 버튼 */
.btn-login,
.btn-logout {
    border: 1px solid #ccc;
    padding: 8px 14px; /* 패딩 줄임 */
    font-size: 14px; /* 폰트 크기 조정 */
    font-weight: 500;
    color: #333;
    border-radius: 24px;
    background: #fff;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
}

.btn-login:hover,
.btn-logout:hover {
    background: #f5f5f5;
    color: #000;
    border-color: #bbb;
}
a {
    text-decoration: none; /* 밑줄 없애기 */
    color: #1c1c1e; /* 기본 텍스트 색상 */
}

a:hover {
    color: #555; /* 호버 시 색상 */
    text-decoration: none; /* 호버 시에도 밑줄 없앰 */
}

/* 반응형 */
@media (max-width: 768px) {
    .top-bar {
        flex-direction: column;
        align-items: flex-start;
        padding: 15px 10px; /* 패딩 조정 */
        height: auto;
    }

    .search-bar {
        width: 100%;
        margin: 0;
    }

    .btn-login,
    .btn-logout {
        padding: 6px 12px;
        font-size: 13px;
    }

    .mypage a {
        font-size: 13px;
    }

    .mypage a img {
        width: 32px;
        height: 32px;
    }
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
    <div class="search-bar">
	    <form id=searchform method="post" action="/semi2/page/user/main/search.jsp" style="display: flex; align-items: center; width: 100%;">
	        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
	        <a href="#" onclick="searchClick();"><i class="fas fa-search"></i></a>
	    </form>
    </div>
     <%if(headname == null){ %>
     	<div class="login-button">
   	 		<a href="/semi2/page/user/login/login.jsp" class="btn-login">
   	 			<i class="fa-regular fa-circle-user" style="font-size: 20px;"></i>로그인
   	 		</a>
    	</div>
    <%}else{ %>
	    <div style="display: flex; align-items: center; margin-left: auto;">
	    	<div class="mypage">
		    	<a href="/semi2/page/user/mypage/mypage.jsp">
			    	<p style="font-size: 16px;"><%=headnickname %>님</p>
			    	<%if(!arr2.isEmpty() && arr2.get(0).getProfile_uri() != null){ %>
						<img src="/<%=arr2.get(0).getProfile_uri() %>" alt="프로필 이미지">
				    <%}else{ %>
				         <i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 25px;"></i>
				    <%} %>
		    	</a>
	    	</div>
	    	<div class="logout-button">
	    		<a href="/semi2/page/user/login/logout.jsp" class="btn-logout">
	    		<i class="fa-solid fa-right-from-bracket" style="font-size: 20px;"></i>로그아웃</a>
	    	</div>
	    </div>
    <%} %>
</header>