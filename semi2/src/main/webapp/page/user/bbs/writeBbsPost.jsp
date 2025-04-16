<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script>
<!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
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

.main-content {
    flex: 1;
    padding: 20px;
    margin-left: 50px;
}

/*흰색 페이지*/
.write{
	width: 800px;
	margin: auto;
	height: 650px;
}
.page {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
h2 {
	text-align: center;
	color: #333;
}


table {
	width: 800px;
	border-collapse: collapse;
	text-align: center;
	margin: auto;
}

th {
	padding: 12px;
	vertical-align: top;
	color: #444;
}

.page input[type="text"], textarea, select {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
	resize: vertical;
}

input[type="file"] {
	border: none;
}

.page input[type="submit"], input[type="reset"] {
	background-color: #8c8c8c;
	color: white;
	border: none;
	padding: 5px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
}


input[type="submit"]:hover {
	background-color: #0056b3;
}

.content {
	text-align: center;
	width: 600px;
	height: 150px;
	position: relative;
	left: 0px;
}

</style>

<body>
	<%@include file="/page/user/main/header.jsp"%>
	<div id="container">
		<%@include file="/page/user/main/category.jsp"%>
		<main class="main-content">
			<form action="writeBbsPost_ok.jsp" method="post"enctype="multipart/form-data">
				<div class="page">
					<div class="write">
						<h2>게시판 글쓰기</h2>
						<hr>
						<table>
							<caption style="caption-side: top; height: 50px; vertical-align: center; text-align: right;">
								<select name="select" style="width: 150px; align-content: right;">
									<%
									String sid = (String) session.getAttribute("sid");
									String bbs_div = request.getParameter("bbs_div");
									if (bbs_div == null) {
										bbs_div = "";
									}
									if (sid.equals("admin")) {
										%>
										<option value="notice" selected>공지사항</option>
										<%
									}
									if (bbs_div.equals("1")) {
										%>
										<option value="bbs" selected>자유게시판</option>
										<option value="buy">구매게시판</option>
										<%
									} else if (bbs_div.equals("2")) {
										%>
										<option value="bbs">자유게시판</option>
										<option value="buy" selected>구매게시판</option>
										<%
									} else {
										%>
										<option value="bbs">자유게시판</option>
										<option value="buy">구매게시판</option>
										<%
									}
									%>
								</select>
							</caption>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" style="width: 650px;"></td>
							</tr>
							<tr>
								<th>본문</th>
								<td class="content"><textarea name="content" cols="91"
										rows="20"></textarea></td>
							</tr>
							<tr>
								<th>사진파일</th>
								<td style="text-align: left;"><input type="file" name="file"></td>
							</tr>
							<input type="hidden" name="bbs_div" value="<%=bbs_div %>">
							<caption style="caption-side: bottom; height: 50px; text-align: center;">
								<input type="submit" value="작성하기">
								<input type="reset" value="다시작성">
							</caption>
						</table>
					</div>
				</div>
			</form>
		</main>
	</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>