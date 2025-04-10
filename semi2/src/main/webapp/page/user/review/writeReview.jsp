<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<%
String productsId_s = request.getParameter("productsIds");
int productsId = 0;
if(productsId_s!=null&&productsId_s.length()!=0){
	productsId = Integer.parseInt(productsId_s);
}
ArrayList<String> arr= pcdao.productsCommentBuyerId(productsId);
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
    justify-content: center;
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
</style>
<script>
window.onunload=function(){	
}
</script>
</head>
<body>
	<section>
		<article>
			<form name ="writeReview.jsp" action="writeReview_ok.jsp">
			<input type="hidden" name=products_id value=<%=productsId %>>
				<h2>거래자 선택</h2>
				<select name="user_id">
				<%
				for(int i=0;i<arr.size();i++){
					%><option value="<%=arr.get(i)%>"><%=udao.myinfo(arr.get(i)).get(0).getNickname()%></option><%
				}
				%>
				</select>				
				<h2>거래후기</h2>
				<textarea placeholder="댓글을 작성해주세요" name="review_content"></textarea>
				<h2>평점</h2>
				<div class="rating">
				<input type="radio" name="rate" id="star5" value="5"><label for="star5">★</label>
				<input type="radio" name="rate" id="star4" value="4"><label for="star4">★</label>
				<input type="radio" name="rate" id="star3" value="3"><label for="star3">★</label>
				<input type="radio" name="rate" id="star2" value="2"><label for="star2">★</label>
				<input type="radio" name="rate" id="star1" value="1"><label for="star1">★</label>
				</div>
				<input type="reset" value="초기화">
				<input type="submit" value="후기작성">
			</form>
		</article>
	</section>
</body>
</html>
<script>
window.onunload = function() {
    if (window.opener) {
        window.opener.document.getElementById("tradestateid").value = "0";
    }
};
</script>