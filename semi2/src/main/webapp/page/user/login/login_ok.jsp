<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>
    <jsp:useBean id="kdto" class = "com.ksj.login.loginDTO"></jsp:useBean> 
    <jsp:setProperty property="*" name="kdto"/>
<%
 
String result = kdao.login(kdto.getId(),kdto.getPwd());
System.out.println(result);
String msg = "";

if(result == null || result.equals("")){
	msg = "아이디 혹은 비밀번호가 틀렸습니다";
}else{
	msg = "로그인 성공";
	session.setAttribute("sid", kdto.getId());
	session.setAttribute("sname", result);
}

%>
<script>

window.alert('<%=msg%>');
location.href = 'login.jsp';


</script> 