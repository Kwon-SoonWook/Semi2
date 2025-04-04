<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adto" class="com.ksj.ask.AskDTO"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
int result = adao.askWrite(adto);
String msg = "";
if(result > 0){
	msg = "문의가 작성되었습니다.";
}else{
	msg = "문의 작성에 실패하였습니다.";
}
%>

<script>
window.alert('<%=msg%>');
location.href='userAskList.jsp';
</script>