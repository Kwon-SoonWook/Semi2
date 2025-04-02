<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class = "com.ksj.login.loginDAO"></jsp:useBean>
     
    <%
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    
    
    String result = kdao.findPwd(name, id, email);
    session.setAttribute("id", id);
    session.setAttribute("pwd", result);
    if(result =="" || result == null){
    	%>
    	<script>
    	window.alert('정보가 존재하지 않습니다')
    	location.href='findPwd.jsp'
    	</script>
    	<%
    }else{
    	%>
    	<script>
    	location.href='setPwd.jsp?pwd=<%=result%>'
    	</script>
    	<%
    }
    
    
    %>