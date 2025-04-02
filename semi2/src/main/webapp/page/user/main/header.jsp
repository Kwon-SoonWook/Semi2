<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script>
<style>
.top-bar {
    display: flex;
    justify-content: center;
    align-items: center; 
    background: white;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.search-bar {
    display: flex;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 40px;
    margin: 0 auto;
}
.search-bar a {
  	color: black;
}
.search-bar a:hover {
  	color: gray;
}
.search-bar input {
    border: none;
    outline: none;
}

.btn-login{
	display: flex;
	align-items: center;
	border: solid 1px black;
	padding: 8px 6px;
	font-size: 14px;
	font-weight: bold;
	color: black;
	border-radius: 40px;
	text-decoration: none;
}

.btn-login:hover {
  	color: gray;
}
.btn-logout{
	display: flex;
	align-items: center;
	border: solid 1px black;
	padding: 8px 6px;
	font-size: 14px;
	font-weight: bold;
	color: black;
	border-radius: 40px;
	text-decoration: none;
}
.btn-logout:hover{
	color: gray;
}
</style>  

<%
String sname = (String)session.getAttribute("sname");
%>

<header class="top-bar">
	<div>
		<a href="../main/index.jsp"><image src="logo.png" width="30" height="30"></a>
	</div>
    <div class="search-bar">
        <input type="text" size="70" placeholder="Search">
        <a href="#"><i class="fas fa-search"></i></a>
    </div> 
     <%if(sname == null){ %>
     	<div class="login-button">
   	 		<a href="../login/login.jsp" class="btn-login"><i class="fa-regular fa-circle-user" style="font-size: 20px;"></i>로그인</a>
    	</div>
    <%}else{ %>
    	<%=sname %>님 &nbsp;<a href="../mypage/mypage.jsp"><i class="fa-solid fa-circle-user" style="font-size: 25px; color:black;"></i></a>
    	&emsp;
    	<div class="logout-button">
    		<a href="../login/logout.jsp" class="btn-logout"><i class="fa-solid fa-right-from-bracket" style="font-size: 20px;"></i>로그아웃</a>
    	</div>
    <%} %>
</header>