<%@page import="com.ksj.tempproduct.TempProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="tpdao" class="com.ksj.tempproduct.TempProductDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid = (String)session.getAttribute("sid");
String categoryIds = request.getParameter("category");
int categoryid;
if(categoryIds==null||categoryIds.length()==0){
	categoryid = 0;
	System.out.println("null?");
}else{
	categoryid = Integer.parseInt(categoryIds);		
}

String title= request.getParameter("title");
String prices = request.getParameter("price");
int price;
if(prices==null||prices.length()==0){
	price= 0;
}else{
	price = Integer.parseInt(prices);
}
String content = request.getParameter("content");
String location = request.getParameter("location");
int result;
TempProductDTO dto = new TempProductDTO(sid,title,categoryid,content,price,location);
if(tpdao.tempProductList(sid)==null){
	result = tpdao.addTempProdcuct(dto);	
}else{
	result = tpdao.updateTempProdcuct(dto);
}
String msg = result>0?"임시저장성공":"임시저장실패";
%>
<script>
window.alert('<%=msg%>');
location.href='writeSaleProduct.jsp';
</script>
