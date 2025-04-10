<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean> 
<%
String input = request.getParameter("input");
String select_str = request.getParameter("select");
int select = 0;
if(select_str!=null){
	if(select_str.equals("ID")){
		select = 1;
	}else if(select_str.equals("이름")){
		select = 2;
	}else if(select_str.equals("닉네임")){
		select = 3;
	}
}
//총 사용자 아이디 갯수
ArrayList<UserDTO> arr = udao.userList(select, input);
int totalCnt = arr.size();

//보여줄 리스트 수
int listSize = 10; 

//보여줄 페이지 수
int pageSize = 5; 

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//총 페이지 수
int totalPage = (totalCnt/listSize)+1;
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='/semi2/page/admin/adminLayout.css'>
<style>
.container1 {
	display: flex;
}

.main-content1 {
	flex: 1;
	background-color: #fff;
	padding: 30px;
	box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #2f3640;
}

section {
	width: 1000px;
	margin: auto;
}

form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.search-bar {
	text-align: center;
	margin-top: 20px;
}

.search-bar select,
.search-bar input[type="text"] {
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

.search-bar input[type="button"] {
	padding: 10px 20px;
	background-color: #0984e3;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search-bar input[type="button"]:hover {
	background-color: #74b9ff;
}

/* 예: userInfoList.jsp에서 테이블이 있을 경우를 대비한 기본 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dcdde1;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #f1f2f6;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
<%@include file="../../main/adminHeader.jsp" %>
	<div class="container1">
        <%@include file="../../main/adminCategory.jsp" %>
       	<main class="main-content1">
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
								if(arr==null || arr.size()==0){
									%>
									<tr>
										<td colspan='6' align='center'>등록된 사용자가 없습니다.</td>
									</tr>
									<%
								}else{
									for(int i=((cp-1)*listSize); i<((cp-1)*listSize)+listSize; i++){
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
										if(i==totalCnt-1) break;
									}
								}
							%>
						</tbody>
						<tfoot>
							<tr>
								<td colspan='7' align='center'>
								<%
								
								if(userGroup!=0){
									%>
									<a href="userManagement.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>&input=<%=input %>&select=<%=select_str %>" style="color:black; font-size:10px; text-decoration:none">&lt;</a>
									<%
								}
								for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
									if(cp == i){
										%>&nbsp;&nbsp;<a href="userManagement.jsp?cp=<%=i%>&input=<%=input %>&select=<%=select_str %>" style="color:black; text-decoration:underline;"><%=i%></a>&nbsp;&nbsp;<%	
									}else{
										%>&nbsp;&nbsp;<a href="userManagement.jsp?cp=<%=i%>&input=<%=input %>&select=<%=select_str %>" style="color:black; text-decoration:none;"><%=i%></a>&nbsp;&nbsp;<%					
									}
									if(i==totalPage){
										break;
									}
								}
								if(((totalPage/pageSize)-(totalPage%pageSize==0?1:0))!=userGroup){
									%>
									<a href="userManagement.jsp?cp=<%=(userGroup+1)*pageSize+1%>&input=<%=input %>&select=<%=select_str %>" style="color:black; font-size:10px; text-decoration:none">&gt;</a>
									<%
								}
								%>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
				</article>
			</section>	           
        </main>    
    </div>
</body>
</html>