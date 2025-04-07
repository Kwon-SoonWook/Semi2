<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<style>
.content{
text-align:center;
width : 600px;
height : 150px;
position : relative;
left:0px;
}
h2{
text-align: center;
}
table td{
text-align: center;

}
</style>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<%String indexid = (String)session.getAttribute("sid"); %>
</head>
<%@include file="/page/user/main/header.jsp" %> 
<title>Insert title here</title>
<body>
<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">
<h2>글 쓰 기</h2>
<hr>
<form action = "writeBbsPost_ok.jsp">
<table>
<tr>
<td width = 190px;><label>제목  </label></td>
<td><input type="text" name = "title" style=width:880px;></td>
</tr>
<tr>
<td>본문 </td>
<td class = "content"> <textarea name = "content" cols="120" rows="20"></textarea></td>
</tr>
<tr>
<td>사진파일 </td>
<td class = "content"> <input type = "file" name = "file"></td>
</tr>

</table>  

<input type = "submit" value="등록">
</form>
    </main>   
</div>

</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>