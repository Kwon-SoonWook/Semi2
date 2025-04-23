<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO"></jsp:useBean>
<jsp:useBean id="kdto" class="com.ksj.login.loginDTO"></jsp:useBean>
<jsp:setProperty property="*" name="kdto" />
<%

String sname = kdao.login(kdto.getId(), kdto.getPwd());
String saveid = request.getParameter("saveid");
if (sname == null || sname.equals("")) {
%>
<script>
   window.alert('아이디 혹은 비밀번호가 틀렸습니다');
   location.href = 'login.jsp';
   session.invalidate();
   
</script>
<%
} else {
	session.setAttribute("sid", kdto.getId());
	session.setAttribute("sname", sname);
	
if (saveid != null) {
	Cookie ck = new Cookie("sid", kdto.getId());

	ck.setMaxAge(60 * 60 * 24);
	response.addCookie(ck);
} else {
	Cookie ck = new Cookie("sid", kdto.getId());

	ck.setMaxAge(0);
	response.addCookie(ck);

}

%>
<script>
	location.href = '../main/index.jsp';
</script>
<%
}
%>
