<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
String ask_user_id = (String)session.getAttribute("sid");
String ask_writer = (String)session.getAttribute("sid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
</head>
<body>
<%@include file="../main/header.jsp" %>
	<div class="container">
        <%@include file="../main/category.jsp" %>
       	 <main class="main-content">
			<section>
				<article>
				<h2></h2>
				<form name='askWrite' action='askWrite_ok.jsp'>
				<input type='hidden' name='ask_writer' value='<%=ask_user_id%>'>
				<input type='hidden' name='ask_user_id' value='<%=ask_user_id%>'>
					<table>
						<tr>
							<th>제목</th>
							<td colspan='3'>
								<input type='text' name='ask_title' size='45'>
							</td>
						</tr>
						<tr>
							<td colspan='4'>
								<textarea rows="8" cols="53" name='ask_content'></textarea>
							</td>
						</tr>
						<tr>
							<td colspan='4' align='center'>
								<input type="submit" value='작성하기'>
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