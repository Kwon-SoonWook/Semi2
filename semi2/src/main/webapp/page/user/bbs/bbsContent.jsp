<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js"
	crossorigin="anonymous"></script>
<!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<%@include file="/page/user/main/header.jsp"%>
<title>Insert title here</title>
<%
int id = Integer.parseInt(request.getParameter("id"));

ArrayList<BbsDTO> arr = kdao.showContent(id);

%>
<body>
	<div class="container">
		<%@include file="/page/user/main/category.jsp"%>
		<main class="main-content">
	<section>
	<article>
	<h1><%=arr.get(0).getTitle() %></h1>
	<div><%=arr.get(0).getContent()%></div>
	<div>작성자 : <%=arr.get(0).getBbs_id()%></div>
	<div>작성일자 : <%=arr.get(0).getCreate_date()%></div>
	<div><img src = "img/<%=arr.get(0).getBbs_image()%>" width="300"></div>
	</article>
	</section>




		</main>
	</div>
</body>
<footer>
	<%@include file="/page/user/main/footer.jsp"%>
</footer>
</html>