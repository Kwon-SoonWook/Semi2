<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.ksj.content.*" %>
<jsp:useBean id="bdao" class="com.ksj.content.BbsDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>삽니다 게시판</title>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
}
.container {
    min-height: 100vh;	/*스크린 화면 전체를 가득 채움*/
    white-space: nowrap; /*띄어쓰기 방지*/
}
/*buyBbs main 페이지*/
.main-content {
    flex: 1;
    padding: 20px;
    margin-left: 50px;
}
/*흰색 페이지*/
.page {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
h2{
	text-align: center;
}
table{
	margin:0px auto;
	border-top:3px double #393E46;
	border-bottom:3px double #393E46;
	width:550px;
}
table th{
	background-color: #ddd;
	text-align: center;
}
table td{
	text-align: center;
}
</style>
<% 
request.setCharacterEncoding("UTF-8");
String input = request.getParameter("input");
if(input==null){
	input="";
}

String select = request.getParameter("select");
if(select==null || select.equals("")){
	select="title";
}

ArrayList<BbsDTO> arr = bdao.buyBbsList(select, input);
int totalCnt = 0;
if(arr==null || arr.size()==0){
	totalCnt = 0;
}else{
	totalCnt = arr.size();
}
//보여줄 리스트 수
int listSize = 10;

//보여줄 페이지 수
int pageSize = 5;

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//총 페이지 수
int totalPage = (totalCnt / listSize) + 1;
if (totalCnt % listSize == 0)
	totalPage--;

int userGroup = cp / pageSize;
if (cp % pageSize == 0) userGroup--;

%>
<body>
<%@include file="/page/user/main/header.jsp" %>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
	<main class="main-content">
		<form name="buyFind" method="get" action="buyBbs.jsp">
		<div class="page">
			<h2>삽니다 게시판</h2>
			<table>
				<caption style="caption-side:top; height:30px; vertical-align: center; text-align: right;">
					<input type="button" value="글쓰기" onclick="location.href='writeBbsPost.jsp'">
				</caption>
				<thead>
					<tr>
						<th style="width: 50px; text-align: center;">No</th>
						<th>제목</th>
						<th style="width: 100px; text-align: center;">작성자</th>
						<th style="width: 110px; text-align: center;">작성일</th>
						<th style="width: 70px; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan='5' align='center'>등록된 게시글이 없습니다.</td>
					</tr>
					<%
					} else {
					for (int i = ((cp - 1) * listSize); i < ((cp - 1) * listSize) + listSize; i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=arr.get(i).getBbs_idx()%></td>
						<td style="text-align: center;"><%=arr.get(i).getTitle()%></td>
						<td style="text-align: center;"><%=arr.get(i).getBbs_id()%></td>
						<td style="text-align: center;"><%=arr.get(i).getCreate_date()%></td>
						<td style="text-align: center;"><%=arr.get(i).getView_cnt()%></td>
					<tr>
						<%
							if (i == totalCnt - 1)
								break;
							}
						}
						%>
					
				</tbody>
				<tfoot>
					<tr>
						<td colspan='5' align='center'>
							<%
							if(arr==null || arr.size()==0){
								%>&nbsp;&nbsp;<a
								href="buyBbs.jsp?cp=1&input=<%=input%>&select=<%=select%>"
								style="color: black; text-decoration: underline;">1</a>&nbsp;&nbsp;<%	
							}else{
								if (userGroup != 0) {
									%> <a
									href="buyBbs.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>&input=<%=input%>&select=<%=select%>"
									style="color: black; font-size: 10px; text-decoration: none">&lt;</a>
									<%
								}
								for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
									if (cp == i) {
										%>&nbsp;&nbsp;<a
										href="buyBbs.jsp?cp=<%=i%>&input=<%=input%>&select=<%=select%>"
										style="color: black; text-decoration: underline;"><%=i%></a>&nbsp;&nbsp;<%
									} else {
										%>&nbsp;&nbsp;<a
										href="buyBbs.jsp?cp=<%=i%>&input=<%=input%>&select=<%=select%>"
										style="color: black; text-decoration: none;"><%=i%></a>&nbsp;&nbsp;<%
									}
									if (i == totalPage) {
										break;
									}
								}
								if (((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) != userGroup) {
									%> <a
									href="buyBbs.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>&input=<%=input%>&select=<%=select%>"
									style="color: black; font-size: 10px; text-decoration: none">&gt;</a>
									<%
								}	
							}
							%>
						</td>
					</tr>
				</tfoot>
				<caption style="caption-side:bottom; height: 50px; vertical-align: center;">
				
						<select id="select" name="select">
							<%
							if(select.equals("title")){
								%>
								<option value="title" selected="selected">제목</option>
								<option value="writer">작성자</option>
								<%
							}else if(select.equals("writer")){
								%>
								<option value="title">제목</option>
								<option value="writer" selected="selected">작성자</option>
								<%
							}
							%>
						</select>
					<input type="text" name="input">
					<input type="submit" value="검색">
				</caption>
			</table>  	
		</div>
		</form>	          
	</main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>