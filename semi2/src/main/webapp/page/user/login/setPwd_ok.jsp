<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class = "com.ksj.login.loginDAO" scope = "session"></jsp:useBean>
    <%
    String pwd = request.getParameter("pwd");
    String check_pwd = request.getParameter("check_pwd");
    String id = (String)session.getAttribute("id");
    String originpwd = (String)session.getAttribute("pwd");
   
    if(originpwd.equals(pwd)){
    	%>
    	<script>
    	window.alert('현재 사용중인 비밀번호입니다.');
    	location.href='setPwd.jsp?pwd=<%=pwd%>';
    	</script>
    	<%
    }
    if(pwd.equals(check_pwd)){
    	if(pwd==null||pwd==""){
    		%>
        	<script>
        	window.alert('사용할 수 없는 문자입니다.');
        	location.href='setPwd.jsp?pwd=<%=pwd%>';
        	</script>
        	<%
    	}else{
    	int count = kdao.setPwd(pwd,id);
    	String msg = count>0?"비밀번호 변경 성공!":"비밀번호 변경 실패..";
    	
    	
    	%>
    	<script>
    	window.alert('<%=msg%>');
    	window.close();
    	</script>
    	<%
    	}
    }else{
    	%>
    	<script>
    	window.alert('비밀번호 확인이 일치하지 않습니다.');
    	location.href='setPwd.jsp?pwd=<%=pwd%>';
    	</script>
    	<%
    }
    
    %> 