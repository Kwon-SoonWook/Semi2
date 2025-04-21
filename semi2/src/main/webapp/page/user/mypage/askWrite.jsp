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
<title>문의 작성</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
<style>
body {
    font-family: Arial, sans-serif;
    height: auto;

}
h2 {
	text-align: center;
	color: #333;
}


table {
	width: 600px;
	border-collapse: collapse;
	text-align: center;
	margin: auto;
}

th {
	padding: 5px;
	vertical-align: top;
	color: #444;
}

input[type="text"], textarea, select {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
	resize: vertical;
}

input[type="submit"], input[type="reset"]{
	background-color: #6E8233;
	color: white;
	border: none;
	padding: 5px 20px;
	font-size: 14px;
	border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 5px;
}

input[type="submit"]:hover, input[type="reset"]:hover {
    background: #f5f5f5;
    color: #000;
    border-color: #bbb;
}
</style>
</head>
<body>
	<div class="container">
       	 <main class="main-content">
			<section>
				<article>
				<form name='askWrite' action='askWrite_ok.jsp'>
				<h2>문의 작성</h2>
				<input type='hidden' name='ask_writer' value='<%=ask_user_id%>'>
				<input type='hidden' name='ask_user_id' value='<%=ask_user_id%>'>
					<table>
						<tr>
							<th>제목</th>
							<td colspan='3' style="padding-bottom: 20px;">
								<input type='text' name='ask_title' size='60'>
							</td>
						</tr>
						<tr>
							<th>본문</th>
							<td colspan='3'>
								<textarea rows="15" cols="62" name='ask_content' style="resize: none;"></textarea>
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