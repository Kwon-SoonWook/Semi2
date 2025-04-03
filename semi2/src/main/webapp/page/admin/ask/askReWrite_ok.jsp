<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adto" class="com.ksj.ask.AskDTO"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
int result = adao.askReWrite(adto);
String msg = "";
if(result > 0){
	msg = "문의 답변이 작성되었습니다.";
	adao.askUpdate(adto.getAsk_id());
}else{
	msg = "문의 답변에 실패하였습니다.";
}
%>

<script>
window.alert('<%=msg%>');
location.href='askList.jsp';
</script>