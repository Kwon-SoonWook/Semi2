<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>

<%
String id = request.getParameter("id");

boolean result = kdao.duptest(id);

if(result == true){
	%>
	<script>
	window.alert('사용가능한 아이디입니다.')
	window.opener.document.getElementById("id").value = "<%= id %>"; 
	window.close();
	</script>
	<%
}else{
	%>
	<script>
	window.alert('사용 불가능한 아이디입니다.')
	location.href='duptest.jsp'
	</script>
	<%
}

%>