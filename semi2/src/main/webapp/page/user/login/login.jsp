<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function show(){
	window.open('findId.jsp','idpopup','width = 500 height = 500')
	
}
function show2(){
	window.open('findPwd.jsp','pwdpopup','width = 500 height = 500')
	
}

</script>
<title>Insert title here</title>
<%
String saveid = "";

Cookie cks[] = request.getCookies();
if(cks!=null){
	for(int i = 0; i < cks.length; i++){
		if(cks[i].getName().equals("sname")){
			saveid = cks[i].getValue();
		}
	}
	
	
}

%>
</head>
<h2>로 그 인 </h2>
<body>
<form action = "login_ok.jsp">
<div>
아이디 : 
<input type = "text" name = "id" value = "<%=saveid%>">
</div>
<div>
비밀번호 : 
<input type = "password" name = "pwd">
</div>
<input type ="submit" value = "로그인">
<input type ="button" value = "회원가입" onclick="location.href='signUp.jsp'">
<input type ="button" value = "아이디찾기" onclick="show();">
<input type ="button" value = "비밀번호찾기" onclick="show2();">
<%
if(session.getAttribute("sid")!=null||session.getAttribute("sname")!=null){
	%>
	<input type = "button" value = "로그아웃" onclick = "location.href='logout.jsp'">
	<%
}



%>
<div><input type = "checkbox" name = "saveid" value = "on" <%=saveid.equals("")?"":"checked" %>>아이디 기억하기</div>
</form>
</body>
</html>