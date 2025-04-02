<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function openLogin(){
	window.open("/myweb/member/login.jsp", "login", "width=450, height=350");
}
</script>
<%
String sname = (String)session.getAttribute("sname");
String sid = (String)session.getAttribute("sid");
%>
<header>
	<% 
	if(sname == null){
		%>
		<div><a href="javascript:openLogin()">로그인</a> | 회원가입</div>
		<%
	}else{
		%>
		<div><%=sname%>님 로그인 중...  | <a href='/myweb/member/logout.jsp'>로그아웃</a></div>
		<%		
	}
	%>
	<nav>
		<ul>
			<li><a href='/semi2/page/admin/visitor/visitorInfo.jsp'>방문자 현황</a></li>
			<li><a href='/semi2/page/admin/enquiry/enquiryList.jsp'>문의함</a></li>
			<li><a href='/semi2/page/admin/user/userInfoList.jsp'>사용자 관리</a></li>
			<li><a href='/semi2/page/admin/post/bbs/postList.jsp'>게시물 관리</a></li>
			<li><a href='/semi2/page/admin/post/product/productList.jsp'>판매물품 게시글 관리</a></li>
			<li><a href='#'>나가기</a></li>
		</ul>
	</nav>
	<hr>
</header>