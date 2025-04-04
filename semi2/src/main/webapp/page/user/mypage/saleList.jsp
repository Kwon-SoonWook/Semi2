<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.product.*" %>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매물품 리스트</title>
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
	<h2>판매물품 리스트</h2>
	<table>
		<thead>
			<tr>
				<th>썸네일</th>
				<th>제목</th>
				<th>가격</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
			ArrayList<ProductDTO> arr = pdao.saleList(mypageid);
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
						<td><%=arr.get(i).getThumb_image() %></td>
						<td><%=arr.get(i).getTitle() %></td>
						<td><%=arr.get(i).getPrice() %></td>
						<td><%=arr.get(i).getCreate_date() %></td>
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
</body>
</html>