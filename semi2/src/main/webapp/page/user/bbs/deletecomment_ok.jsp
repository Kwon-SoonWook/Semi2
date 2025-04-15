<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="kdao" class = "com.ksj.bbs.CommentDAO"></jsp:useBean>

<%
String writer = (String)session.getAttribute("sid");
String cmtid = request.getParameter("id");
String nickname = (String)session.getAttribute("nickname");
String id = request.getParameter("bbsid");
kdao.deletecmt(cmtid);



%>
<script>
location.href=('bbsContent.jsp?id=<%=id %>');

</script>