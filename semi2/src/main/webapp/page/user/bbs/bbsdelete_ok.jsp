<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="kdao" class = "com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>

<%

String bbs_idx = request.getParameter("id");
int div = Integer.parseInt(request.getParameter("div"));
int result = kdao.bbsDelete(bbs_idx);

String msg = result>0?"삭제가 완료되었습니다~":"삭제 실패 ㅜㅜ";




switch(div){
case 0:
	%>
	<script>
window.alert('<%=msg%>');
location.href = "noticeBbs.jsp";
</script>
	<%
	break;
case 1:
	%>
	<script>
window.alert('<%=msg%>');
location.href = "communityBbs.jsp";
</script>
	<%
	break;
case 2:
	%>
	<script>
window.alert('<%=msg%>');
location.href = "buyBbs.jsp";
</script>
	<%
	break;
}
%>