<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.product.*" %>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품 리스트</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
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
String rid = (String)session.getAttribute("sid");
%>
<body>
<section>
<article>
	<h2>최근 본 리스트</h2>
    <%
		ArrayList<ProductDTO> arr = pdao.recentList(rid);
		if(arr==null || arr.size()==0){
		%>
			<h3 align='center'>등록된 글이 없습니다.</h3>
		<%
		}else{
		%>
		<div class="photo-grid">
		<%for(int i=0; i<arr.size(); i++){%>
           <div class="photo-card">
           <a href="#" onclick="window.parent.location='/semi2/page/user/product/saleProductView.jsp?productsIds=<%=arr.get(i).getProducts_id()%>';">
	            <img src="/semi2/page/user/product/img/<%=arr.get(i).getThumb_image()%>"class="thumbnail">
		        <h3><%=arr.get(i).getTitle() %></h3>
		        <p><%=arr.get(i).getPrice() %></p>
		        <p><%=arr.get(i).getCreate_date() %></p></a>
          </a> 
        </div>
        <% 
		}
	}%>  
    </div>
</article>
</section>
</body>
</html>