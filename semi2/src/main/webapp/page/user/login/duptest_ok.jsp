<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO"></jsp:useBean>

<%
String id = request.getParameter("id");

// 공백만 입력, null, 빈 값, 공백 포함(중간/앞/뒤) 모두 불가
if(id == null || id.trim().isEmpty() || id.contains(" ")) {
%>
<script>
window.alert('아이디에 공백을 포함할 수 없습니다.');
location.href='duptest.jsp';
</script>
<%
    return;
}

boolean result = kdao.duptest(id);

if(result == true){
%>
<script>
window.alert('사용가능한 아이디입니다.');
window.opener.document.getElementById("id").value = "<%= id %>";
window.close();
</script>
<%
}else{
%>
<script>
window.alert('사용 불가능한 아이디입니다.');
location.href='duptest.jsp';
</script>
<%
}
%>
