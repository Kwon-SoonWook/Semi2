<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
div[name="pg"]{
	text-align: center;
}
div[name="write"]{
	text-align: right;
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
				<h2>문의함 페이지</h2>
				<form name='enquiryList' action='enquiryList_ok.jsp'>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>처리상태</th>
							</tr>
						</thead>
					</table>
				</form>
				</article>
			</section>            
        </main>    
    </div>
</body>

</body>
</html>