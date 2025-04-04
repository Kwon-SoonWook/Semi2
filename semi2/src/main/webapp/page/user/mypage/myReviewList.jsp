<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.review.*" %>
<jsp:useBean id="rdao" class="com.ksj.review.ReviewDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트</title>
<style>
body{
	height: auto;
	overflow: hidden;
}
h2{
	text-align: center;
}
table{
	height: auto;
	width: 550px;
	margin: 0px auto;
	border-top:3px double darkgray;
	border-bottom: 3px double darkgray;
}
table thead th{
	background-color : lightgray;
}

</style>
</head>
<%
String mypageid = (String)session.getAttribute("sid");

%>
<body>
<section>
<article>
	<h2>리뷰 리스트</h2>
	<table>
		<thead>
			<tr>
				<th>평가자</th>
				<th>피평가자</th>
				<th>댓글</th>
				<th>별점</th>
			</tr>
		</thead>
		<tbody>
		<%
			ArrayList<ReviewDTO> arr = rdao.reviewList(mypageid);
			if(arr==null || arr.size()==0){
				%>
				<tr>
					<td colspan='4' align='center'>등록된 글이 없습니다.</td>
				</tr>
				<%
			}else{
				for(int i=0; i<arr.size(); i++){
					%>
					<tr>
						<td><%=arr.get(i).getUsere_id() %></td>
						<td><%=arr.get(i).getUser_id() %></td>
						<td><%=arr.get(i).getReview_content() %></td>
						<td><%=arr.get(i).getRate() %></td>
					<tr>
					<%
				}
			}
		%>
		</tbody>
	</table>
</article>
</section>
</body>
</html>