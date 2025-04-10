<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>

<%
String comm = request.getParameter("comm");
int idx = Integer.parseInt(request.getParameter("idx"));
int result = kdao.cmtUpload(idx, comm);

String msg = result>0?"등록완료":"등록실패";


%>

<script>

window.alert('<%=msg%>');
location.href = "bbsContent.jsp?id=<%=idx%>"
</script>