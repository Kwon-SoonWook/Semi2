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
<title>문의함</title>
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
	width: 1000px;
	margin: auto;
}

form {
	display: flex;
	flex-direction: column;
}

.search-bar {
	text-align: center;
	margin-top: 20px;
}

.search-bar select,
.search-bar input[type="text"] {
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

.search-bar input[type="button"] {
	padding: 10px 20px;
	background-color: #0984e3;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search-bar input[type="button"]:hover {
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
}

th {
	background-color: #f1f2f6;
}

</style>
</head>
<body>
<%@include file="../main/adminHeader.jsp" %>
    <div class="container1">
        <!-- 사이드바 -->
        <%@include file="../main/adminCategory.jsp" %>
        <!-- 대시보드 내용 -->
        <main class="main-content1">
			<section style="width: 800px; margin: auto;">
				<article>
				<h2>문의함</h2>
				<form name='askList' action='askList_ok.jsp'>
					<table>
						<thead>
							<tr>
								<th style="width: 60px; text-align: center;">번호</th>
								<th style="text-align: center;">제목</th>
								<th style="width: 130px; text-align: center;">작성자</th>
								<th style="width: 150px; text-align: center;">작성일</th>
								<th style="width: 100px; text-align: center;">처리상태</th>
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
									<%if(arr.get(i).getAsk_type()==2){
										%>
										<tr style="background-color: #f9f9f9;">
											<td style="text-align: center;"></td>
											<td>
									<%
									}else{
										%>
										<tr>
											<td style="text-align: center;"><%=arr.get(i).getAsk_id() %></td>
											<td>
										<%
									}
									if(arr.get(i).getAsk_type()==2){
										out.println("&nbsp");
									}
										%>
										<a href="askContent.jsp?ask_id=<%=arr.get(i).getAsk_id()%>&cp=<%=cp %>" style="color: black; text-decoration: none;"><%=arr.get(i).getAsk_title() %></a></td>
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
								if(arr.size()==0){
									%>&nbsp;&nbsp;<a href="askList.jsp?cp=1" style="color:black; text-decoration:underline;">1</a>&nbsp;&nbsp;<%
								}else{
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