<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>    
<%
	String idx_s = request.getParameter("idx");
	int idx = 0;
	if(!(idx_s==null||idx_s.equals(""))){
		idx = Integer.parseInt(idx_s);
	}
	ProductsCommentDTO dto = pcdao.productsCommentList(idx);
	String msg = pcdao.updateProductsComment(idx)>0?"삭제성공":"삭제실패";
%>
<script>
window.alert('<%=msg%>');
location.href='saleProductView.jsp?productsIds=<%=dto.getProducts_id()%>';
</script>