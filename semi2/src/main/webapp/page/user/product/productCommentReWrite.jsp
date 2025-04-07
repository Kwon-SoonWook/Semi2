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
			<form name="productCommentReWrite" action="productCommentReWrite_ok.jsp">
			<input type="hidden" name="Products_id" value="<%=dto.getProducts_id()%>">
			<input type="hidden" name="Buyer_id" value="<%=dto.getBuyer_id()%>">
			<input type="hidden" name="seller_id" value="<%=sid%>">
				<table>
					<tr>
						<th>답글</th>
					</tr>
					<tr>
						<td><textarea name="comment_content"></textarea></td>
						<td colspan="2"><input type="submit" value="글쓰기">
						<input type="reset" value="초기화">
						</td>
					</tr>
				</table>
			<input type="hidden" name="ref" value="<%=dto.getRef()%>">
			<input type="hidden" name="lev" value="<%=dto.getLev()%>">
			<input type="hidden" name="sunbun" value="<%=dto.getSunbun()%>">
			</form>
		</article>
	</section>
</body>
</html>