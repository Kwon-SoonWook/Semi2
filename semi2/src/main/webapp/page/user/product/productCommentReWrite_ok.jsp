<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
<%
String id_s = request.getParameter("Products_id");
int id = 0;
if(!(id_s==null||id_s.equals(""))){
	id = Integer.parseInt(id_s);
}
String buyerId = request.getParameter("Buyer_id");
String sellerId = request.getParameter("seller_id");
String commentContent = request.getParameter("comment_content");
String ref_s = request.getParameter("ref");
String lev_s = request.getParameter("lev");
String sunbun_s = request.getParameter("sunbun");

int ref = 0;
if(!(ref_s==null||ref_s.equals(""))){
	ref = Integer.parseInt(ref_s);
}
int lev = 0;
if(!(lev_s==null||lev_s.equals(""))){
	lev = Integer.parseInt(lev_s);
}
int sunbun = 0;
if(!(sunbun_s==null||sunbun_s.equals(""))){
	sunbun = Integer.parseInt(sunbun_s);
}
ProductsCommentDTO pcdto = new ProductsCommentDTO(0,id,buyerId,sellerId,commentContent,new java.sql.Timestamp(0),ref,lev,sunbun,0);

String msg = pcdao.productsCommentReWrite(pcdto)>0?"답글성공":"답글실패";
%>
<script>
location.href='saleProductView.jsp?productsIds=<%=id%>';
</script>