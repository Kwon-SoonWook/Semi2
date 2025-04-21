<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ksj.user.*"%>
<%
String category = request.getParameter("category");
String sel = request.getParameter("select");
if(sel==null){
	sel = "전체";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
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

.select-bar {
	text-align: right;
}

.select-bar select{
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

.search-bar select, .search-bar input[type="text"] {
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

.search-bar input[type="button"] {
	padding: 5px 15px;
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

input[type="submit"] {
	padding: 3px 5px;
	background-color: #0984e3;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
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
</style>
<script>
	function keyDownEvent(event) {
	    // 엔터키 누를 경우 show()만 실행, form submit은 막음
	    if (event.key === "Enter" || event.keyCode === 13) {
	        event.preventDefault(); // submit 방지
	        show2(); // 검색 실행
	        return false;
	    }
	    return true;
	}

	function show() {
		var category = document.contentList.category.value;
		location.href = "contentList.jsp?category=" + category;
	}
	function show2() {
		var category = document.contentList.category.value;
		var input =  document.contentList.input.value;
		var select = document.contentList.select.value;
		location.href = "contentList.jsp?category="+category+"&input="+input+"&select="+select;
	}
</script>
</head>
<body>
	<%@include file="../main/adminHeader.jsp"%>
	<div class="container1">
		<%@include file="../main/adminCategory.jsp"%>
		<main class="main-content1">
			<section style="width: 800px; margin: auto;">
				<article>
					<h2>게시물 관리</h2>
					<%
					if(category==null || category.equals("일반 게시글")){
						%>
						<form name='contentList' action='bbs/deletePost.jsp'>
						<%
					}else if(category.equals("판매 게시글")){
						%>
						<form name='contentList' action='product/deleteProduct.jsp'>
						<%
					}
					%>
					<div class="select-bar">
						<select name="category" onchange="show();">
							<%
							if(category==null || category.equals("일반 게시글")){
								%>
								<option selected="selected">일반 게시글</option>
								<option>판매 게시글</option>
								<%
							}else if(category.equals("판매 게시글")){
								%>
								<option>일반 게시글</option>
								<option selected="selected">판매 게시글</option>
								<%
							}
							%>
						</select>
					</div>
					<%
					if(category==null || category.equals("일반 게시글")){
						%>
						<%@include file="bbs/postList.jsp" %>
						<%
					}else if(category.equals("판매 게시글")){
						%>
						<%@include file="product/productList.jsp" %>
						<%
					}
					%>
					<div class="search-bar">
						<select name="select">
							<%
							if(category==null || category.equals("일반 게시글")){
								if(sel.equals("구분")){
									%>
									<option>전체</option>
									<option selected>구분</option>
									<option>제목</option>
									<option>작성자</option>
									<%
								}else if(sel.equals("제목")){
									%>
									<option>전체</option>
									<option>구분</option>
									<option selected>제목</option>
									<option>작성자</option>
									<%
								}else if(sel.equals("작성자")){
									%>
									<option>전체</option>
									<option>구분</option>
									<option>제목</option>
									<option selected>작성자</option>
									<%
								}else{
									%>
									<option selected>전체</option>
									<option>구분</option>
									<option>제목</option>
									<option>작성자</option>
									<%
								}
							}else if(category.equals("판매 게시글")){
								if(sel.equals("제목")){
									%>
									<option>전체</option>
									<option selected>제목</option>
									<option>작성자</option>
									<%
								}else if(sel.equals("작성자")){
									%>
									<option>전체</option>
									<option>제목</option>
									<option selected>작성자</option>
									<%
								}else{
									%>
									<option selected>전체</option>
									<option>제목</option>
									<option>작성자</option>
									<%
								}
							}
							%>
						</select> <input type="text" name="input" onkeydown="return keyDownEvent(event)"> 
						<input type="button" id="btn" value="검색" onclick="show2();">
					</div>
					</form>
				</article>
			</section>
		</main>
	</div>
</body>
</html>