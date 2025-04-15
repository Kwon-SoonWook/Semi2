<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>

<%
String user_id = (String)session.getAttribute("sid");
String nickname = (String)session.getAttribute("nickname");
String comm = request.getParameter("comm");
int idx = Integer.parseInt(request.getParameter("idx"));
if(nickname==null){
	%>
	<script>
	window.alert('로그인 후 이용해주세요~');
	const login = confirm('로그인 하시겠습니까?');
	if(login == true){
		location.href = "../login/login.jsp"
	}
	</script>
	<%
}else{
	int result = kdao.cmtUpload(idx, comm,nickname);
}





%>

<script>
location.href = "bbsContent.jsp?id=<%=idx%>";
</script>