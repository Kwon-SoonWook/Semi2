<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.product.*" %>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜리스트</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
</head>
<%
String fid = (String)session.getAttribute("sid");
//총 게시물 수
int favoriteCnt = pdao.getfavoriteCnt(fid); // db로부터 조회
session.setAttribute("favoriteCnt", favoriteCnt);

%>
<body>
<section>
<article>
	<h2>찜 리스트</h2>
    <%
	ArrayList<ProductDTO> arr = pdao.favoriteList(fid);
	if(arr==null || arr.size()==0){
	%>
	<h3 align='center'>등록된 글이 없습니다.</h3>
	<%
	}else{%>
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