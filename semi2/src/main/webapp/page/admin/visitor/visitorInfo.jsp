<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ksj.visitor.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="vdao" class="com.ksj.visitor.VisitCountDAO"></jsp:useBean>
<%
String day_s = request.getParameter("day");
int day;
if(day_s==null || day_s.equals("")){
	day = 0;
}else{
	day = Integer.parseInt(day_s);
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문자 통계</title>
<link rel='stylesheet' type='text/css' href='/semi2/page/admin/adminLayout.css'>
<style>
.container1 {
	display: flex;
}

.main-content1 {
	flex: 1;
	background-color: #fff;
	padding: 30px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #2f3640;
}

section {
	width: 700px;
	margin: auto;
}

form {
	display: flex;
	flex-direction: column;
}

.select-bar {
	text-align: right;
	margin-top: 20px;
}


.select-bar select {
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

.select-bar input[type="submit"] {
	padding: 5px 15px;
	background-color: #0984e3;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search-bar input[type="submit"]:hover {
	background-color: #74b9ff;
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

tr:nth-child(even) {
	background-color: #f9f9f9;
}
<%
if(day==30){
%>
.sidebar {
	width: 250px;
	background-color: #2d3436;
	color: white;
	padding: 20px;
	height: 190vh;
	left: 0;
	top: 0;
	box-shadow: 2px 0 8px rgba(0,0,0,0.1);
	}
<%
}else if(day==15){
%>
.sidebar {
	width: 250px;
    background-color: #2d3436;
    color: white;
    padding: 20px;
	height: 110vh;
	left: 0;
	top: 0;
	box-shadow: 2px 0 8px rgba(0,0,0,0.1);
}
<%	
}
%>
</style>
</head>
<body>
<%
int totalCount = (int) session.getAttribute("totalCount");
int todayCount = (int) session.getAttribute("todayCount");
%>
<%@include file="../main/adminHeader.jsp" %>
<div class="container1">
	<%@include file="../main/adminCategory.jsp" %>
	<main class="main-content1">
		<section>
			<article>
				<h2>방문자 현황</h2>
				<form name='visitorInfo' action='visitorInfo.jsp' method="get">
					<div class="select-bar">
						<select name="day">
						<%
						if(day==15){
							%>
							<option value="7">최근 7일</option>
							<option value="15" selected="selected">최근 15일</option>
							<option value="30">최근 1개월</option>
							<%
						}else if(day==30){
							%>
							<option value="7">최근 7일</option>
							<option value="15">최근 15일</option>
							<option value="30" selected="selected">최근 1개월</option>
							<%
						}else{
							%>
							<option value="7" selected="selected">최근 7일</option>
							<option value="15">최근 15일</option>
							<option value="30">최근 1개월</option>
							<%
						}
						%>
						</select>
						<input type="submit" value="조회">
					</div>
					<table>
					<tr><th style="width: 200px">총 방문자</th>
						<td style="width: 150px"><%=totalCount %>명</td>
						<th style="width: 200px">오늘 방문자</th>
						<td style="width: 150px"><%=todayCount %>명</td>
					</tr>
					</table>
					<table>
						<thead>
							<tr>
								<th style="width: 500px">일자</th>
								<th>방문자</th>
							</tr>
						</thead>
						<tbody>
							<%
							if(day_s==null){
								for(int i=0; i<7; i++){
									%>
									<tr><td><%=vdao.getVisitDate(i) %></td><td><%=vdao.getVisitDateCount(i) %>명</td></tr>
									<%
								}
							}else{
								for(int i=0; i<day; i++){
									%>
									<tr><td><%=vdao.getVisitDate(i) %></td><td><%=vdao.getVisitDateCount(i) %>명</td></tr>
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