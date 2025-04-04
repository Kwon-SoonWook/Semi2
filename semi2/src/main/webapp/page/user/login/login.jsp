<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노후재활센터 로그인</title>
<style>
/* 기본 스타일 */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: Arial, sans-serif;
}

body {
  background-color: white; /* 넷플릭스의 검정 배경 */
  color: #fff; /* 텍스트는 흰색 */
}

nav {
  position: fixed;
  padding: 20px;
}

nav .logo {
  width: 150px;
}

/* 로그인 박스 스타일 */
.login_border {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  background-color: rgba(0, 0, 0, 0.85); /* 반투명 검정 */
  padding: 40px;
  width: 360px;
  border-radius: 8px;
}

.login_border h2 {
  font-size: 2rem;
  margin-bottom: 20px;
}

.login-text {
  margin-bottom: 20px;
}

.login-text input {
  width: calc(100% - 20px);
  padding: 10px;
  background-color: #333; /* 어두운 배경 */
  border-radius: 4px;
  border: none;
  color: #fff; /* 흰색 텍스트 */
}

.login-text input::placeholder {
  color: #aaa; /* 플레이스홀더 색상 */
}

button,
input[type="submit"],
input[type="button"] {
  width: calc(100% - 20px);
  padding: 10px;
  margin-top: 10px;
  background-color: #808080; /* 넷플릭스 빨간색 */
  border: none;
  border-radius: 4px;
  color: white;
  font-size: 1rem;
}

button:hover,
input[type="submit"]:hover,
input[type="button"]:hover {
  background-color: #666; /* 밝은 빨간색으로 변경 */
}

/* 아이디 기억하기 및 기타 옵션 */
.remember-me {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.remember-me input[type="checkbox"] {
  margin-right: 5px;
}

/* 링크 스타일 */
a {
  color: #b3b3b3;
}

a:hover {
    text-decoration:none;color:white
}

body{
background-image: url("img/snow.gif"), url("img/snow.gif"),url("img/snow.gif"),url("img/cry.gif"),url("img/sup.gif"),url("img/sup.gif"),url("img/cry.gif"),url("img/cry.gif"),url("img/sunglass.gif"),url("img/sunglass.gif");
background-repeat: no-repeat;
background-position: 170px 500px,1100px 50px,1100px 385px,147px 284px, 362px 427px,1344px 477px, 425px 214px,1300px 230px, 1174px 600px, 200px 100px;
}

nav{

position : 100px 100px;

}
</style>

<script>
function show() {
   window.open('findId.jsp', 'idpopup', 'width=500,height=500');
}
function show2() {
   window.open('findPwd.jsp', 'pwdpopup', 'width=500,height=500');
}
</script>

<%
String saveid = "";

Cookie cks[] = request.getCookies();
if (cks != null) {
   for (int i = 0; i < cks.length; i++) {
      if (cks[i].getName().equals("sname")) {
         saveid = cks[i].getValue();
      }
   }
}
%>
</head>

<body>
<nav>
    <a href="../main/index.jsp"><img src="img/icon.png" alt="" class="logo" style =width:30px; height="30px"></a>
</nav>

<div class="login_border">
<h2>로그인</h2>
<form action="login_ok.jsp">
    <div class="login-text">
        <input type="text" name="id" placeholder="Email or phone number" value="<%=saveid%>" required>
    </div>
    <div class="login-text">
        <input type="password" name="pwd" placeholder="Password" required>
    </div>
	<div class="remember-me">
        <label><input type="checkbox" name="saveid" value="on" <%=saveid.equals("") ? "" : "checked"%>>로그인 정보 기억하기</label>
    </div>
    <input type="submit" value="Login">

    <%
    if (session.getAttribute("sid") != null || session.getAttribute("sname") != null) {
        %>
        <input type="button" value="Log Out" onclick="location.href='logout.jsp'">
        <%
    }
    %>
    
</form>

<p style="margin-top:20px; font-size:14px;">아직도 회원가입을 안했다고?<a href="signUp.jsp">죄송합니다</a></p>
<p style="margin-top:20px; font-size:14px;"><a href="show();">아이디를 잊으셨나요?</a></p>
<p style="margin-top:20px; font-size:14px;"><a href="show();">비밀번호를 잊으셨나요?</a></p>


</div>

</body>
</html>