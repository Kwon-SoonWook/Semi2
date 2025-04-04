<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.productimages.ProductImagesDTO"%>
<%@page import="com.ksj.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<jsp:useBean id="pidao" class="com.ksj.productimages.ProductImagesDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
<<<<<<< HEAD
int prodcutsId = 61;
=======
/*String productsIds = request.getParameter("productsIds");
int productsId = Integer.parseInt(productsIds);
if(productsIds==null||productsIds.equals("")){
	productsId = 0;
}
*/
int prodcutsId = 71;
>>>>>>> b526ceb112176aae2d1ffec4dcdf828e7a79ec06
ProductDTO pdto = pdao.ProductList(prodcutsId);
ArrayList<ProductImagesDTO> arr= pidao.ProductImagesList(prodcutsId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/page/user/main/mainLayout.css">
<style>
/* 전체 레이아웃: 이미지 왼쪽, 내용 오른쪽 */
.sale-product-container {
width:100%;
    display: flex;
    align-items: flex-start; /* 위쪽 정렬 */
    gap: 20px; /* 요소 간 간격 */
}

/* 왼쪽 이미지 영역 */
.image-container {
    flex: 1; /* 왼쪽 영역 크기 지정 */
    display: flex;
    flex-direction: column; /* 썸네일을 세로로 배치 */
    align-items: center;
    
}

/* 큰 이미지 스타일 */
#big {
    width: 350px;
    height: 350px;
    border-radius: 5px;
    box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.2);
}

/* 썸네일 컨테이너 (가로 정렬) */
.thumbnail-container {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 10px;
}

/* 썸네일 이미지 */
.thumbnail {
    width: 60px;
    height: 60px;
    border: 2px solid #ddd;
    cursor: pointer;
    transition: transform 0.2s ease-in-out;
}

/* 마우스 오버 효과 */
.thumbnail:hover {
    border: 2px solid #007bff;
    transform: scale(1.1);
}

/* 오른쪽 제품 정보 */
.product-info {
    flex: 2; /* 오른쪽 영역 크기 지정 */
    display: flex;
    flex-direction: column;
}

/* 버튼 스타일 */
.product-actions {
    display: flex;
    gap: 10px;
    margin-top: 15px;
}
.comment-section {
    width: 100%;
    max-width: 1400px;
    margin: 20px auto;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background: #f9f9f9;
}

.comment-section table {
    width: 100%; /* 부모 요소의 전체 너비를 사용 */
    max-width: 1400px; /* 필요하면 최대 크기 지정 */
    border-collapse: collapse; /* 테이블 테두리 정리 */
}

.comment-box {
    display: flex;
    align-items: center;
    width: 100%;
    max-width: 1400px;
    border: 1px solid #ddd;
    padding: 10px;
    border-radius: 5px;
    background: #f9f9f9;
}

.comment-header {
    display: flex;
    align-items: center;
    gap: 10px;
}

.comment-header i {
    font-size: 25px;
    color: darkgray;
}


.comment-section td {
    padding: 15px;
    border-bottom: 1px solid #ddd;
}

.comment-input {
    flex: 1; /* 입력창이 가능한 넓게 차지하도록 설정 */
    height: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 8px;
    margin-right: 10px; /* 버튼과 간격 설정 */
}

.comment-submit {
    width: 100px;
    height: 40px;
    background: #008cff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.comment-submit:hover {
    background: #0071e3;
}

</style>
<script>
window.onload=function(){
	<%
	if(pdto.getBuyer_id()==sid){
		%>
		document.getElementById("tradestateid").disabled = true;
		<%
	}else{
		%>
		document.getElementById("tradestateid").disabled = false;
		<%		
	}
	%>
	document.getElementById("tradestateid").value = <%=pdto.getTrade_state()%>
}
function trade(){
	<%
	
	%>
}
function showbig(val){
	var img = document.getElementById("big");
	img.src = "img/"+val;
}
</script>
</head>
<body>
<%@include file="/page/user/main/header.jsp" %>
<%
%>
<section>
	<article>
		<form name="saleProductiVeiw" action="">
		<div class="sale-product-container">
			<div class="image-container">
			<img alt="" src="img/<%=pdto.getThumb_image()%>" width="400" height="400" id="big">
				<div class="thumbnail-container">
				<%
				if(arr!=null||arr.size()!=0){
					for(int i=0;i<arr.size();i++){
						%><img src="img/<%=arr.get(i).getProductImagesId()%>"class="thumbnail" onmouseover="showbig('<%=arr.get(i).getProductImagesId()%>');"><%
					}
				}
				%>
				</div>
			</div>
			<div class="product-info">
				<div>
				<h2>제목:<%=pdto.getTitle() %></h2>
				<select name = "tradestate" id="tradestateid" onchange="trade();">
				<option value=0>판매중</option>	
				<option value=1>예약중</option>	
				</select>
				</div>
				<hr>
				<div>가격:<%=pdto.getPrice() %></div>
				<div><%=pdto.getContent() %></div>
				<div><%=pdto.getLocation() %></div>
				<div class="product-actions">
				<input type="button" name="favorite_products" value="찜">
				<%if(sid!=null&&sid.equals(pdto.getSeller_id())){
					%>
				<input type="button" name="update_products" value="수정하기" onclick="location.href='writeSaleProduct.jsp?productId=<%=prodcutsId%>'">
				<input type="button" name="delete_products" value="삭제하기" onclick="location.href='deleteSaleProduct.jsp?productId=<%=prodcutsId%>'">
				<input type="button" name="hidden_products" value="<%=pdto.getBbs_state()==1?"숨기기":"보이기" %>" onclick="location.href='hideSaleProduct.jsp?productId=<%=prodcutsId%>'">
					<%
				}		
					%>
				</div>
			</div>	
		</div>
		
		<div class="comment-section">
			<table>
				<thead><tr><th>댓글</th></tr></thead>
				<tbody>
					<tr>
						<td>
						
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<div class="comment-box">
							    <div class="comment-header">
							        <a href="../mypage/mypage.jsp">
							            <i class="fa-solid fa-circle-user"></i>
							        </a>
							        <span class="user-id"><%=sid %></span>
							    </div>
							    <textarea class="comment-input" placeholder="댓글을 작성해주세요" name="contentname"></textarea>
							    <button class="comment-submit">댓글 작성</button>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		</form>
	</article>
</section>
<%@include file="/page/user/main/footer.jsp" %>
</body>
</html> 