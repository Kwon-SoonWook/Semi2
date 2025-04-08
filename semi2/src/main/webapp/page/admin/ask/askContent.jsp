<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
int ask_id = Integer.parseInt(request.getParameter("ask_id"));
AskDTO dto = adao.askContent(ask_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='/semi2/css/adminLayout.css'>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    display: flex;
    min-height: 100vh;
    background-color: #f4f7fc;
}

.container {
    display: flex;
    flex-direction: row;
    width: 100%;
}

.sidebar {
    width: 250px;
    background-color: #2c3e50;
    color: white;
    padding: 20px;
    height: 100vh;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
}

.sidebar ul {
    list-style-type: none;
}

.sidebar ul li {
    margin-bottom: 20px;
}

.sidebar ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
}

.sidebar ul li a:hover {
    color: #3498db;
}

.content {
    flex-grow: 1;
    padding: 30px;
}

h1 {
    color: #333;
    font-size: 2em;
    margin-bottom: 30px;
}

.cards {
    display: flex;
    justify-content: space-between;
}

.card {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 30%;
    padding: 20px;
    text-align: center;
}

.card-icon {
    font-size: 40px;
    margin-bottom: 20px;
    color: #3498db;
}

.card-info h3 {
    font-size: 1.2em;
    margin-bottom: 10px;
}

.card-info p {
    font-size: 1.5em;
    font-weight: bold;
}

.container {
    display: flex;
    flex-direction: row;
    width: 100%;
}

.sidebar {
    width: 250px;
    background-color: #2c3e50;
    color: white;
    padding: 20px;
    height: 100vh;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
}

.sidebar ul {
    list-style-type: none;
}

.sidebar ul li {
    margin-bottom: 20px;
}

.sidebar ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
}

.sidebar ul li a:hover {
    color: #3498db;
}

.content {
    flex-grow: 1;
    padding: 30px;
}

h1 {
    color: #333;
    font-size: 2em;
    margin-bottom: 30px;
}

.cards {
    display: flex;
    justify-content: space-between;
}

.card {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 30%;
    padding: 20px;
    text-align: center;
}

.card-icon {
    font-size: 40px;
    margin-bottom: 20px;
    color: #3498db;
}

.card-info h3 {
    font-size: 1.2em;
    margin-bottom: 10px;
}

.card-info p {
    font-size: 1.5em;
    font-weight: bold;
}
</style>
</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
	<div class="container">
        <%@include file="../main/adminCategory.jsp" %>
       	 <main class="main-content">
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
								<td>미처리</td>
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
					<div><input type='submit' value='목록으로'>
					<input type='button' value='문의답변' onclick="location.href='askReWrite.jsp?ask_id=<%=dto.getAsk_id() %>&ask_writer=<%=dto.getAsk_writer() %>&ask_title=<%=dto.getAsk_title() %>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>'"></div>
				</form>
				</article>
			</section>            
        </main>    
    </div>
</body>
</html>