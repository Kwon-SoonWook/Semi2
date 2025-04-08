<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
int ask_id = Integer.parseInt(request.getParameter("ask_id"));
String ask_user_id = (String)session.getAttribute("sid");
String ask_writer = request.getParameter("ask_writer");
String ask_title = request.getParameter("ask_title");
String ref = request.getParameter("ref");
String lev = request.getParameter("lev");
String sunbun = request.getParameter("sunbun");
%>
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
			<section style="width: 800px; margin: auto;">
				<article>
				<h2></h2>
				<form name='askReWrite' action='askReWrite_ok.jsp'>
				<input type='hidden' name='ask_id' value='<%=ask_id%>'>
				<input type='hidden' name='ask_writer' value='<%=ask_writer%>'>
				<input type='hidden' name='ask_user_id' value='<%=ask_user_id%>'>
				<input type='hidden' name='ref' value='<%=ref%>'>
				<input type='hidden' name='lev' value='<%=lev%>'>
				<input type='hidden' name='sunbun' value='<%=sunbun%>'>
					<table>
						<tr>
							<th>제목</th>
							<td colspan='3'>
								<input type='text' name='ask_title' size='45' value='RE:<%=ask_title%>'>
							</td>
						</tr>
						<tr>
							<td colspan='4'>
								<textarea rows="8" cols="53" name='ask_content'></textarea>
							</td>
						</tr>
						<tr>
							<td colspan='4' align='center'>
								<input type="submit" value='답변하기'>
								<input type='reset' value='다시작성'>
							</td>
						</tr>
					</table>
				</form>
				</article>
			</section>            
        </main>    
    </div>
</body>
</html>