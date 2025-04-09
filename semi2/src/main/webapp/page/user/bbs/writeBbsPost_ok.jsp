<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="kdto" class="com.ksj.bbs.BbsDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="kdto"/>
    <jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>


<%
String savepath = request.getRealPath("/page/user/bbs/img");

MultipartRequest mr =
new MultipartRequest(request,savepath,1024*1024*30,"utf-8",new DefaultFileRenamePolicy());



String id = (String)session.getAttribute("sid");
int result = kdao.bbsUpload(id,mr);

String msg = result>0?"등록완료":"등록실패";


%>

<script>
window.alert('<%=msg%>');
location.href = 'communityBbs.jsp';

</script>



