<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ksj.product.ProductDTO"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO" scope="session"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");

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
<title>검색 페이지</title>
<link rel="stylesheet" type="text/css" href="mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<script>
function changeSearch(){
	var cs = document.getElementById("searchArray");
	var value = (cs.options[cs.selectedIndex].value);
	return value;
};
</script>
</head>
<%@include file="/page/user/main/header.jsp" %> 
<body>
<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">
    <form action="search.jsp" method="post">
    	<select id ="searchArray" onchange="changeSearch()">
        	<option value=0>최신 순</option>
        	<option value=1>과거 순</option>
        	<option value=2>정확도순</option>
	    </select>
    </form>  	
      	<%if(indexid!=null){ %>
        	<h2>검색어 : <%=keyword %></h2>
	    	<div class="photo-grid">
	        <%
			ArrayList<ProductDTO> arr = pdao.SearchProductList(keyword);
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
			        		<img src="/semi2/page/uhttp://localhost:9090/semi2/page/user/bbs/communityBbs.jspser/product/img/<%=arr.get(i).getThumb_image()%>"class="thumbnail">
						<%}else{ %>
							<div class="thumbnail"></div>
						<%} %>
				        <h3><%=arr.get(i).getTitle() %></h3>
				        <p><%=arr.get(i).getPrice() %></p>
				        <p><%=arr.get(i).getCreate_date() %></p></a>
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