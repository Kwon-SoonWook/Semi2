<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>

<%
ArrayList<UserDTO> arr = udao.userList();
String ck[] = new String[arr.size()];
String msg = "";
for(int i=0; i<arr.size();i++){
	ck[i] = request.getParameter(arr.get(i).getId());
	if(ck[i]!=null){
		if(ck[i].equals("on")){
			udao.userDelete(arr.get(i).getId());
		}
	}
}
%>
<script>
window.alert('선택한 사용자의 계정이 삭제되었습니다.');
location.href='userInfoList.jsp';
</script>
