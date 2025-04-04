<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
	String productIds = request.getParameter("productId");
	int productId;
	if(productIds==null||productIds.equals("")){
		productId=0;
	}else{
		productId= Integer.parseInt(productIds);
	}
	String msg = pdao.deleteProduct(productId)>0?"삭제완료":"삭제실패";
%>
<script>
location.href='saleProductView.jsp';
</script>