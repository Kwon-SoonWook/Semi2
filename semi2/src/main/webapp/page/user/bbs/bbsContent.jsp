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
    max-height: none; /* 높이 제한 제거 */
    overflow: visible; /* 스크롤 제거 */
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

footer {
    margin-top: auto; /* 컨텐츠 다음에 배치 */
    position: relative; /* 절대 위치에서 상대 위치로 변경 */
    clear: both; /* float 요소 해제 */
}
.container {
    position: relative;
    min-height: 100vh; /* 최소 높이를 뷰포트 높이로 설정 */
    display: flex;
    flex-direction: column;
}
.main-content {
    padding-bottom: 50px; /* footer와의 간격 확보 */
    min-height: 500px; /* 최소 높이 설정 */
    overflow: visible; /* 내용이 넘쳐도 보이게 설정 */
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
int id = Integer.parseInt(request.getParameter("id"));
String nickname = (String)session.getAttribute("nickname");
ArrayList<BbsDTO> arr = kdao.showContent(id);
kdao.viewCnt(id);
%>
<body>
	<div class="container">
		<%@include file="/page/user/main/category.jsp"%>
		<main class="main-content">
			<section>
				<article class="bbs-article">
					<h1><%=arr.get(0).getTitle()%></h1>
					<hr>
					<div class="bbs-meta">
						<span>작성자: <%=arr.get(0).getBbs_id()%></span> | <span>작성일자:
							<%=arr.get(0).getCreate_date()%></span>
					</div>
					<div class="bbs-body">
						<p><%=arr.get(0).getContent()%></p>
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
					<form action="bbsComment_ok.jsp" class="comment-form">
						댓글 입력 <input type="text" name="comm"> <input type="hidden"
							name="idx" value="<%=arr.get(0).getBbs_idx()%>"> <input
							type="submit" value="등록">
					</form>

					<div class="comment-list">
						<div>댓글</div>
						<%
						ArrayList<CommentDTO> cmtarr = kdao.showCmt(arr.get(0).getBbs_idx());
						for (int i = 0; i < cmtarr.size(); i++) {
							if (cmtarr.size() > 0) {
								boolean isReply = cmtarr.get(i).getLev() > 0; // 답글 여부 확인 (DTO에 depth 필드가 있다고 가정)
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
							
							<!-- 대댓글 입력 폼 -->
							<div id="reply-form-<%=commentId%>" class="reply-form">
								<form action="bbsReplyComment_ok.jsp">
									대댓글 입력 <input type="text" name="reply">
									<input type="hidden" name="idx" value="<%=arr.get(0).getBbs_idx()%>">
									<input type="hidden" name="parent_id" value="<%=commentId%>">
									<input type="submit" value="등록">
								</form> 
							</div>
						</div>
						<%
							}
						}
						%>
					</div>
				</article>
			</section>
		</main>
		
	</div>
</body>
<footer>
			<%@include file="/page/user/main/footer.jsp"%>
</footer>
</html>
