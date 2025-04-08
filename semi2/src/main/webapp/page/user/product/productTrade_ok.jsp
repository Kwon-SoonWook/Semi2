<%@page import="com.ksj.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
	String productIds=request.getParameter("productId");
	String trade_s = request.getParameter("trade");
	int productId;
	int trade;
	if(productIds==null||productIds.equals("")){
		productId=0;
	}else{
		productId = Integer.parseInt(productIds);
	}
	if(trade_s==null||trade_s.equals("")){
		trade=0;
	}else{
		trade = Integer.parseInt(trade_s);
	}	
	ProductDTO dto = pdao.ProductList(productId);
	dto.setTrade_state(trade);
	String msg = pdao.updateProductTrade(dto)>0?"수정완료":"수정실패";
%>
<script>
location.href='saleProductView.jsp?productsIds=<%=productId%>&trade=<%=trade%>';
</script>