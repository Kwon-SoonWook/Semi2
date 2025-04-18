<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>

<%

String savepath = request.getRealPath("/page/user/bbs/img");

MultipartRequest mr =
new MultipartRequest(request,savepath,1024*1024*30,"utf-8",new DefaultFileRenamePolicy());


int id = Integer.parseInt(mr.getParameter("id"));
String title = mr.getParameter("title");
String content = mr.getParameter("content");
String img = mr.getParameter("file");

int result = kdao.bbschange(id,mr);

String msg = result>0?"수정이 완료되었습니다~":"수정 실패 ㅜㅜ";  

%>

<script>
window.alert('<%=msg%>');
location.href = "communityBbs.jsp";

</script>