<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="com.ksj.review.ReviewDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class="com.ksj.review.ReviewDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
rdto.setUsere_id((String)session.getAttribute("sid"));
rdto.setReview_type(0);
pdao.upadteProductBuyerId(rdto.getUser_id(), Integer.parseInt(rdto.getProducts_id()));
String msg = rdao.addReview(rdto)>0?"등록성공":"등록실패";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>