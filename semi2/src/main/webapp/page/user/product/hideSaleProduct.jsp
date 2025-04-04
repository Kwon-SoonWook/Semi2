<%@page import="com.ksj.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
	String productIds=request.getParameter("productId");
	int productId;
	if(productIds==null||productIds.equals("")){
		productId=0;
	}else{
		productId = Integer.parseInt(productIds);
	}
	ProductDTO dto = pdao.ProductList(productId);
	if(dto.getBbs_state()==0){
		dto.setBbs_state(1);
	}else if(dto.getBbs_state()==1){
		dto.setBbs_state(0);		
	}
	String msg = pdao.updateBbsProduct(dto)>0?"수정완료":"수정실패";
%>
<script>
window.alert('<%=msg%>');
location.href='saleProductView.jsp?productId=<%=productId%>';
</script>