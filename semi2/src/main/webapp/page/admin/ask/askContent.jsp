<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
int ask_id = Integer.parseInt(request.getParameter("ask_id"));
AskDTO dto = adao.askContent(ask_id);
%>
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
	width: 700px;
	margin: auto;
}

form {
	display: flex;
	flex-direction: column;
	gap: 20px;
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
input[type="submit"] {
	padding: 10px 20px;
	background-color: #8c8c8c;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="button"] {
	padding: 10px 20px;
	background-color: #8c8c8c;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='/semi2/page/admin/adminLayout.css'>

</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
	<div class="container1">
        <%@include file="../main/adminCategory.jsp" %>
       	 <main class="main-content1">
			<section>
				<article>
				<h2></h2>
				<form name='askContent' action='askList.jsp'>
					<table width="550" border="1" cellspacing="0">
						<tr>
							<th>번호</th>
							<td><%=ask_id%></td>
							<th>작성날짜</th>
							<td><%=dto.getAsk_date() %></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%=dto.getAsk_user_id() %></td>
							<th>처리상태</th>
							<%
							if(dto.getAsk_type()==0){
								%>	
								<td style="color: red;">미처리</td>
								<%	
							}else if(dto.getAsk_type()==1){
								%>
								<td>처리완료</td>	
								<%
							}else if(dto.getAsk_type()==2){
								%>
								<td>문의답변</td>	
								<%
							}
							%>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan='3'>
							<%=dto.getAsk_title() %>
							</td>
						</tr>
						<tr>
							<td colspan='4' align='left' valign='top'><%=dto.getAsk_content().replaceAll("\n", "<br>") %></td>
						</tr>
					</table>
					<div style="margin: auto;"><input type='submit' value='목록으로'>
					<input type='button' value='문의답변' onclick="location.href='askReWrite.jsp?ask_id=<%=dto.getAsk_id() %>&ask_writer=<%=dto.getAsk_writer() %>&ask_title=<%=dto.getAsk_title() %>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>'"></div>
				</form>
				</article>
			</section>            
        </main>    
    </div>
</body>
</html>