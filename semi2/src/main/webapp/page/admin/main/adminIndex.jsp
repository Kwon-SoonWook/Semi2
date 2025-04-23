<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="com.ksj.content.BbsDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.content.ProductDAO"></jsp:useBean>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<jsp:useBean id="vdao" class="com.ksj.visitor.VisitCountDAO"></jsp:useBean>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
    <link rel='stylesheet' type='text/css' href='/semi2/page/admin/adminLayout.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<%@include file="adminHeader.jsp" %>
    <div class="container">
	    <!-- 사이드바 -->
	    <%@include file="adminCategory.jsp" %>
	
	    <%
	    int totalCount = vdao.getVisitTotalCount();
	    int todayCount = vdao.getVisitDateCount(0);
	    int todayBbs = bdao.getTodayBbs();
	    int todayProduct = pdao.getTodayProduct();
	    int todayAsk = adao.getTodayAsk();
	    int todayJoinUser = udao.getTodayJoinUser();
	    
	    %>
	
	    <!-- 대시보드 내용 -->
	    <div class="content">
	        <br>
	        <br>
	        <!-- 카드 그룹 -->
	        <div class="cards">
	            <!-- 오늘 방문자 카드 -->
	            <div class="card">
	            	<a href="../visitor/visitorInfo.jsp" style="color: black; text-decoration: none;">
	                <div class="card-icon">
	                    <i class="fas fa-calendar-day"></i>
	                </div>
	                <div class="card-info">
	                    <h3>오늘 방문자</h3>
	                    <p><%=  todayCount%>명</p>
	                </div>
	                </a>
	            </div>
	            <!-- 최근 문의 카드 -->
	            <div class="card">
	            	<a href="../ask/askList.jsp" style="color: black; text-decoration: none;">
	                <div class="card-icon">
	                    <i class="fas fa-headset"></i>
	                </div>
	                <div class="card-info">
	                    <h3>최근 문의</h3>
	                    <p><%=todayAsk %>개</p>
	                </div>
	                </a>
	            </div>
	        </div>
	        <br>
			<div class="cards">
				<!-- 신규 가입자 카드 -->
	            <div class="card">
	           		<a href="../user/userManagement.jsp" style="color: black; text-decoration: none;">
	                <div class="card-icon">
	                    <i class="fas fa-user-plus"></i>
	                </div>
	                <div class="card-info">
	                    <h3>신규 가입자</h3>
	                    <p><%=todayJoinUser %>명</p>
	                </div>
	                </a>
	            </div>
	            <!-- 최근 게시물 카드 -->
	            <div class="card">
	            	<a href="../post/contentList.jsp" style="color: black; text-decoration: none;">
	                <div class="card-icon">
	                    <i class="fas fa-pencil-alt"></i>
	                </div>
	                <div class="card-info">
	                    <h3>최근 게시물</h3>
	                    <p><%=todayBbs+todayProduct %>개</p>
	                </div>
	                </a>
	            </div>
			</div>
	    </div>
	</div>
</body>
</html>