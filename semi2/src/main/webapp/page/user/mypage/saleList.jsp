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
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
</head>
<%
String mypageid = (String)session.getAttribute("sid");
 
//총 게시물 수
int productCnt = pdao.getProductCnt(mypageid); // db로부터 조회
session.setAttribute("productCnt", productCnt);

String productsIds = request.getParameter("productsIds");
int productsId;
if(productsIds==null||productsIds.equals("")){
	productsId = 0;
}else{
	productsId = Integer.parseInt(productsIds);
}
%>
<body>
<section>
<article>
	<h2>판매물품 리스트</h2>
	<div style="text-align: right">
	<button onclick="top.location.href='/semi2/page/user/product/writeSaleProduct.jsp'">새글쓰기
	</div>
    <%
	ArrayList<ProductDTO> arr = pdao.saleList(mypageid);
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
</body>
</html>