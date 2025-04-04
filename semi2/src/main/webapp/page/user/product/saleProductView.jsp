<%@page import="com.ksj.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
int prodcutsId = 61;
ProductDTO pdto = pdao.ProductList(prodcutsId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload=function(){
	<%
	if(pdto.getSeller_id()==sid){
		%>
		document.getElementById("tradestateid").disabled = true;
		<%
	}else{
		%>
		document.getElementById("tradestateid").disabled = false;
		<%		
	}
	%>
	document.getElementById("tradestateid").value = <%=pdto.getTrade_state()%>
}
function trade(){
	<%
	
	%>
}
</script>
</head>
<body>
<%@include file="/page/user/main/header.jsp" %>
<%
%>
<section>
	<article>
		<form name="saleProductiVeiw" action="">
		<div>
			<div>
			<img alt="" src="img/<%=pdto.getThumb_image()%>">
			</div>
			<div>
			<div>
			<h2>제목:<%=pdto.getTitle() %></h2>
			<select name = "tradestate" id="tradestateid" onchange="">
			<option value=0>판매중</option>	
			<option value=1>예약중</option>	
			</select>
			</div>
			<hr>
			<div>가격:<%=pdto.getPrice() %></div>
			<div><%=pdto.getContent() %></div>
			<div><%=pdto.getLocation() %></div>
			<div>
			<input type="button" name="favorite_products" value="찜">
			<%if(sid!=null&&sid.equals(pdto.getSeller_id())){
				%>
			<input type="button" name="update_products" value="수정하기" onclick="location.href='writeSaleProduct.jsp?productId=<%=prodcutsId%>'">
			<input type="button" name="delete_products" value="삭제하기" onclick="location.href='deleteSaleProduct.jsp?productId=<%=prodcutsId%>'">
			<input type="button" name="hidden_products" value="<%=pdto.getBbs_state()==1?"숨기기":"보이기" %>" onclick="location.href='hideSaleProduct.jsp?productId=<%=prodcutsId%>'">
				
				<%
			}
				
				%>
			</div>
			</div>	
		</div>
		<div>
		
		</div>
		<div>
		</div>
		</form>
	</article>
</section>
<%@include file="/page/user/main/footer.jsp" %>
</body>
</html> 