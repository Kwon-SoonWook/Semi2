<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
String input = request.getParameter("find");
String select = request.getParameter("select");
%>
<script>

location.href="communityBbs.jsp?input=<%=input%>&select=<%=select%>"

</script>










