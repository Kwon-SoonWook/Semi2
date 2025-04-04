<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>1:1 문의</title>
<style>
body{
	height: auto;
	overflow: hidden;
}
h2{
	text-align: center;
}
table{
	height: auto;
	width: 550px;
	margin: 0px auto;
	border-top:3px double darkgray;
	border-bottom: 3px double darkgray;
}
table thead th{
	background-color : lightgray;
}
</style>
</head>
<body>
<section>
	<article>
	<h2>나의 문의</h2>
	<form name='userAskList' action='askWrite.jsp'>
		<table>
			<caption style="text-align:right;"><input type='submit' value='문의작성'></caption>
			<thead>
				<tr>
					<th style="text-align: center;">제목</th>
					<th style="width: 130px; text-align: center;">작성자</th>
					<th style="width: 80px; text-align: center;">작성일</th>
					<th style="width: 80px; text-align: center;">처리상태</th>
				</tr>
			</thead>
			<tbody>
				<%
				String sid = (String)session.getAttribute("sid");
				ArrayList<AskDTO> arr = adao.userAskList(sid);
				if(arr==null || arr.size()==0){
					%>
					<tr>
						<td colspan='5' align='center'>등록된 문의가 없습니다.</td>
					</tr>
					<%
				}else{
					for(int i=0; i<arr.size(); i++){
						%>
						<tr>
							<td>
						<%
						if(arr.get(i).getAsk_type()==2){
							out.println("&nbsp");
						}
							%>
							<a href="userAskContent.jsp?ask_id=<%=arr.get(i).getAsk_id()%>" style="color: black; text-decoration: none;"><%=arr.get(i).getAsk_title() %></a></td>
							<td style="text-align: center;"><%=arr.get(i).getAsk_user_id() %></td>
							<td style="text-align: center;"><%=arr.get(i).getAsk_date() %></td>
						<%if(arr.get(i).getAsk_type()==0){
							%>	
							<td style="color: red; text-align: center;">미처리</td>
							<%	
						}else if(arr.get(i).getAsk_type()==1){
							%>
							<td style="color: blue; text-align: center;">처리완료</td>	
							<%
						}else if(arr.get(i).getAsk_type()==2){
							%>
							<td style="text-align: center;">문의답변</td>	
							<%
						}
						%>
						</tr>
						<%
					}
				}
				%>
			</tbody>
		</table>
	</form>
	</article>
</section>            
</body>
</html>
