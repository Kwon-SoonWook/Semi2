<%@page import="com.ksj.bbs.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>노후재활센터</title>
<style>
table {
	text-align: center;
	width: 1200px;
	border-top: 3px groove black;
	border-bottom: 3px groove black;
	margin: auto;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid gray;
	padding: 10px;
}

h2 {
	text-align: center;
}

thead tr {
	background-color: #a0a0a0;
	border-bottom: 3px groove black;
}

caption {
	text-align: right;
	padding-bottom: 10px;
}

.right-write {
	text-align: right; 
	padding-top: 5px;
}

.pagination {
	text-align: center;
	margin-top: 20px;
}

.pagination a {
	display: inline-block;
	padding: 10px 15px;
	margin: 0 5px;
	color: #007BFF;
	text-decoration: none;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.pagination a:hover {
	background-color: #f1f1f1;
}

.pagination .active {
	background-color: #007BFF;
	color: white;
	border-color: #007BFF;
}
</style>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js"
	crossorigin="anonymous"></script>

<%
String indexid = (String) session.getAttribute("sid");
String select = request.getParameter("select");
String input = request.getParameter("find");

if (select == null) {
	select = "0";
}
if (select.equals("title") && input != "") {
	select = "2";
} else if (select.equals("writer") && input != "") {
	select = "1";
} else {
	select = "0";
}

// 페이징 처리 변수
// 총 게시물 수
int totalCnt = kdao.getTotalCnt(); //db로 부터 조회하는 것이 기본 //56개의 게시물
// 보여줄 리스트 수
int listSize = 1; //5개씩 보여주기 인위적으로 내 맘대로 적용
//보여줄 페이지 수
int pageSize = 5;
//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
   cp_s = "1";
}
int cp = Integer.parseInt(cp_s);


// 총 페이지 수
int totalPage = (totalCnt / listSize) + 1; //공식 / ㄴ딱 나눠떨어질 땐 하나 많은 상황 발생하므로
if (totalCnt % listSize == 0) //딱떨어지면 줄여서 
   totalPage--;

//사용자가 어떤 그룹에 속해있는 지 확인
//사용자 속해있는 그룹(12345 or 678910 ... )
int userGroup = cp / pageSize; //딱 나눠떨어지면 하나가 더 생기는 상황이 생기므로 IF문 작성
if (cp % pageSize == 0)
   userGroup--; //나눠떨어지면 1개 빠질 수 있도록 함

ArrayList<BbsDTO> arr = kdao.bbsList(cp, listSize);
%>
</head>
<%@include file="/page/user/main/header.jsp"%>
<title>자유게시판</title>
<body>
	<div class="container">
		<%@include file="/page/user/main/category.jsp"%>
		<main class="main-content">
			<h2>자 유 게 시 판</h2>
			<section style="width:1200px; margin:auto;">
				<article>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < arr.size(); i++) {
								if (arr.get(i).getBbs_div() == 1) {
							%>
							<tr>
								<td><%=arr.get(i).getBbs_idx()%></td>
								<td><a href="bbsContent.jsp?id=<%=arr.get(i).getBbs_idx()%>"><%=arr.get(i).getTitle()%></a></td>
								<td><%=arr.get(i).getBbs_id()%></td>
								<td><%=arr.get(i).getCreate_date()%></td>
								<td><%=arr.get(i).getView_cnt()%></td>
							</tr>
							<%
								}
							}

		                     if (userGroup != 0) {
		                     %> 
		                     <a href="communityBbs.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
		                     <%
		                     }
		                     %> 
		                     <%
		                      for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
		                      %>
		                      &nbsp;&nbsp;<a href="communityBbs.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp; 
		                      <%
		                      if (i == totalPage) {
		                      break;
		                      }
		                      }
		                      %> 
		                      <%
		                      if (((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) != userGroup) {
		                      %> 
		                      <a href="communityBbs.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
		                     <%
		                     }
		                     
							%>
						</tbody>
					</table>

					<div class="right-write">
						<form action="communityBbs.jsp">
							<select name="select">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
							<input type="text" name="find" style="text-align:left;">
							<input type="submit" value="검색">
						</form>
						<input type="submit" value="글쓰기" onclick="location.href='writeBbsPost.jsp'">
					</div>

					<!-- 페이징 -->

				</article>
			</section>
		</main>
	</div>
</body>

<footer>
    <%@include file="/page/user/main/footer.jsp"%>
</footer>

</html>

