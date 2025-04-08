<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String sid = (String)session.getAttribute("sid");
String id_s = request.getParameter("idx");
int id = 0;
if(!(id_s==null||id_s.equals(""))){
	id = Integer.parseInt(id_s);
}
ProductsCommentDTO dto = pcdao.productsCommentList(id);
%>
</head>
<body>
	<section>
		<article>
			<form name="productCommentUpdate" action="productCommentUpdate_ok.jsp">
			<input type="hidden" name="Products_id" value="<%=dto.getProducts_id()%>">
			<input type="hidden" name="idx" value="<%=dto.getProducts_comment_idx()%>">
				<table>
					<tr>
						<th>수정하기</th>
					</tr>
					<tr>
						<td><textarea name="comment_content"><%=dto.getComment_content()%></textarea></td>
						<td><input type="submit" value="수정하기">
						</td>
					</tr>
				</table>
			</form>
		</article>
	</section>
</body>
</html>