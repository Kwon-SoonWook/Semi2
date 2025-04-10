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
	width: 600px;
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
</style>
</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
	<div class="container1">
        <%@include file="../main/adminCategory.jsp" %>
       	 <main class="main-content1">
			<section>
				<article>
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