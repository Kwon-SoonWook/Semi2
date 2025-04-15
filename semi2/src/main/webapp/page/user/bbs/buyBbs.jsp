<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.ksj.bbs.*" %>
<jsp:useBean id="bdao" class="com.ksj.bbs.BbsDAO" scope="session"></jsp:useBean>
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
int bbsdiv = 1;
int totalCnt = bdao.getTotalCnt(bbsdiv);
int listSize = 5;
int totalPage = (totalCnt/listSize)+1;
if(totalCnt%listSize == 0) totalPage--;
int pageSize = 5;
String cp_s = request.getParameter("cp");
if(cp_s == null || cp_s.equals("")){
	cp_s="1";
}
int cp = Integer.parseInt(cp_s);
int userGroup = cp/pageSize;
if(cp % pageSize == 0) userGroup--;

request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
if(keyword==null){
	keyword="";
}

String select = request.getParameter("select");
if(select==null){
	select="title";
}
%>
<body>
<%@include file="/page/user/main/header.jsp" %>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
	<main class="main-content">
		<form name="buyFind" method="get" action="">
		<div class="page">
			<h2>삽니다 게시판</h2>
			<table>
				<caption style="caption-side:top; height:30px; vertical-align: center; text-align: right;">
					<input type="submit" value="글쓰기" onclick="location.href='writeBbsPost.jsp'">
				</caption>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
				ArrayList<BbsDTO> arr = bdao.bbsList2(bbsdiv, cp, listSize);
				if(arr == null || arr.size()==0){
					%>
					<tr>
						<td colspan="5">
						등록된 게시글이 없습니다.
						</td>
					</tr>
					<%
				}else{
					for(int i=0; i<arr.size(); i++){
						%>
						<tr>
							<td><%=arr.get(i).getBbs_idx() %></td>
							<td><a href = "bbsContent.jsp?id=<%=arr.get(i).getBbs_idx()%>"><%=arr.get(i).getTitle()%></a></td>
							<td><%=arr.get(i).getBbs_id() %></td>
							<td><%=arr.get(i).getCreate_date() %></td>
							<td><%=arr.get(i).getView_cnt() %></td>
						</tr>
						<%
					}
				}	
				%>
				</tbody>
				<caption style="caption-side:bottom; height: 50px; vertical-align: center;">
					
					<%if(userGroup!=0){ %>
						<a href="buyBbs.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt; &lt;</a>
					<%} %>
					<% for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
						%>&nbsp;&nbsp;<a href="buyBbs.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
						if(i==totalPage){
							break;
						}
					}
					%>
					<%if(((totalPage/pageSize)-(totalPage%pageSize==0?1:0))!=userGroup){ %>
						<a href="buyBbs.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt; &gt;</a>
					<%} %>
				</caption>
				<caption style="caption-side:bottom; height: 50px; vertical-align: center;">
				
					<input type="hidden" name="keyword" value="<%=keyword %>">
						<select id="select" name="select" onchange="this.form.submit()">
							<option value="title" <%="title".equals(request.getParameter("sort"))?"selected":"" %>>제목</option>
							<option value="writer" <%="writer".equals(request.getParameter("sort"))?"selected":"" %>>작성자</option>
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