<%@page import="com.ksj.bbs.CommentDTO"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:useBean id="kdao" class="com.ksj.bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="cdao" class="com.ksj.bbs.CommentDAO"></jsp:useBean>
<!DOCTYPE html>

<style>
/* 기존 스타일 유지 */
.bbs-article h1 {
   font-size: 24px;
   margin-bottom: 10px;
}

.bbs-meta {
   font-size: 14px;
   color: #666;
}

.bbs-body p {
   margin-top: 20px;
}

.bbs-image img {
   display: block;
   margin-top: 20px;
}

article {
   position: relative;
   left: 30px;
}
.main-content {
    margin-left: 320px; /* 사이드바 너비(200px) + 여유(20px) */
    margin-right: 320px; /* 필요시 오른쪽도 여백 */
    /* 기존 스타일이 있다면 여기에 추가로 작성 */
}

@media (max-width: 900px) {
    .main-content {
        margin-left: 0;
        margin-right: 0;
        padding: 0 10px;
    }
}

/* 댓글 입력 폼 스타일 */
.comment-form {
   margin-top: 20px;
   padding: 0;
   background-color: transparent;
}

.comment-form input[type="text"] {
   width: 300px;
   padding: 10px;
   border: 1px solid #ddd;
   border-radius: 4px;
   font-size: 14px;
}

.comment-form input[type="submit"] {
   padding: 10px 20px;
   background-color: #007bff;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   font-size: 14px;
}

.comment-form input[type="submit"]:hover {
   background-color: #0056b3;
}

/* 댓글 리스트 스타일 */
.comment-list {
    margin-top: 20px;
    margin-bottom: 30px; /* 하단 여백 추가 */
    border-top: 1px solid #ddd;
    font-family: 'Malgun Gothic', sans-serif;
}

.comment-list>div:first-child {
   padding: 10px 0;
   font-weight: bold;
   border-bottom: 1px solid #ddd;
}

.comment-item {
   padding: 10px 0;
   border-bottom: 1px solid #ddd;
   position: relative;
}

.comment-item .nickname {
   font-weight: bold;
   margin-right: 5px;
}

.comment-item .content {
   display: block;
   margin-top: 5px;
   line-height: 1.5;
   cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능함을 표시 */
}

.comment-item .date {
   position: absolute;
   right: 30px;
   top: 10px;
   font-size: 12px;
   color: #888;
}

.comment-item .delete {
   position: absolute;
   right: 40px;
   top: 30px; /* 날짜 아래로 위치 변경 */
   font-size: 12px;
   color: #888;
   text-decoration: none;
}

.comment-item.reply {
   padding-left: 30px;
   background-color: #f8f8f8;
}

.comment-item.reply:before {
   content: "↳";
   position: absolute;
   left: 10px;
   color: #888;
}

.comment-item.reply:before {
   content: "↳";
   position: absolute;
   left: 20px;
   color: #888;
}

/* 대댓글 입력 폼 스타일 */
.reply-form {
    display: none; /* 기본적으로 숨김 */
    margin: 10px 0 10px 30px;
    padding: 10px;
    background-color: #f8f8f8;
    border-radius: 4px;
}

