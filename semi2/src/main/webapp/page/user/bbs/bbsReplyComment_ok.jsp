<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="kdto" class = "com.ksj.bbs.CommentDTO"></jsp:useBean>
<jsp:setProperty property= "*" name ="kdto"/>
<jsp:useBean id="kdao" class = "com.ksj.bbs.BbsDAO"></jsp:useBean>
<%
int bbs_idx = Integer.parseInt(request.getParameter("bbs_idx"));
String parent_id = request.getParameter("parent_id");

int count = kdao.replyComment(kdto);
String msg = count>0?"등록완료":"등록실패";

%>

<script>
window.alert('<%=msg%>');
location.href = "bbsContent.jsp?id=<%=bbs_idx%>";

</script>