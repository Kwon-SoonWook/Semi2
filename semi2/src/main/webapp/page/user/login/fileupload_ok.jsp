<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    String savepath = request.getRealPath("/page/user/login/profile");
    
    MultipartRequest mr =
    new MultipartRequest(request,savepath,1024*1024*30,"utf-8",new DefaultFileRenamePolicy());
    
    %>
    
    <script>
    window.opener.document.getElementById("profile").value = "<%= mr.getOriginalFileName("profile")%>";
    window.close();
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    