<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<%
ArrayList<AskDTO> arr = adao.askList();
int totalCnt = arr.size();

//보여줄 리스트 수
int listSize = 10; 

//보여줄 페이지 수
int pageSize = 5; 

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//총 페이지 수
int totalPage = (totalCnt/listSize)+1;
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;
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
</style>
</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
	<div class="container">
        <%@include file="../main/adminCategory.jsp" %>
       	 <main class="main-content">
			<section style="width: 800px; margin: auto;">
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
							if(arr==null || arr.size()==0){
								%>
								<tr>
									<td colspan='5' align='center'>등록된 문의가 없습니다.</td>
								</tr>
								<%
							}else{
								for(int i=((cp-1)*listSize); i<((cp-1)*listSize)+listSize; i++){
									%>
									<tr>
									<%if(arr.get(i).getAsk_type()==2){
										%>
										<td style="text-align: center;"></td>
										<td>
									<%
									}else{
										%>
											<td style="text-align: center;"><%=arr.get(i).getAsk_id() %></td>
											<td>
										<%
									}
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
										<td style="text-align: center;">처리완료</td>	
										<%
									}else if(arr.get(i).getAsk_type()==2){
										%>
										<td style="text-align: center;">문의답변</td>	
										<%
									}
									%>
									</tr>
									<%
									if(i==totalCnt-1) break;
								}
							}
							%>
						</tbody>
						<tfoot>
							<tr>
								<td colspan='5' align='center'>
								<%
								
								if(userGroup!=0){
									%>
									<a href="askList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>" style="color:black; font-size:10px; text-decoration:none">&lt;</a>
									<%
								}
								for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
									if(cp == i){
										%>&nbsp;&nbsp;<a href="askList.jsp?cp=<%=i%>" style="color:black; text-decoration:underline;"><%=i%></a>&nbsp;&nbsp;<%	
									}else{
										%>&nbsp;&nbsp;<a href="askList.jsp?cp=<%=i%>" style="color:black; text-decoration:none;"><%=i%></a>&nbsp;&nbsp;<%					
									}
									if(i==totalPage){
										break;
									}
								}
								if(((totalPage/pageSize)-(totalPage%pageSize==0?1:0))!=userGroup){
									%>
									<a href="askList.jsp?cp=<%=(userGroup+1)*pageSize+1%>" style="color:black; font-size:10px; text-decoration:none">&gt;</a>
									<%
								}
								%>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
				</article>
			</section>            
        </main>    
    </div>
</body>
</html>