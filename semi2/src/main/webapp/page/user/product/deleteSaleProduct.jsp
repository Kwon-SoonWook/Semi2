<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.productimages.ProductImagesDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<jsp:useBean id="pidao" class="com.ksj.productimages.ProductImagesDAO"></jsp:useBean>
<%
	String productIds = request.getParameter("productId");
	int productId;
	if(productIds==null||productIds.equals("")){
		productId=0;
	}else{
		productId= Integer.parseInt(productIds);
	}
	int result = pdao.deleteProduct(productId);
	if(result>0){
		ArrayList<ProductImagesDTO> arr = pidao.ProductImagesList(productId);
		int imageResult = pidao.deleteProductImages(productId);
		if(imageResult>0){
			for(int i=0; i< arr.size();i++){
				File f = new File(request.getRealPath("/product/img")+arr.get(i).getProductImagesId());
				if(f.isFile()) {
					f.delete();
				}			
			}			
		}
	}
	String msg = result >0?"삭제성공":"삭제실패";
%>
<script>
location.href='/page/user/main/index.jsp';
</script>