<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='/semi2/css/adminLayout.css'>
<style>
h2{
	text-align: center;
}
table{
	width: 800px;
	margin: 0px auto;
	border-top: 3px solid gray;
	border-bottom: 3px solid gray;
	font-size: 12px;
}
table th{
	background-color: silver;
}
div[name="pg"]{
	text-align: center;
}
div[name="write"]{
	text-align: right;
}
</style>
</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
<section>
	<article>
	<h2>사용자 현황</h2>
	<form name='userInfoList' action='deleteUserInfo.jsp'>
		<div style="text-align:right"><input type='submit' value='삭제'></div>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>주소</th>
					<th>E-mail</th>
					<th>가입일자</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList<UserDTO> arr = udao.userList();
				if(arr==null || arr.size()==0){
					%>
					<tr>
						<td colspan='6' align='center'>등록된 사용자가 없습니다.</td>
					</tr>
					<%
				}else{
					for(int i=0; i<arr.size(); i++){
						%>
						<tr>
							<td><%=arr.get(i).getId() %></td>
							<td><%=arr.get(i).getName() %></td>
							<td><%=arr.get(i).getNickname() %></td>
							<td><%=arr.get(i).getLocation() %></td>
							<td><%=arr.get(i).getEmail() %></td>
							<td><%=arr.get(i).getCreate_date() %></td>
							<td><input type="checkbox" name='<%=arr.get(i).getId()%>'></td>
						<tr>
						<%
					}
				}
				%>
			</tbody>
		</table>
	</form>
	</article>
</section>
</body>
</html>