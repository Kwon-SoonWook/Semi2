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
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>1:1 문의 작성</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
<style>
body {
    font-family: Arial, sans-serif;
    height: auto;

}
table{
	margin-left:auto;
	margin-right:auto;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
       	 <main class="main-content">
			<section>
				<article>
				<form name='askWrite' action='askWrite_ok.jsp'>
				<h2>1:1 문의 작성</h2>
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