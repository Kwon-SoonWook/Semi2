<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="headudao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="headudto" class="com.ksj.user.UserDTO"></jsp:useBean>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script>
<style>
.top-bar {
	height: 30px;
    display: flex;
    justify-content: center;
    align-items: center; 
    background: white;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
/*top-bar 자식 가운데 정렬*/
.top-bar > * {
	 display: flex;
	 align-items: center;
}
input, a, button {
	vartival-align: middle;
	color: black;
	text-decoration: none;
}

.search-bar {
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 40px;
    margin: 0 auto;
}

.search-bar input {
    border: none;
    outline: none;
}
.mypage a {
	display: flex;
	align-items: center;
	padding: 8px 6px;
}
.btn-login{
	border: solid 1px black;
	padding: 8px 6px;
	font-size: 14px;
	font-weight: bold;
	color: black;
	border-radius: 40px;
	text-decoration: none;
}
.btn-logout{
	border: solid 1px black;
	padding: 8px 6px;
	font-size: 14px;
	font-weight: bold;
	color: black;
	border-radius: 40px;
	text-decoration: none;
}
a:hover {
  	color: gray;
}
.mypage a:hover{
	color: gray;
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

<header class="top-bar">
	<div>
		<a href="../main/index.jsp"><image src="../main/logo.png" width="30" height="30"></a>
	</div>
    <div class="search-bar">
        <input type="text" size="70" placeholder="Search">
        <a href="#"><i class="fas fa-search"></i></a>
    </div> 
     <%if(headname == null){ %>
     	<div class="login-button">
   	 		<a href="../login/login.jsp" class="btn-login"><i class="fa-regular fa-circle-user" style="font-size: 20px;"></i>로그인</a>
    	</div>
    <%}else{ %>
    	<div class="mypage">
	    	<a href="../mypage/mypage.jsp"><%=headnickname %>님 &nbsp;
	    	<%if(!arr2.isEmpty() && arr2.get(0).getProfile_uri() != null){ %>
				<img src="/<%=arr2.get(0).getProfile_uri() %>" alt="프로필 이미지" width="40" height="40" style=border-radius:50% />
		    <%}else{ %>
		         <i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 25px;"></i>
		    <%} %>
	    	</a>
	    	&emsp;
    	</div>
    	<div class="logout-button">
    		<a href="../login/logout.jsp" class="btn-logout"><i class="fa-solid fa-right-from-bracket" style="font-size: 20px;"></i>로그아웃</a>
    	</div>
    <%} %>
</header>