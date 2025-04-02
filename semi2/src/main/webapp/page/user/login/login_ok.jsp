<%@ page language="java" contentType="text/html; charset=UTF-8"
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
=======
String sname = kdao.login(kdto.getId(), kdto.getPwd());

if (sname == null || sname.equals("")) {
%>
<script>
	window.alert('아이디 혹은 비밀번호가 틀렸습니다');
	location.href = 'login.jsp';
</script>
<%
} else 
{
session.setAttribute("sid", kdto.getId());
session.setAttribute("sname", sname);
>>>>>>> 4ab0430051bfc6ee91602c77ab44cf1ce3368dce

window.alert('<%=msg%>');
location.href = 'login.jsp';

%>
<script>
	window.alert('<%=sname%>님 환영합니다~');
	location.href = '../main/index.jsp';

</script> </script> </script> }
%>
