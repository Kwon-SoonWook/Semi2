<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
    
<%
String productsIds = request.getParameter("prodcutsId");
int productsId = 0;
if(!(productsIds==null||productsIds.equals(""))){
	productsId = Integer.parseInt(productsIds);
}
String buyerId= request.getParameter("buyerId");
String sellerId= request.getParameter("sellerId");
String contentname = request.getParameter("contentname");
ProductsCommentDTO pcdto = new ProductsCommentDTO(0,productsId,buyerId,sellerId,contentname,0,0,0,0);
String msg = pcdao.productsCommentWrite(pcdto)>0?"댓글완료":"댓글실패";
%>
<script>
window.alert('<%=msg%>');
location.href='saleProductView.jsp?productId=<%=productsId%>';
</script>