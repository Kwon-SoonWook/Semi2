<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="kdto" class = "com.ksj.login.loginDTO"></jsp:useBean> 
    <jsp:setProperty property="*" name="kdto"/>
    <jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>
<%
int result = kdao.signUp(kdto);    
String msg = result>0?"등록완료":"등록실패";

 
%>
 <script>
window.alert('<%=msg%>');
location.href = "login.jsp"; 

</script>