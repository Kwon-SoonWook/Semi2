<%@page import="com.ksj.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
if (sid == null) {
	%>
	<script>
	window.alert('로그인 후 이용해주세요~');
	const login = confirm('로그인 하시겠습니까?');
	if(login == true){
		location.href = '/semi2/page/user/login/login.jsp';
	}
	</script>
	<%
    return;
}
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
location.href='saleProductView.jsp?productsIds=<%=productId%>';
</script>