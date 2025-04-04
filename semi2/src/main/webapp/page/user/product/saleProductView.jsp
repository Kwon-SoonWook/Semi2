<%@page import="com.ksj.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sid = (String)session.getAttribute("sid");
/*String productsIds = request.getParameter("productsIds");
int productsId = Integer.parseInt(productsIds);
if(productsIds==null||productsIds.equals("")){
	productsId = 0;
}
*/
int prodcutsId = 61;
%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/page/user/main/header.jsp" %>
<%
	ProductDTO pdto = pdao.ProductList(productsId);
%>
<section>
	<article>
		<form name="saleProductiVeiw" action="">
		<div>
			<div>
			<img alt="" src="">
			</div>
			<div>
			<h2></h2>
			</div>	
		</div>
		<div>
		
		</div>
		<div>
		</div>
		</form>
	</article>
</section>
<%@include file="/page/user/main/footer.jsp" %>
</body>
</html> 