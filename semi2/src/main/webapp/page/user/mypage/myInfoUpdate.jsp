<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>정보 수정</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
}
.container {
    min-height: 100vh;	/*스크린 화면 전체를 가득 채움*/
    white-space: nowrap; /*띄어쓰기 방지*/
}
/*mypage main 페이지*/
.main-content {
    flex: 1;
    padding: 20px;
    margin-left: 50px;
}

/*흰색 페이지*/
.page {
    background: white;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
/*사용자 정보*/
.info{
	padding: 50px;	
}
</style>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<%@include file="../main/header.jsp" %> 
<body>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
	<main class="main-content">
		<div class="page">
			<div class="info">
	      		<i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 100px;"></i>
	         	<div class="txt-wrap">
	         		<form action = "signUp_ok.jsp">
		         		<h2>정보 수정</h2>
						<div>아이디 : 
							<input type = "text" name = "id" id = "id" readonly>
						</div>
						<div>비밀번호 : 
							<input type = "password" name = "pwd">
						</div>
						<div>이름 : 
							<input type = "text" name = "name" readonly>
						</div>
						<div>이메일 : 
							<input type = "text" name = "email" readonly>
						</div>
						<div>닉네임 : 
							<input type = "text" name = "nickname">
						</div>
						<div>거주 지역(00구) : 
							<input type = "text" name = "location">
						</div>
						<div> 
							<input type = "button" value = "프로필 사진 등록" onclick='popup2()'>
						</div>
							<input type="hidden" name = "profile_uri" id = "profile"> 
							<button type="button" onclick="location.href='mypage.jsp'">수정</button>     	
					</form>
	         	</div>
			</div>
		</div>	          
	</main>   
</div>
</body>
<footer>
<%@include file="../main/footer.jsp" %>
</footer>
</html>