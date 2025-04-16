<%@page import="com.ksj.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
String productsId_s = request.getParameter("productsIds");
int productsId = 0;
if(productsId_s!=null&&productsId_s.length()!=0){
	productsId = Integer.parseInt(productsId_s);
}
ArrayList<String> arr= pcdao.productsCommentBuyerId(productsId);
ProductDTO pdto = pdao.ProductList(productsId);
String sid = (String)session.getAttribute("sid");
if (sid == null) {
	%>
	<script>
	window.alert('로그인 후 이용가능한 서비스입니다.');
	location.href = '/semi2/page/user/login/login.jsp';
	</script>
	<%
    return;
}
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
		  if(review_content==null||review_content.trim()==""){
		        alert("거래후기를 적어주세요!");
		        return false;		  
		  }
	  var rate = document.querySelector('input[name="rate"]:checked'); // 선택된 라디오 버튼 가져오기
	    if (!rate) {
	        alert("평점을 선택해주세요!");
	        return false;
	    }
}
</script>
</head>
<body>
	<section>
		<article>
			<form name ="writeReview" action="writeReview_ok.jsp">
			<input type="hidden" name=products_id value=<%=productsId %>>
			<input type="hidden" name=review_div value=0>
				<h2>거래자 선택</h2>
				<select name="user_id">
				<%
				for(int i=0;i<arr.size();i++){
					if(!(sid.equals(arr.get(i)))){
					%><option value="<%=arr.get(i)%>"><%=udao.myinfo(arr.get(i)).get(0).getNickname()%></option><%
					}
				}
				%>
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
				<input type="reset" value="초기화">
				<input type="submit" value="후기작성" onclick="return check()">
			</form>
		</article>
	</section>
</body>
</html>
<script>
window.onbeforeunload = function () {
    if (window.opener) {
        fetch('/semi2/page/user/product/productTrade_ok.jsp?productId=<%=productsId%>&trade=0')
        .then(() => {
            window.opener.document.getElementById("tradestateid").value = "0"; // 부모 창 값 변경
            window.opener.location.reload(); // 부모 창 새로고침
        });
    }
};
</script>