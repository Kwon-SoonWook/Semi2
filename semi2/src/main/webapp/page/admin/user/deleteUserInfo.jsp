<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>

<%
ArrayList<UserDTO> arr = udao.userList(0, "");
String ck[] = new String[arr.size()];
int count = 0;
for(int i=0; i<arr.size();i++){
	ck[i] = request.getParameter(arr.get(i).getId());
	if(ck[i]!=null){
		if(ck[i].equals("on")){
			udao.userDelete(arr.get(i).getId());
			count++;
		}
	}
}
if(count==0){
	%>
	<script>
	window.alert('선택된 사용자가 없습니다. 삭제할 사용자를 선택해주세요.');
	location.href='userManagement.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=count%>개의 사용자 계정이 삭제되었습니다.');
	location.href='userManagement.jsp';
	</script>
	<%
}
%>
