<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>
<jsp:useBean id="kdto" class = "com.ksj.login.loginDTO"></jsp:useBean>
    <%
    
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    String result = kdao.findId(name, email);
    String msg = "";
    
if(result.contains("존재")){
	%>
	<script>
	window.alert('<%=result%>')
	location.href = 'findId.jsp'
	</script>
	<%
}else{
	%>
	<script>
	location.href = 'successFindId.jsp?id=<%=result%>'
	</script>
	
	<%
} 
    %>