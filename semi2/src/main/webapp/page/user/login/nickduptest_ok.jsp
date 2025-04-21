<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>

<%
String nickname = request.getParameter("nickname");
if(nickname == null || nickname.trim().isEmpty() || nickname.contains(" ")) {
	%>
	<script>
	window.alert('닉네임에 공백을 포함할 수 없습니다.')
	location.href='nickduptest.jsp'
	</script>
	<%
	
}
boolean result = kdao.nickduptest(nickname);

if(result == true){
	%>
	<script>
	window.alert('사용가능한 닉네임입니다.')
	window.opener.document.getElementById("nickname").value = "<%= nickname %>"; 
	window.close();
	</script>
	<%
}else{
	%>
	<script>
	window.alert('사용 불가능한 닉네임입니다.')
	location.href='nickduptest.jsp'
	</script>
	<%
}

%>