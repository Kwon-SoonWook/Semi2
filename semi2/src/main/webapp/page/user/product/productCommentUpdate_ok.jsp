<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
<%
String id_s = request.getParameter("Products_id");
int id = 0;
if(!(id_s==null||id_s.equals(""))){
	id = Integer.parseInt(id_s);
}
String idx_s = request.getParameter("idx");
int idx = 0;
if(!(idx_s==null||idx_s.equals(""))){
	idx = Integer.parseInt(idx_s);
}
String commentContent = request.getParameter("comment_content");
String msg = pcdao.updateProductsComment(idx, commentContent) > 0?"수정성공":"수정실패"; 
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>