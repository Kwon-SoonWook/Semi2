<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="udto" class="com.ksj.user.UserDTO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
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
	padding: 100px;	
	text-align: center;
}
.info {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 50px 20px;
}

.info img,
.info i {
    margin-bottom: 20px;
}

.info form {
    width: 100%;
    max-width: 400px;
    display: flex;
    flex-direction: column;
    gap: 15px;
    align-items: stretch;
    text-align: left;
}

.info form div {
    display: flex;
    flex-direction: column;
}
.info form input[readonly] {
    background-color: #f0f0f0;
    color: #999;
    cursor: not-allowed;
}
.info form input[type="text"],
.info form input[type="password"],
.info form input[type="file"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
}

.info form input:focus {
    outline: none;
    border-color: #7caeff;
}

.info form h2 {
    text-align: center;
    color: #333;
    margin: 10px 0 20px;
}

.info form button {
    padding: 10px;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    background-color: #7caeff;
    color: white;
    transition: background-color 0.3s ease;
}

.info form button:hover {
    background-color: #5a90e8;
}

.info form button[type="button"] {
    background-color: #aaa;
}

.info form button[type="button"]:hover {
    background-color: #888;
}

</style>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<script>
function back(){
	event.preventDefault();
	location.href='mypage.jsp'
}
function check(){
	let input = document.querySelectorAll('form input[type="text"], form input[type="password"]');
	for(let i=1; i<input.length; i++){
		if(input[i].value.trim() === ""){
			alert("공백이 포함되어 있습니다. 다시 수정해주세요.");
			return false;
		}
	}
	return true;  
}
function readURL(input){                                                                                                                        
	if(input.files && input.files[0]){
		let reader = new FileReader();
		reader.onload = function(e){
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}else{
		document.getElementById('preview').src = "";
	}
}
</script>
</head>
<% 
String sid = (String)session.getAttribute("sid");
ArrayList<UserDTO> arr = udao.myinfo(sid);
for(int i=0; i<arr.size(); i++){
	session.setAttribute("spwd", arr.get(i).getPwd());
	session.setAttribute("sname", arr.get(i).getName());
	session.setAttribute("semail", arr.get(i).getEmail());
	session.setAttribute("snickname", arr.get(i).getNickname());
	session.setAttribute("slocation", arr.get(i).getLocation());
}
String sname = (String)session.getAttribute("sname");
String spwd = (String)session.getAttribute("spwd");
String semail = (String)session.getAttribute("semail");
String snickname = (String)session.getAttribute("snickname");
String slocation = (String)session.getAttribute("slocation");
%>
<%@include file="../main/header.jsp" %> 
<body>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
	<main class="main-content">
		<div class="page">
			<div class="info">
			<h2>정보 수정</h2>
			<%if(arr.isEmpty() || arr.get(0).getProfile_uri() == null){ %>
				<i class="fa-solid fa-circle-user" style="color:darkgray; font-size:100px;"></i>
	         <%}else{ %>
	         	<img src="/<%=arr.get(0).getProfile_uri() %>" id="preview" alt="프로필 이미지" width="150" height="150" style=border-radius:50% />
	         <%} %>
         		<form onsubmit="return check();" action="myInfoUpdate_ok.jsp" method="post" enctype="multipart/form-data">	
	         		<br>
	         		<div><input type="file" name="profile" value="프로필 사진 수정" onchange="readURL(this);"></div>
					<div>아이디<input type="text" name="id" value="<%=sid %>" readonly></div>
					<div>비밀번호<input type="password" name="pwd" value="<%=spwd %>"></div>
					<div>이름	<input type="text" name="name" value="<%=sname %>"></div>
					<div>이메일<input type="text" name="email" value="<%=semail %>"></div>
					<div>닉네임<input type="text" name="nickname" value="<%=snickname %>"></div>
					<div>거주 지역(00구)<input type="text" name="location" value="<%=slocation %>"></div>
					<br>
					<button type="submit">제출</button>
					<button type="button" onclick="back();">취소</button> 
				</form>
			</div>
		</div>	          
	</main>   
</div>
</body>
<footer>
<%@include file="../main/footer.jsp" %>
</footer>
</html>