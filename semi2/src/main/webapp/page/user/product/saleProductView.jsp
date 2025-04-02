<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sid = (String)session.getAttribute("sid");
String productsIds = request.getParameter("productsIds");
int productsId = Integer.parseInt(productsIds);
if(productsIds==null||productsIds.equals("")){
	productsId = 0;
}
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
<section>
	<article>
		<form action="">
		<div>
		
		</div>
		</form>
	</article>
</section>
<%@include file="/page/user/main/footer.jsp" %>
</body>
</html> 