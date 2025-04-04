<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.login_border{
 position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  background-color: rgba(0,0,0,0.105);
  padding: 40px;
  border-radius: 8px;
}

.login-text{
 position: relative;
  margin-bottom: 20px;
}

.login-text input{

  width: calc(100% - 40px);
  padding: 10px;
  background-color: rgba(0,0,0,0.105);
  border-radius: 4px;
  border: none;
}
.remember-me{
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 10px;
}

.remember-me input {
  margin-right: 5px;
}

body{

}
</style>
<script>
function show(){
   window.open('findId.jsp','idpopup','width = 500 height = 500')
   
}
function show2(){
   window.open('findPwd.jsp','pwdpopup','width = 500 height = 500')
   
}
</script>
<title>Insert title here</title>
<%
String saveid = "";

Cookie cks[] = request.getCookies();
if(cks!=null){
   for(int i = 0; i < cks.length; i++){
      if(cks[i].getName().equals("sname")){
         saveid = cks[i].getValue();
      }
   }
   
   
}

%>
</head>
<img alt="" src="maple_monkey.png">
<body>
<nav>
    <a href="../main/index.jsp"><img src="img/icon.png" alt="Netflix Logo" class="logo" width= "30" height="30" ></a>
  </nav>	
<div class = "login_border">
<h2>로 그 인 </h2>
<form action = "login_ok.jsp">
<div class = "login-text">
아이디  
<input type = "text" name = "id" value = "<%=saveid%>" required>
</div>
<div class = "login-text">
비밀번호  
<input type = "password" name = "pwd" required>
</div>
<input type ="submit" value = "로그인">
<input type ="button" value = "회원가입" onclick="location.href='signUp.jsp'">
<input type ="button" value = "아이디찾기" onclick="show();">
<input type ="button" value = "비밀번호찾기" onclick="show2();">
<%
if(session.getAttribute("sid")!=null||session.getAttribute("sname")!=null){
   %>
   <input type = "button" value = "로그아웃" onclick = "location.href='logout.jsp'">
   <%
}



%>
<div class = "remember-me"><input type = "checkbox" name = "saveid" value = "on" <%=saveid.equals("")?"":"checked" %>>아이디 기억하기</div>
</form>
</body>
</div>
</html>