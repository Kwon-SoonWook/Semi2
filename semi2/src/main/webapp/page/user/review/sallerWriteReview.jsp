<%@page import="com.ksj.review.ReviewDTO"%>
<%@page import="com.ksj.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="com.ksj.review.ReviewDAO" scope="session"></jsp:useBean>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
if (sid == null) {
	%>
	<script>
	window.alert('로그인 후 이용해주세요~');
    window.self.close();
	</script>
	<%
    return;
}
String review_id = request.getParameter("review_id");
ReviewDTO rdto = rdao.reviewlist(review_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.rating {
    display: flex;
    flex-direction: row-reverse;
    justify-content: left;
}

.rating input {
    display: none; /* 라디오 버튼 숨기기 */
}

.rating label {
    font-size: 30px;
    color: gray;
    cursor: pointer;
}

.rating input:checked ~ label {
    color: gold; /* 선택한 별과 이전 별들을 금색으로 변경 */
}
.rating label:hover,
.rating label:hover ~ label {
    color: gold; /* 마우스를 올렸을 때 별이 금색으로 변함 */
}
textarea {
    width: 70%;
    padding: 10px;
    border-radius: 8px;
    border: 1px solid #ddd;
    font-size: 14px;
    color: #333;
    resize: vertical;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
}
html, body {
    width: 650px;
    height: 600px;
    background-color: #EBEDE0;
    display: flex;
    align-items: center;
    justify-content: center;
}
form {
    background-color: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    max-width: 400px;
}
input[type="submit"] {
    background-color: #6E8233;
    color: white;
    padding: 10px 25px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background: #f5f5f5;
    color: #000;
    border-color: #bbb;
}
input[type="reset"] {
    background-color: #6E8233;
    color: white;
    padding: 10px 25px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="reset"]:hover {
    background: #f5f5f5;
    color: #000;
    border-color: #bbb;
}
</style>
<script>
window.onunload=function(){	
}
function check(){
	  var user_id = document.writeReview.user_id.value;
	  if(user_id==null||user_id==""){
	        alert("거래자를 선택해주세요!");
	        return false;		  
	  }
		var review_content = document.writeReview.review_content.value;
		  if(review_content==null||review_content==""){
		        alert("평점을 선택해주세요!");
		        return false;		  
		  }
	  var rate = document.querySelector('input[name="rate"]:checked'); // 선택된 라디오 버튼 가져오기
	    if (!rate) {
	        alert("카테고리를 선택해주세요!");
	        return false;
	    }
}
</script>
</head>
<body>
	<section>
		<article>
			<form name ="writeReview" action="writeReview_ok.jsp">
			<input type="hidden" name=products_id value=<%=rdto.getProducts_id() %>>
			<input type="hidden" name=review_div value=1>
			<input type="hidden" name=review_id value=<%=request.getParameter("review_id") %>>
				<h2>거래자 선택</h2>
				<select name="user_id">
				<option value="<%=rdto.getUsere_id()%>"><%=udao.myinfo(rdto.getUsere_id()).get(0).getNickname()%></option> 
				</select>				
				<h2>거래후기</h2>
				<textarea placeholder="댓글을 작성해주세요" rows="8" cols="45" name="review_content"></textarea>
				<h2>평점</h2>
				<div class="rating">
				<input type="radio" name="rate" id="star5" value="5"><label for="star5">★</label>
				<input type="radio" name="rate" id="star4" value="4"><label for="star4">★</label>
				<input type="radio" name="rate" id="star3" value="3"><label for="star3">★</label>
				<input type="radio" name="rate" id="star2" value="2"><label for="star2">★</label>
				<input type="radio" name="rate" id="star1" value="1"><label for="star1">★</label>
				</div>
				<input type="hidden" name=review_type value=1>
				<input type="reset" value="초기화">
				<input type="submit" value="후기작성" onclick="return check()">
			</form>
		</article>
	</section>
</body>
</html>