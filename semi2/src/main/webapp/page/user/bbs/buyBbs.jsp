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
/*사용자 정보*/
.info{
	padding: 50px;
}

table{
	margin:0px auto;
	border-top:3px double #393E46;
	border-bottom:3px double #393E46;
	width:550px;
}
table th{
	background-color: #9AA6B2;
	text-align: center;
}
</style>
<%@include file="../main/header.jsp" %>
<body>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
	<main class="main-content">
		<div class="page">
			<div class="info" style="text-align: center;">
	      		<h2>삽니다 게시판</h2>
			</div>
			<table>
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
				ArrayList<BbsDTO> arr = bdao.bbsList();
				System.out.println(arr);
				if(arr == null || arr.size()==0){
					%>
					<tr>
						<td colspan="5" align="center">
						등록된 게시글이 없습니다.
						</td>
					</tr>
					<%
				}else{
					for(int i=0; i<arr.size(); i++){
						%>
						<tr>
							<td><%=arr.get(i).getBbs_idx() %></td>
							<td><%=arr.get(i).getTitle() %></td>
							<td><%=arr.get(i).getBbs_id() %></td>
							<td><%=arr.get(i).getCreate_date() %></td>
							<td><%=arr.get(i).getView_cnt() %></td>
						</tr>
						<%
					}
				}
				%>
				</tbody>
				
				<tfoot>
				
				</tfoot>
				
				<caption>
				</caption>
			</table>  	
		</div>	          
	</main>   
</div>
</body>
<footer>
<%@include file="../main/footer.jsp" %>
</footer>
</html>