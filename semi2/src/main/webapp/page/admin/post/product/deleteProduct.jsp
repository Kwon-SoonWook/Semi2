<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.content.*" %>
<jsp:useBean id="pdao" class="com.ksj.content.ProductDAO"></jsp:useBean>

<%
ArrayList<ProductDTO> arr = pdao.productList(0, "");
String ck[] = new String[arr.size()];
int count = 0;
for(int i=0; i<arr.size();i++){
	ck[i] = request.getParameter(""+(arr.get(i).getProducts_id()));
	if(ck[i]!=null){
		if(ck[i].equals("on")){
			pdao.productDelete(""+(arr.get(i).getProducts_id()));
			count++;
		}
	}
}
if(count==0){
	%>
	<script>
	window.alert('선택된 게시물이 없습니다. 삭제할 게시물을 선택해주세요.');
	location.href='../contentList.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=count%>개의 게시물이 삭제되었습니다.');
	location.href='../contentList.jsp?category=판매 게시글';
	</script>
	<%
}
%>