<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adto" class="com.ksj.ask.AskDTO"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
int result = adao.askUpdate(adto);
String msg = "";
if(result > 0){
	msg = "문의 답변이 수정되었습니다.";
}else{
	msg = "문의 답변 수정에 실패하였습니다.";
}
%>

<script>
window.alert('<%=msg%>');
location.href='askContent.jsp?ask_id=<%=adto.getAsk_id()%>';
</script>