.reply-form input[type="text"] {
    width: 300px;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

.reply-form input[type="submit"] {
    padding: 8px 15px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

/* 전체 컨테이너 설정 */
.container {
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* 최소 높이를 화면 전체로 설정 */
}

.bbs-btn-group {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-bottom: 10px;
}

.bbs-btn {
    font-family: "Pretendard-SemiBold", Helvetica, Arial, sans-serif;
    background: #6d8132;
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 9px 20px;
    font-size: 1rem;
    cursor: pointer;
    transition: background 0.18s, color 0.18s, border 0.18s;
}
.bbs-btn:hover {
    background: #fff;
    color: #6d8132;
    border: 1.5px solid #6d8132;
}
.vote-box {
    display: flex;
    gap: 18px;
    justify-content: center;
    align-items: center;
    margin: 18px 0 10px 0;
}

.vote-btn {
    display: flex;
    align-items: center;
    gap: 7px;
    background: #f8f8f8;
    border: 1.5px solid #6d8132;
    color: #6d8132;
    border-radius: 8px;
    font-family: "Pretendard-SemiBold", Helvetica, Arial, sans-serif;
    font-size: 1.02rem;
    padding: 8px 18px;
    cursor: pointer;
    transition: background 0.18s, color 0.18s, border 0.18s;
    outline: none;
}
.vote-btn.up:hover {
    background: #6d8132;
    color: #fff;
}
.vote-btn.down {
    border: 1.5px solid #b33a3a;
    color: #b33a3a;
}
.vote-btn.down:hover {
    background: #b33a3a;
    color: #fff;
}
.vote-btn i {
    font-size: 1.15em;
}
.vote-count {
    font-family: "Pretendard-SemiBold";
    font-size: 1.03em;
    margin-left: 4px;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<link rel="stylesheet" type="text/css" href="../main/mainLayout.css">
<script src="https://kit.fontawesome.com/f0cba69f8f.js"
   crossorigin="anonymous"></script>
<!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
<script>
// 대댓글 폼을 토글하는 함수
function toggleReplyForm(commentId) {
    var replyForm = document.getElementById('reply-form-' + commentId);
    if (replyForm.style.display === 'none' || replyForm.style.display === '') {
        replyForm.style.display = 'block';
    } else {
        replyForm.style.display = 'none';
    }
}
</script>
</head>
<%@include file="/page/user/main/header.jsp"%>
<title>Insert title here</title>
<%
String userid = (String)session.getAttribute("sid");
if(userid==null){
	userid = "";
}

int id = Integer.parseInt(request.getParameter("id"));
String nickname = (String)session.getAttribute("nickname");
String cp = (String)(request.getParameter("cp"));
ArrayList<BbsDTO> arr = kdao.showContent(id);
kdao.viewCnt(id);
%>
<body>
   	<div class="container">
		<%@include file="/page/user/main/category.jsp"%>
		<main class="main-content">
					<h1><%=arr.get(0).getTitle()%></h1>
<div class="bbs-btn-group">
 <%
    int bbsDiv = arr.get(0).getBbs_div(); // 게시글의 bbs_div 값
    String listUrl = "";
    if (bbsDiv == 0) {
        listUrl = "noticeBbs.jsp";
    } else if (bbsDiv == 1) {
        listUrl = "communityBbs.jsp";
    } else if (bbsDiv == 2) {
        listUrl = "buyBbs.jsp";
    }
    // 페이지네이션(cp) 파라미터가 있으면 붙여줌
    String cpParam = (cp != null && !cp.equals("")) ? "?cp=" + cp : "";
%>
    <button type="button" class="bbs-btn" onclick="location.href='<%=listUrl + cpParam%>'">목록으로</button>
    <%
    if(userid.equals(arr.get(0).getBbs_id())){
    %>
        <button type="button" class="bbs-btn" onclick="location.href='bbsdelete_ok.jsp?id=<%=arr.get(0).getBbs_idx()%>'">삭제하기</button>
        <button type="button" class="bbs-btn" onclick="location.href='bbschange.jsp?id=<%=arr.get(0).getBbs_idx()%>&div=<%=arr.get(0).getBbs_div()%>'">수정하기</button>
    <%
    }
    %>
</div>
					<hr>
					<div class="bbs-meta">
						<span>작성자: <%=arr.get(0).getBbs_id()%></span> | <span>작성일자:
							<%=arr.get(0).getCreate_date()%></span> | <span>조회수: <%=arr.get(0).getView_cnt() %></span>
					</div>
					
					<div class="bbs-body">
						<p><%=arr.get(0).getContent().replaceAll("\n", "<br>")%></p>
						<%
						if (arr.get(0).getBbs_image() != null) {
						%>
						<div class="bbs-image">
							<img src="img/<%=arr.get(0).getBbs_image()%>"
								alt="<%=arr.get(0).getTitle()%>" width="300">
						</div>
						<%
						}
						%>
					</div>
					
<%if(arr.get(0).getBbs_div()!=0){ %>
<div class="vote-box">
    <form action="recommend_ok.jsp?id=<%=id %>&cp=<%=cp %>" method="post" style="display:inline;">
        <input type="hidden" name="bbs_idx" value="<%=arr.get(0).getBbs_idx()%>">
        <button type="submit" class="vote-btn up">
            <i class="fa-solid fa-thumbs-up"></i>
            <span>추천</span>
            <span class="vote-count"><%=arr.get(0).getRecommend_like() %></span>
        </button>
    </form>
    <form action="dislike_ok.jsp?id=<%=id %>&cp=<%=cp %>" method="post" style="display:inline;">
        <input type="hidden" name="bbs_idx" value="<%=arr.get(0).getBbs_idx()%>">
        <button type="submit" class="vote-btn down">
            <i class="fa-solid fa-thumbs-down"></i>
            <span>비추천</span>
            <span class="vote-count"><%=arr.get(0).getRecommend_dislike() %></span>
        </button>
    </form>
</div>
<%} %>					

					<div class="comment-list">
						<div>댓글</div>
						<%
						ArrayList<CommentDTO> cmtarr = kdao.showCmt(arr.get(0).getBbs_idx());
						for (int i = 0; i < cmtarr.size(); i++) {
							if (cmtarr.size() > 0) {
								boolean isReply = cmtarr.get(i).getLev()==0?false:true; // 답글 여부 확인 (DTO에 depth 필드가 있다고 가정)
								int commentId = cmtarr.get(i).getBbs_comment_idx(); // 댓글 ID 가져오기
						%>
						
						<div class="comment-item <%=isReply ? "reply" : ""%>">
							<span class="nickname"><%=cmtarr.get(i).getNickname()%></span> 
							<span class="date"><%=cmtarr.get(i).getUpload_date()%></span>
							<%
							if(nickname.equals(cmtarr.get(i).getNickname())){
							%> 
							<a href="deletecomment_ok.jsp?id=<%=cmtarr.get(i).getBbs_comment_idx() %>&nickname=<%=cmtarr.get(i).getNickname() %>&bbsid=<%=id  %>" class="delete">✕</a>
							<%} %> 
							<span class="content" onclick="toggleReplyForm(<%=commentId%>)"><%=cmtarr.get(i).getComment_content()%></span>
							
							<% if(cmtarr.get(i).getLev() == 0) { %>
<!-- 대댓글 입력 폼 -->
					<div id="reply-form-<%=commentId%>" class="reply-form">
   					 <form action="bbsReplyComment_ok.jsp">
      			 			 대댓글 입력 <input type="text" name="comment_content">
    					    <input type="hidden" name="bbs_idx" value="<%=cmtarr.get(i).getBbs_idx()%>">
   					     	<input type="hidden" name="bbs_comment_idx" value="<%=commentId%>">
  					      	<input type="hidden" name="nickname" value="<%=nickname%>">
   					    	<input type="hidden" name="ref" value="<%=cmtarr.get(i).getRef()%>">
        					<input type="hidden" name="lev" value="<%=cmtarr.get(i).getLev()%>">
       					 	<input type="hidden" name="sunbun" value="<%=cmtarr.get(i).getSunbun()%>">
       					 	<input type="submit" value="등록">
    					</form> 
				</div>
<% } %>
						</div>
						<%
							}
						}
						%>
						<form action="bbsComment_ok.jsp" class="comment-form">
						댓글 입력 <input type="text" name="comm"> <input type="hidden" name="idx" value="<%=arr.get(0).getBbs_idx()%>"> 
							<input type="submit" value="등록">
					</form>
					</div>
		</main>
		
	</div>
	<footer>
			<%@include file="/page/user/main/footer.jsp"%>
</footer>
</body>

</html>
