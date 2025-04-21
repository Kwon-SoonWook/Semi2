<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.content.BbsDAO"></jsp:useBean>
    <%
    
    String idx = request.getParameter("id");
    String cp = request.getParameter("cp");
    int result = kdao.likeRecommend(idx);
    
    String msg = result>0?"추천하셨습니다.":"이미 추천하셨습니다.";
    
    
    %>
    <script>
    window.alert('<%=msg%>');
    location.href = "bbsContent.jsp?id=<%=idx%>&cp=<%=cp%>"
    
    </script>