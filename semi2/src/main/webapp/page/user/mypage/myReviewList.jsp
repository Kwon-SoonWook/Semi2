<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.review.*" %>
<jsp:useBean id="rdao" class="com.ksj.review.ReviewDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트</title>
<style>
@font-face {
  font-family: "Pretendard-Regular";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff")
    format("woff");
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-Medium";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Medium.woff")
    format("woff");
  font-weight: 500;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-SemiBold";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff")
    format("woff");
  font-weight: 600;
  font-style: normal;
}
@font-face {
  font-family: "Pretendard-Bold";
  src: url("https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Bold.woff")
    format("woff");
  font-weight: 700;
  font-style: normal;
}
body, button, a{
	font-family: "Pretendard-Medium", Helvetica;
}
h2{
	text-align: center;
}
/*전체 게시물 목록*/
.photo-grid {
    display: grid;
    gap: 20px;
    margin-top: 20px;
}
.photo-grid a{
    text-decoration: none;
    color: black;
}
/*개별 게시물 레이아웃*/
.photo-card {
    background: white;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
.photo-card a:hover{
    color: gray;
}
.rating label {
	font-size: 30px;
    color: gold;
}
</style>
</head>
<script>
function reviewWrite(reviewid){
	 window.open("/semi2/page/user/review/sallerWriteReview.jsp?review_id="+reviewid, 'popup', 'width=650,height=600,top=100,left=550');
}
</script>
<%
String rid = (String)session.getAttribute("sid");
int reviewCnt = rdao.getReviewCnt(rid);
session.setAttribute("reviewCnt", reviewCnt);
%>
<body>
<section>
<article>
	<h2>리뷰 리스트</h2>
    <%
	ArrayList<ReviewDTO> arr = rdao.ReviewList(rid);
	if(arr==null || arr.size()==0){
	%>
		<h3 align='center'>등록된 글이 없습니다.</h3>
	<%}else{%>
		<div class="photo-grid">
		<%for(int i=0; i<arr.size(); i++){%>
            <div class="photo-card" onclick = "parent.location.href='/semi2/page/user/product/saleProductView.jsp?productsIds=<%=arr.get(i).getProducts_id()%>'">
		        <div class="thumbnail"></div>
				<h3><%=arr.get(i).getUsere_id() %></h3>
				<p><%=arr.get(i).getReview_content() %></p>
				<div class="rating">
					<%for(int j=0; j<arr.get(i).getRate(); j++){ %>
				        <label for="star">★</label>
				    <%} %>
			    </div>
			        <%if(arr.get(i).getReview_div()!=1){ %>
			        	<p><input type="button" value="답변하기" onclick="reviewWrite(<%=arr.get(i).getReview_id() %>);"></p>
            		<%} %>
            </div>
        <% 
		}
	}%>  
    </div>
</article>
</section>

</body>
</html>