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
<%@include file="../../main/adminHeader.jsp" %>
	<div class="container">
        <%@include file="../../main/adminCategory.jsp" %>
       	<main class="main-content">
			<section style="width: 800px; margin: auto;">
				<article>
				<h2>게시물 관리</h2>
				<form name='postList' action='deletePost.jsp'>
					<table>
						<thead>
							<tr>
								<th style="width: 50px; text-align: center;">No</th>
								<th style="width: 100px; text-align: center;">구분</th>
								<th>제목</th>
								<th style="width: 80px; text-align: center;">작성자</th>
								<th style="width: 80px; text-align: center;">작성일</th>
								<th style="width: 50px; text-align: center;">조회수</th>
								<th style="width: 30px;"><input type='submit' value='삭제'></th>
							</tr>
						</thead>
						<tbody>
							<%
							ArrayList<UserDTO> arr = udao.userList(0, "");
							if(arr==null || arr.size()==0){
								%>
								<tr>
									<td colspan='5' align='center'>등록된 사용자가 없습니다.</td>
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
        </main>    
    </div>
</body>
</html>