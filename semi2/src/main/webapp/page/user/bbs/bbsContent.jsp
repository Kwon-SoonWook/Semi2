<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>

<style>
.bbs-article h1 {
	font-size: 24px;
	margin-bottom: 10px;
}

.bbs-meta {
	font-size: 14px;
	color: #666;
}

.bbs-body p {
	margin-top: 20px;
}

.bbs-image img {
	display: block;
	margin-top: 20px;
}

article {
	position: relative;
	left: 30px;
}
</style>
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
kdao.viewCnt(id);
%>
<body>
	<div class="container">
		<%@include file="/page/user/main/category.jsp"%>
		<main class="main-content">
			<section>
				<article class="bbs-article">
					<h1><%=arr.get(0).getTitle()%></h1>
					<hr>
					<div class="bbs-meta">
						<span>작성자: <%=arr.get(0).getBbs_id()%></span> | <span>작성일자:
							<%=arr.get(0).getCreate_date()%></span>
					</div>
					<div class="bbs-body">
						<p><%=arr.get(0).getContent()%></p>
						<%
						if (arr.get(0).getBbs_image() != null) {
						%>
						<div class="bbs-image">
							<img src="img/<%=arr.get(0).getBbs_image()%>"
								alt="<%=arr.get(0).getTitle()%>" width="300">
						</div>
						<%
						}
						%>
					</div>
					<form action = "bbsComment_ok.jsp">
					댓글 <input type="text" name="comm">
						<input type = "hidden" name ="idx" value = "<%=arr.get(0).getBbs_idx()%>">
					   <input type="submit" value="등록">
					   
					   댓글 입력
					</form>
				</article>

			</section>


		</main>
	</div>
</body>
<footer>
	<%@include file="/page/user/main/footer.jsp"%>
</footer>
</html>