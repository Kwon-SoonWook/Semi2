<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ksj.product.ProductDTO"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO" scope="session"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
String indexid = (String)session.getAttribute("sid");
String productsIds = request.getParameter("productsIds");
int productsId;
if(productsIds==null||productsIds.equals("")){
	productsId = 0;
}else{
	productsId = Integer.parseInt(productsIds);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<link rel="stylesheet" type="text/css" href="mainLayout.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<%@include file="/page/user/main/header.jsp" %> 
<body>
<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">
      	<%if(indexid!=null){ %>
	    	<div class="photo-grid">
	        <%
			ArrayList<ProductDTO> arr = pdao.stateProductList();
			if(arr==null || arr.size()==0){
			%>
				<h3>등록된 글이 없습니다.</h3>
			<%
			}else{
				for(int i=0; i<arr.size(); i++){
				%>
	            <div class="photo-card">
		            <a href="/semi2/page/user/product/saleProductView.jsp?productsIds=<%=arr.get(i).getProducts_id()%>">
			            <%if(arr.get(i).getThumb_image()!=null) {%>
			            <img src="/semi2/page/user/product/img/<%=arr.get(i).getThumb_image()%>"class="thumbnail">
				        <%}else{ %>
				        <div class="thumbnail"></div>
				        <%} %>
				        <p style="font-size: 16px;"><%=arr.get(i).getTitle() %></p>
		       			<p style="font-size: 18px; font-weight: bold;"><%=arr.get(i).getPrice() %>원</p>
		        		<p style="color: #6e6e73;"><%=arr.get(i).getCreate_date() %></p>
		            </a> 
	            </div>
	        	<% 
				}
			}%>  
	        </div>
       	<%}else{ %>
           	<h2>로그인 시 이용 가능합니다.</h2>
           	<h4>소중한 물건을 재활용하고 재탄생 시키는 공간! 노후재활센터에서 따뜻한 거래를 시작하세요.</h4>
        <%} %>
    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>