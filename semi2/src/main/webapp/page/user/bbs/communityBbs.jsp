<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.ksj.content.*" %>
<jsp:useBean id="bdao" class="com.ksj.content.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="cdao" class="com.ksj.bbs.CommentDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>자유게시판</title>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #EBEDE0;
    color: #EBEDE0;
}
.container {
    min-height: 100vh;   /*스크린 화면 전체를 가득 채움*/
    white-space: nowrap; /*띄어쓰기 방지*/
}
/*noticeBbs main 페이지*/
.main-content {
    flex: 1;
    padding: 20px;
    margin-left: 50px;
}
/*흰색 페이지*/
.page {
	margin: auto;
	width: 1100px;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
/* 제목 */
h2 {
    text-align: center;
    font-size: 28px;
    margin-bottom: 30px;
    color: #222;
}

/* 테이블 스타일 */
table {
    width: 100%;
    max-width: 900px;
    margin: 0 auto;
    border-collapse: collapse;
    border-top: 3px double #393E46;
    border-bottom: 3px double #393E46;
    background-color: #fafafa;
}

/* 테이블 헤더 */
table th {
    background-color: #ddd;
    padding: 12px 8px;
    text-align: center;
    font-weight: bold;
    color: #333;
}

/* 테이블 데이터 셀 (추가적으로 필요 시 적용) */
table td {
    padding: 12px 10px;
}

.page input[type="text"], select {
   padding: 5px;
   border: 1px solid #ccc;
   border-radius: 4px;
   font-size: 14px;
   resize: vertical;
}


input[type="submit"], input[type="button"] {
	background-color: #6E8233;
	color: white;
	border: none;
	padding: 5px 20px;
	font-size: 14px;
	border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 5px;
}

input[type="submit"]:hover, input[type="button"]:hover {
    background: #f5f5f5;
    color: #000;
    border-color: #bbb;
}
.sort-box {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-bottom: 10px;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
}
.sort-box select {
    padding: 5px 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    background: #fafafa;
}
.comment-count {
    font-size: 0.95em;
    color: #888;
    margin-left: 6px;
    vertical-align: middle;
}
</style>
<% 
String sid = (String)session.getAttribute("sid");
if(sid==null){
   sid="";
}
request.setCharacterEncoding("UTF-8");
String input = request.getParameter("input");
if(input==null){
   input="";
}

String select = request.getParameter("select");
if(select==null || select.equals("")){
   select="title";
}
String sort = request.getParameter("sort");
ArrayList<BbsDTO> arr = bdao.userBbsList(select, input, 1,sort);
int totalCnt = 0;
if(arr==null || arr.size()==0){
   totalCnt = 0;
}else{
   totalCnt = arr.size();
}
//보여줄 리스트 수
int listSize = 10;

//보여줄 페이지 수
int pageSize = 5;

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
   cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//총 페이지 수
int totalPage = (totalCnt / listSize) + 1;
if (totalCnt % listSize == 0)
   totalPage--;

int userGroup = cp / pageSize;
if (cp % pageSize == 0) userGroup--;

%>
<body>
<%@include file="/page/user/main/header.jsp" %>
<div id="container">
    <%@include file="/page/user/main/category.jsp" %>
   <main class="main-content">
      <form name="communityFind" method="get" action="communityBbs.jsp">
      <div class="page">
         <h2>자유게시판</h2>
         <div class="sort-box">
    <label for="sort" style="margin-right:6px; font-size:15px; color:#666;">정렬</label>
    <select id="sort" name="sort" onchange="this.form.submit()">
        <option value="recent" <%= "recent".equals(request.getParameter("sort")) ? "selected" : "" %>>최신순</option>
        <option value="recommend" <%= "recommend".equals(request.getParameter("sort")) ? "selected" : "" %>>추천순</option>
        <option value="view" <%= "view".equals(request.getParameter("sort")) ? "selected" : "" %>>조회순</option>
    </select>
</div>
         <table>
            <thead>
               <tr>
                  <th style="width: 50px; text-align: center;">No</th>
                  <th>제목</th>
                  <th style="width: 100px; text-align: center;">작성자</th>
                  <th style="width: 110px; text-align: center;">작성일</th>
                  <th style="width: 70px; text-align: center;">조회수</th>
                  <th style="width: 70px; text-align: center;">추천수</th>
               </tr>
            </thead>
            <tbody>
               <%
               if (arr == null || arr.size() == 0) {
               %>
               <tr>
                  <td colspan='5' align='center'>등록된 게시글이 없습니다.</td>
               </tr>
               <%
               } else {
               for (int i = ((cp - 1) * listSize); i < ((cp - 1) * listSize) + listSize; i++) {
               %>
               <tr>
                  <td style="text-align: center;"><%=arr.get(i).getBbs_idx()%></td>
                  <td>
  					<a href="bbsContent.jsp?id=<%=arr.get(i).getBbs_idx()%>&cp=<%=cp %>"><%=arr.get(i).getTitle()%></a>
 				    <span class="comment-count">[<%=cdao.commentTotal(arr.get(i).getBbs_idx()) %>]</span>
				  </td>
                  <td style="text-align: center;"><%=arr.get(i).getBbs_id()%></td>
                  <td style="text-align: center;"><%=arr.get(i).getCreate_date()%></td>
                  <td style="text-align: center;"><%=arr.get(i).getView_cnt()%></td>
                  <td style="text-align: center;"><%=arr.get(i).getRecommend_like()%></td>
               <tr>
                  <%
                     if (i == totalCnt - 1)
                        break;
                     }
                  }
                  %>
               
            </tbody>
            <tfoot>
               <tr>
                  <td colspan='5' align='center' style="padding: 5px 5px;">
                     <%
                     if(arr==null || arr.size()==0){
                        %>&nbsp;&nbsp;<a
                        href="communityBbs.jsp?cp=1&input=<%=input%>&select=<%=select%>&sort=<%=sort %>"
                        style="color: black; text-decoration: underline;">1</a>&nbsp;&nbsp;<%   
                     }else{
                        if (userGroup != 0) {
                           %> <a
                           href="communityBbs.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>&input=<%=input%>&select=<%=select%>&sort=<%=sort %>"
                           style="color: black; font-size: 10px; text-decoration: none">&lt;</a>
                           <%
                        }
                        for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
                           if (cp == i) {
                              %>&nbsp;&nbsp;<a
                              href="communityBbs.jsp?cp=<%=i%>&input=<%=input%>&select=<%=select%>&sort=<%=sort %>"
                              style="color: black; text-decoration: underline;"><%=i%></a>&nbsp;&nbsp;<%
                           } else {
                              %>&nbsp;&nbsp;<a
                              href="communityBbs.jsp?cp=<%=i%>&input=<%=input%>&select=<%=select%>&sort=<%=sort %>"
                              style="color: black; text-decoration: none;"><%=i%></a>&nbsp;&nbsp;<%
                           }
                           if (i == totalPage) {
                              break;
                           }
                        }
                        if (((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) != userGroup) {
                           %> <a
                           href="communityBbs.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>&input=<%=input%>&select=<%=select%>&sort=<%=sort %>"
                           style="color: black; font-size: 10px; text-decoration: none">&gt;</a>
                           <%
                        }   
                     }
                     %>
                  </td>
               </tr>
            </tfoot>
            <%
            if(sid.equals("")){
               %>
               <caption style="caption-side:bottom; height:30px; vertical-align: center; text-align: right;">
               </caption>   
               <%
            }else{
               %>
               <caption style="caption-side:bottom; height:30px; vertical-align: center; text-align: right;">
                  <input type="button" value="글쓰기" onclick="location.href='writeBbsPost.jsp?bbs_div=1'">
               </caption>   
               <%
            }
            %>   
            <caption style="caption-side:bottom; height: 50px; vertical-align: center;">
                  <select id="select" name="select">
                     <%
                     if(select.equals("title")){
                        %>
                        <option value="title" selected="selected">제목</option>
                        <option value="writer">작성자</option>
                        <%
                     }else if(select.equals("writer")){
                        %>
                        <option value="title">제목</option>
                        <option value="writer" selected="selected">작성자</option>
                        <%
                     }
                     %>
                  </select>
               <input type="text" name="input">
               <input type="submit" value="검색">
            </caption>
         </table>     
      </div>
      </form>             
   </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>