<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
int ask_id = Integer.parseInt(request.getParameter("ask_id"));
AskDTO dto = adao.askContent(ask_id);
String cp_s = request.getParameter("cp");
int cp = 0;
String sid = (String) session.getAttribute("sid");
if(cp_s==null){
	cp = 0;
}else{
	cp = Integer.parseInt(cp_s);	
}
%>
<style>
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
td{
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

input[type="submit"], input[type="button"] {
	background-color: #8c8c8c;
	color: white;
	border: none;
	padding: 5px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
</head>
<body>
	<div class="container">
       	 <main class="main-content">
			<section>
				<article>
				<h2>문의 내용</h2>
				<form name='userAskContent' action='askUpdate.jsp?'>
					<table width="550" border="1" cellspacing="0">
						<input type='hidden' name='ask_title' value='<%=dto.getAsk_title()%>'>
						<input type='hidden' name='ask_content' value='<%=dto.getAsk_content()%>'>
						<input type='hidden' name='ask_id' value='<%=ask_id%>'>
						<tr>
							<th>No</th>
							<td><%=ask_id%></td>
							<th>작성일자</th>
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
							<td colspan='4' align='left' valign='top' style="padding: 15px;"><%=dto.getAsk_content().replaceAll("\n", "<br>") %></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<input type='button' value='목록으로' onclick="location.href='userAskList.jsp?cp=<%=cp%>'">
						<%
						if(sid.equals(dto.getAsk_user_id())){
							%>
							<input type="submit" value="수정하기">
							<%
						}
						%>
					</div>
				</form>
				</article>
			</section>            
        </main>    
    </div>
</body>
</html>