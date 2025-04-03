<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>
    
<%
String id = (String)session.getAttribute("sid");

int count = kdao.InfoDelete(id);

String msg = count>0?"삭제완료":"삭제실패";

%>
<script>
window.alert('<%=msg%>')
location.href='../login/logout.jsp';
</script>