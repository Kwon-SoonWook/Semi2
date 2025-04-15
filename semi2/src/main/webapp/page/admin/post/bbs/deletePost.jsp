<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.content.*" %>
<jsp:useBean id="bdao" class="com.ksj.content.BbsDAO"></jsp:useBean>

<%
ArrayList<BbsDTO> arr = bdao.bbsList(0, "");
String ck[] = new String[arr.size()];
int count = 0;
for(int i=0; i<arr.size();i++){
	ck[i] = request.getParameter(""+(arr.get(i).getBbs_idx()));
	if(ck[i]!=null){
		if(ck[i].equals("on")){
			bdao.bbsDelete(""+(arr.get(i).getBbs_idx()));
			count++;
		}
	}
}
if(count==0){
	%>
	<script>
	window.alert('선택된 게시물이 없습니다. 삭제할 게시물을 선택해주세요.');
	location.href='../contentList.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=count%>개의 게시물이 삭제되었습니다.');
	location.href='../contentList.jsp';
	</script>
	<%
}
%>
