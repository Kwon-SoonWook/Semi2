<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<%
String input = "";

%>

<table>
	<thead>
		<tr>
			<th style="width: 100px; text-align: center;">ID</th>
			<th style="width: 100px; text-align: center;">이름</th>
			<th style="width: 80px; text-align: center;">닉네임</th>
			<th style="width: 150px; text-align: center;">주소</th>
			<th>E-mail</th>
			<th style="width: 80px; text-align: center;">가입일자</th>
			<th style="width: 30px;"></th>
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
					<td style="text-align: center;"><%=arr.get(i).getId() %></td>
					<td style="text-align: center;"><%=arr.get(i).getName() %></td>
					<td style="text-align: center;"><%=arr.get(i).getNickname() %></td>
					<td style="text-align: center;"><%=arr.get(i).getLocation() %></td>
					<td style="text-align: center;"><%=arr.get(i).getEmail() %></td>
					<td style="text-align: center;"><%=arr.get(i).getCreate_date() %></td>
					<td style="text-align: center;"><input type="checkbox" name='<%=arr.get(i).getId()%>'></td>
				<tr>
				<%
			}
		}
		%>
	</tbody>
</table>