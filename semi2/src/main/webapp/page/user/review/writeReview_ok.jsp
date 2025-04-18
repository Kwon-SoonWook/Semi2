<%@page import="com.ksj.product.ProductDTO"%>
<%@page import="com.ksj.review.ReviewDTO"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="com.ksj.review.ReviewDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class="com.ksj.review.ReviewDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
if (sid == null) {
	%>
	<script>
	window.alert('로그인 후 이용해주세요~');
    window.self.close();
	</script>
	<%
    return;
}
String productsId_s = request.getParameter("products_id");
int productsId = 0;
if(productsId_s!=null&&productsId_s.length()!=0){
	productsId = Integer.parseInt(productsId_s);
}
ProductDTO pdto = pdao.ProductList(productsId);
pdto.setTrade_state(2);
pdao.updateProductTrade(pdto);

rdto.setUsere_id((String)session.getAttribute("sid"));
rdto.setReview_type(0);
String review_id = request.getParameter("review_id");
if(review_id!=null&&review_id.length()!=0){
	if(rdao.reviewlist(review_id)!=null){
		rdao.updateReview(review_id);
	}
}
if(request.getParameter("review_type")!=null&&request.getParameter("review_type").length()!=0){
	rdto.setReview_type(1);
}
pdao.upadteProductBuyerId(rdto.getUser_id(), Integer.parseInt(rdto.getProducts_id()));
String msg = rdao.addReview(rdto)>0?"등록성공":"등록실패";
%>
<script>
	if(window.opener.document.getElementById("tradestateid")){
     	window.opener.document.getElementById("tradestateid").value = "2";
	}
     window.opener.location.reload();
     window.self.close();
</script>