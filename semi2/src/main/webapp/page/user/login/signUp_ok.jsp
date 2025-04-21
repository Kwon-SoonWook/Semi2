<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="kdto" class = "com.ksj.login.loginDTO"></jsp:useBean> 
    <jsp:setProperty property="*" name="kdto"/>
    <jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>
<%
String savepath = request.getRealPath("/page/user/login/profile");

MultipartRequest mr =
new MultipartRequest(request,savepath,1024*1024*30,"utf-8",new DefaultFileRenamePolicy());

int result = kdao.signUp(mr);    
String msg = result>0?"가입이 완료되었습니다~":"항목을 채워주세요~";

 
%>
 <script>
window.alert('<%=msg%>');
location.href = "login.jsp"; 

</script>