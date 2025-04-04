<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
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
</style>
</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
	<div class="container">
        <%@include file="../main/adminCategory.jsp" %>
       	 <main class="main-content">
			<section>
				<article>
				<h2>문의함</h2>
				<form name='askList' action='askList_ok.jsp'>
					<table>
						<thead>
							<tr>
								<th style="width: 40px; text-align: center;">번호</th>
								<th style="text-align: center;">제목</th>
								<th style="width: 130px; text-align: center;">작성자</th>
								<th style="width: 80px; text-align: center;">작성일</th>
								<th style="width: 80px; text-align: center;">처리상태</th>
							</tr>
						</thead>
						<tbody>
							<%
							ArrayList<AskDTO> arr = adao.askList();
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
										<td style="text-align: center;"><%=arr.get(i).getAsk_id() %></td>
										<td>
									<%
									if(arr.get(i).getAsk_type()==2){
										out.println("&nbsp");
									}
										%>
										<a href="askContent.jsp?ask_id=<%=arr.get(i).getAsk_id()%>" style="color: black; text-decoration: none;"><%=arr.get(i).getAsk_title() %></a></td>
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
        </main>    
    </div>
</body>
</html>