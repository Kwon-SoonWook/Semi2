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
<style>
table {
	text-align: center;
	width: 1200px;
	border-top: 3px groove black;
	border-bottom: 3px groove black;
	margin: auto;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid gray;
	padding: 10px;
}

h2 {
	
	text-align: center;
}

thead tr {
	background-color: #a0a0a0;
	border-bottom: 3px groove black;
}

caption{
text-align:right;
padding-bottom: 10px;
}
.right-write{
text-align: right; 
padding-top:5px;
}
</style>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js"
	crossorigin="anonymous"></script>
<!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<%
String indexid = (String) session.getAttribute("sid");
%>
</head>
<%@include file="/page/user/main/header.jsp"%>
<title>Insert title here</title>
<body>
	<div class="container">
		<%@include file="/page/user/main/category.jsp"%>
		<main class="main-content">
			<h2>자 유 게 시 판</h2>
			<section style = "width:1200px; margin:auto;">
				<article>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
							ArrayList<BbsDTO> arr = kdao.bbsList();

							for (int i = 0; i < arr.size(); i++) {
							%>
							<tr>
								<td><%=arr.get(i).getBbs_idx()%></td>
								<td><%=arr.get(i).getTitle()%></td>
								<td><%=arr.get(i).getBbs_id()%></td>
								<td><%=arr.get(i).getCreate_date()%></td>
								<td><%=arr.get(i).getView_cnt()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
						
					</table>
						<div class = "right-write">
						<input type="submit" value="글쓰기" onclick="location.href='writeBbsPost.jsp'">
					</div>
					<div style="text-align: center; padding-top:5px;">
						<input type="text" name = "find">
					</div>
				</article>
			</section>
		</main>
	</div>
</body>
<footer>
	<%@include file="/page/user/main/footer.jsp"%>
</footer>
</html>