<%@page import="com.ksj.favoriteproducts.FavoriteProductsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="fdao" class="com.ksj.favoriteproducts.FavoriteProductsDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
String productIds=request.getParameter("productId");
int productId;
if(productIds==null||productIds.equals("")){
	productId=0;
}else{
	productId = Integer.parseInt(productIds);
}
FavoriteProductsDTO fdto = fdao.favoriteProductsList(productId, sid);
if(fdto==null){
	FavoriteProductsDTO dto = new FavoriteProductsDTO(sid,productId,1);
	fdao.addFavoriteProducts(dto);
}else{
	if(fdto.getIs_valid()==0){
		fdto.setIs_valid(1);
		fdao.updateFavoriteProducts(fdto);
	}else if(fdto.getIs_valid()==1){
		fdto.setIs_valid(0);
		fdao.updateFavoriteProducts(fdto);		
	}
}
%>
<script>
location.href='saleProductView.jsp?productId=<%=productId%>';
</script>