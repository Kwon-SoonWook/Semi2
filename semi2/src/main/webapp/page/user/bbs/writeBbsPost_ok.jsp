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

String bbs_div = mr.getParameter("bbs_div");
if(bbs_div==null){
	bbs_div = "";
}
String id = (String)session.getAttribute("sid");
int result = kdao.bbsUpload(id,mr);
String msg = "";

if(result==0){
	msg = "로그인 후 이용해주세요~";
	%>
	<script>
	window.alert('<%=msg%>')
	const result = confirm('로그인하시겠습니까?')
	
	if(result){
		location.href = "/semi2/page/user/login/login.jsp"
	}else{
		location.href = 'communityBbs.jsp';
	}
	</script>
	<%
}else if(result ==1){
	msg = "게시글이 등록 되었습니다.";
}else{  
 	msg = "항목을 바르게 입력해주세요.";
}


if(bbs_div.equals("1")){
	%>
	<script>
	window.alert('<%=msg%>');
	location.href = 'communityBbs.jsp';
	</script>
	<%
}else if(bbs_div.equals("2")){
	%>
	<script>
	window.alert('<%=msg%>');
	location.href = 'buyBbs.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=msg%>');
	location.href = 'noticeBbs.jsp';
	</script>
	<%
}
%>




