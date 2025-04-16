<%@page import="java.io.PrintWriter"%>
<%@page import="com.ksj.review.ReviewDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ksj.favoriteproducts.FavoriteProductsDTO"%>
<%@page import="com.ksj.productscomment.ProductsCommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.productimages.ProductImagesDTO"%>
<%@page import="com.ksj.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<jsp:useBean id="pidao" class="com.ksj.productimages.ProductImagesDAO"></jsp:useBean>
<jsp:useBean id="pcdao" class="com.ksj.productscomment.ProductsCommentDAO"></jsp:useBean>
<jsp:useBean id="fdao" class="com.ksj.favoriteproducts.FavoriteProductsDAO"></jsp:useBean>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="com.ksj.review.ReviewDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
String productsIds = request.getParameter("productsIds");
int prodcutsId;
if(productsIds==null||productsIds.equals("")){
	prodcutsId = 0;
}else{
	prodcutsId = Integer.parseInt(productsIds);
}
ProductDTO pdto = pdao.ProductList(prodcutsId);
ArrayList<ProductImagesDTO> arr= pidao.ProductImagesList(prodcutsId);
ReviewDTO rdto = rdao.getReviewSeller(sid, productsIds);
SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
FavoriteProductsDTO fdto = fdao.favoriteProductsList(prodcutsId, sid);
if(fdto==null){
	FavoriteProductsDTO dto = new FavoriteProductsDTO(sid,prodcutsId,0);
	fdao.addFavoriteProducts(dto);
}
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
<link rel="stylesheet" type="text/css" href="/semi2/page/user/main/mainLayout.css">
<style>
.center-wrapper {
  display: flex;
  justify-content: center;
  align-items: flex-start; /* 위에서부터 정렬, 필요시 center 로 변경 */
  margin-top: 20px; /* 위 간격 */
}

/* 전체 레이아웃: 이미지 왼쪽, 내용 오른쪽 */
.sale-product-container {
	width:350px;
    display: flex;
    align-items: flex-start; /* 위쪽 정렬 */
    gap: 100px; /* 요소 간 간격 */
	margin-left:160px;
}
.product-container{
	width:100%;
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
    margin-top: 10px;
}
.comment-section {
    width: 80%;
    max-width: 1400px;
    margin: 20px auto;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background: #f9f9f9;
}

.comment-section table {
    width: 99%; /* 부모 요소의 전체 너비를 사용 */
    max-width: 1400px; /* 필요하면 최대 크기 지정 */
    border-collapse: collapse; /* 테이블 테두리 정리 */
}

.comment-box {
    display: flex;
    align-items: center;
    width: 100%;
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
.reply {
  display: flex;
  align-items: flex-start;
  padding: 12px 0;
  font-size: 14px;
  line-height: 1.6;
  gap: 10px;
  
  height: auto; 
  padding-top: 0px; 
  padding-bottom: 0px; 
  margin-top: 0px; 
  margin-bottom: 0px;
  
}

.reply .avatar {
  font-size: 25px;
  color: darkgray;
}

.reply .main {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.reply .meta {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 13px;
  color: #555;
  margin-bottom: 5px;
}

.reply .content {
  margin-bottom: 8px;
  color: #222;
}

.reply .actions {
  font-size: 8px;
  color: #666;
}

.reply .actions input[type="button"] {
  background: none;
  border: none;
  color: #666;
  cursor: pointer;
}

.reply .actions input[type="button"]:hover {
  text-decoration: underline;
  color: #111;
}

.reply-indent {
  margin-left: 20px;
  padding-left: 10px;
      
  height: auto; 
  padding-top: 0px; 
  padding-bottom: 0px; 
  margin-top: 0px; 
  margin-bottom: 0px;
}

.reply-form {
    display: none; /* 기본적으로 숨김 */
    align-items: center;
    width: 90%;
    margin-left: auto;    
    margin-right: 10px;
    border: 1px solid #ddd;
    padding: 10px;
    border-radius: 5px;
    background: #f9f9f9;
}

.reply-form-header {
    display: none;
    align-items: center;
    gap: 10px;
}

.reply-form-header i {
    font-size: 25px;
    color: darkgray;
}


.reply-form textarea{
    align-items: center;
    width: 85%;
    border: 1px solid #ddd;
    padding: 10px;
    border-radius: 5px;
    background: #f9f9f9;
}
.reply-form button {
    width: 60px;
    height: 40px;
   	margin-left: auto;    
    margin-right: 10px;
    background: #008cff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

</style>
<script>
window.onload=function(){
	<%
	if(sid.equals(pdto.getSeller_id())){
		if((rdto!=null)){
			%>		
			document.getElementById("tradestateid").disabled = true;
			<%
		}else{
			%>
			document.getElementById("tradestateid").disabled = false;			
			<%
		}
	}else{
		%>
		document.getElementById("tradestateid").disabled = true;
		<%		
	}
	%>
	document.getElementById("tradestateid").value = <%=pdto.getTrade_state()%>
	<%
	if(rdto==null){	
		if(pdto.getTrade_state()==2&&sid.equals(pdto.getSeller_id())){
			
			%>
			var popup = window.open('/semi2/page/user/review/writeReview.jsp?productsIds=<%=productsIds%>','writeReview','width=650,height=550,top=100,left=550');		
			<% 
		}
	}else{
		
	}
	%>
}
function trade(tradestate){
	location.href = "productTrade_ok.jsp?productId="+<%=prodcutsId%>+"&trade="+tradestate.value;
}

function contentclick(){
	var contentname = document.saleProductiVeiw.contentname.value;
	if(contentname.trim()==""){
		alert("댓글을 입력해주세요");
		return false;
	}else{
		return true;
	}
}
function showbig(val){
	var img = document.getElementById("big");
	img.src = "img/"+val;
}
function openReWrite(url) {
	window.open(url,'reWrite','width=450,height=350');
}
function reWrite(idx){
	var reContentname = document.getElementById("reContentname"+idx).value;
	if(reContentname.trim()==""){
		alert("댓글을 입력해주세요");
		return false;
	}else{
		return true;
	}	
}
function toggleReplyForm(commentIdx) {
    let replyForms = document.getElementsByClassName("reply-form"); // 모든 답글 폼 가져오기

    if (!replyForms || replyForms.length === 0) {
        console.error("replyForms 요소가 존재하지 않습니다.");
        return;
    }

    let replyForm = document.getElementById("reply-form-" + commentIdx);

    // 현재 폼이 열려 있으면 닫고, 닫혀 있으면 열기
    if (replyForm.style.display === "flex") {
        replyForm.style.display = "none";
    } else {
        for (let i = 0; i < replyForms.length; i++) {
            replyForms[i].style.display = "none";
        }
        replyForm.style.display = "flex";
    }
}


</script>
</head>
<%@include file="/page/user/main/header.jsp"%>
<body>
<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">
    	<div>
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
						<select name = "tradestate" id ="tradestateid" onchange="trade(this);" >
						<option value=0>판매중</option>	
						<option value=1>예약중</option>	
						<option value=2>거래완료</option>	
						</select>
					</div>
					<hr>
					<div>가격:<%=pdto.getPrice() %></div>
					<div><%=pdto.getContent() %></div>
					<div><%=pdto.getLocation() %></div>
					<div class="product-actions">
					<% if(sid!=null&&sid.equals(pdto.getSeller_id())){
						%>
					<input type="button" name="update_products" value="수정하기" onclick="location.href='updateWriteSaleProduct.jsp?productId=<%=prodcutsId%>'">
					<input type="button" name="delete_products" value="삭제하기" onclick="location.href='deleteSaleProduct.jsp?productId=<%=prodcutsId%>'">
					<input type="button" name="hidden_products" value="<%=pdto.getBbs_state()==0?"숨기기":"보이기" %>" onclick="location.href='hideSaleProduct.jsp?productId=<%=prodcutsId%>'">
						<%
					}else{
						if(fdto==null){
							%>
							<input type="button" name="favorite_products" value="찜" onclick="location.href='isValidfavoriteProduct.jsp?productId=<%=prodcutsId%>'">										
							<%
						}else{
							if(fdto.getIs_valid()==0){
								%>
								<input type="button" name="favorite_products" value="찜" onclick="location.href='isValidfavoriteProduct.jsp?productId=<%=prodcutsId%>'">										
								<%							
							}else if(fdto.getIs_valid()==1){
								%>
								<input type="button" name="favorite_products" value="찜취소" onclick="location.href='isValidfavoriteProduct.jsp?productId=<%=prodcutsId%>'">										
								<%							
							}
						}
					}
					%>
				</div>
			</div>	
		</div>
	</div>
		
		<div class="comment-section">
			<table>
				<thead><tr><th colspan="3">댓글</th></tr></thead>
				<tbody>
						<%if(sid!=null&&sid.equals(pdto.getSeller_id())){
							ArrayList<ProductsCommentDTO> sellerlist= pcdao.productsSellerCommentList(prodcutsId);
							if(sellerlist==null||sellerlist.size()==0){%>
								<tr>
									<td colspan="3" align="center">
									등록된 댓글이 없습니다
									</td>
								</tr><%								
							}else{
								for(int i=0;i<sellerlist.size();i++){%>
									<tr>
										<td>
											<div class="reply"><%
												for(int z=0;z<sellerlist.get(i).getLev();z++){
													%><div class="reply <%= sellerlist.get(i).getLev() > 0 ? "reply-indent" : " " %>"><%
												}
												if(sellerlist.get(i).getComment_div()==0){
													if(i==0){
														%><div class="reply <%= sellerlist.get(i).getLev() > 0 ? "reply-indent" : " " %>"><%													
													}%>											
													<div class="avatar">												
												    	<%if(!headudao.myinfo(sellerlist.get(i).getSeller_id()).isEmpty() && headudao.myinfo(sellerlist.get(i).getSeller_id()).get(0).getProfile_uri() != null){ %>
															<img src="/<%=headudao.myinfo(sellerlist.get(i).getSeller_id()).get(0).getProfile_uri() %>" alt="프로필 이미지" width="40" height="40" style=border-radius:50% />
													    <%}else{ %>
													         <i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 25px;"></i>
													    <%} %>
													</div>
													<div class="main">
														<div class="meta">											          
													        <span class="user-id"><%=udao.myinfo((sellerlist.get(i).getSeller_id())).get(0).getNickname()%></span>
															<span class="date"><%=timeFormat.format(sellerlist.get(i).getCreate_date()) %></span>
													    </div>												
													    <div class="content">
															<%=sellerlist.get(i).getComment_content() %>
													    </div>
													    <div class="actions">												
															<%if(sellerlist.get(i).getSeller_id().equals(sid)){%>
																<input type="button" value="수정하기" onclick="openReWrite('productCommentUpdate.jsp?idx=<%=sellerlist.get(i).getProducts_comment_idx()%>')">
																<input type="button" value="삭제하기" onclick="location.href='deleteProductComment_ok.jsp?idx=<%=sellerlist.get(i).getProducts_comment_idx()%>'">
															<%														
															}else{%>
																<input type="button" value="답글쓰기" onclick="toggleReplyForm(<%=sellerlist.get(i).getProducts_comment_idx()%>)">

															<%
															}%>
														</div>
													</div>	
											    	<%
												}else{
													%>댓글이 삭제되었습니다<%
												}
												if(i==0){
												%></div><%												
												}
												for(int z=0;z<sellerlist.get(i).getLev();z++){
													%></div><%
												}%>
											 </div>
											 <!-- 대댓글 입력 폼 -->
										<form name="productComment" action="productCommentReWrite_ok.jsp">
											<div id="reply-form-<%=sellerlist.get(i).getProducts_comment_idx()%>" class="reply-form">
											    <input type="hidden" value="<%=prodcutsId %>" name="Products_id">
												<%ProductsCommentDTO pcdto = pcdao.productsCommentList(sellerlist.get(i).getProducts_comment_idx());%>
												<textarea placeholder="댓글을 작성해주세요" name="comment_content" id="reContentname<%=sellerlist.get(i).getProducts_comment_idx()%>"></textarea>
											    <input type="hidden" value="<%=pcdto.getBuyer_id() %>" name="Buyer_id">
											    <input type="hidden" value="<%=sid %>" name="seller_id">
											    <input type="hidden" value="<%=pcdto.getRef() %>" name="ref">
											    <input type="hidden" value="<%=pcdto.getLev() %>" name="lev">
											    <input type="hidden" value="<%=pcdto.getSunbun() %>" name="sunbun">
												<button onclick="return reWrite('<%=sellerlist.get(i).getProducts_comment_idx()%>')">댓글작성</button>
											</div>
										</form>											 
										</td>
									</tr><%								
								}
							}
						}else{
							ArrayList<ProductsCommentDTO> buyerlist= pcdao.buyerProductsCommentList(sid,prodcutsId);
							if(buyerlist==null||buyerlist.size()==0){%>
									<tr>
										<td colspan="3" align="center">
										등록된 댓글이 없습니다
										</td>
									</tr><%
							}else{
								for(int i=0;i<buyerlist.size();i++){%>
									<tr>
										<td><%
											for(int z=0;z<=buyerlist.get(i).getLev();z++){
												%><div class="reply <%= buyerlist.get(i).getLev() > 0 ? "reply-indent" : " " %>"><%
											}
											if(buyerlist.get(i).getComment_div()==0){
												if(i==0){
													%><div class="reply <%= buyerlist.get(i).getLev() > 0 ? "reply-indent" : " " %>"><%														
												}
												%><div class="avatar"><%
											    	if(!headudao.myinfo(buyerlist.get(i).getSeller_id()).isEmpty() && headudao.myinfo(buyerlist.get(i).getSeller_id()).get(0).getProfile_uri() != null){ %>
														<img src="/<%=headudao.myinfo(buyerlist.get(i).getSeller_id()).get(0).getProfile_uri() %>" alt="프로필 이미지" width="40" height="40" style=border-radius:50% />
												    <%}else{ %>
												         <i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 25px;"></i>
												    <%} %>
												</div>
												<div class="main">
													<div class="meta">											          
												        <span class="user-id"><%=udao.myinfo(buyerlist.get(i).getSeller_id()).get(0).getNickname() %></span>
														<span class="date"><%=timeFormat.format(buyerlist.get(i).getCreate_date()) %></span>										        
												    </div>												
												    <div class="content">												
													<%=buyerlist.get(i).getComment_content() %>
												    </div>
												    <div class="actions">																								
													<%if(buyerlist.get(i).getSeller_id().equals(sid)){
														%><input type="button" value="수정하기" onclick="openReWrite('productCommentUpdate.jsp?idx=<%=buyerlist.get(i).getProducts_comment_idx()%>')">
														<input type="button" value="삭제하기" onclick="location.href='deleteProductComment_ok.jsp?idx=<%=buyerlist.get(i).getProducts_comment_idx()%>'"><%																								
													}else{
														%><input type="button" value="답글쓰기" onclick="toggleReplyForm(<%=buyerlist.get(i).getProducts_comment_idx()%>)"><%												
													}%>
													</div>
												</div><%	
												}else{
													%>댓글이 삭제되었습니다<%
												}
											if(i==0){
												%></div><%											
											}
											for(int z=0;z<buyerlist.get(i).getLev();z++){
												%></div><%
											}%>
											</div>
											<form name="productComment" action="productCommentReWrite_ok.jsp">
											<div id="reply-form-<%=buyerlist.get(i).getProducts_comment_idx()%>" class="reply-form">
											    <input type="hidden" value="<%=prodcutsId %>" name="Products_id">
												<%ProductsCommentDTO pcdto = pcdao.productsCommentList(buyerlist.get(i).getProducts_comment_idx());%>
												<textarea placeholder="댓글을 작성해주세요" name="comment_content" id="reContentname<%=buyerlist.get(i).getProducts_comment_idx()%>"></textarea>
											    <input type="hidden" value="<%=pcdto.getBuyer_id() %>" name="Buyer_id">
											    <input type="hidden" value="<%=sid %>" name="seller_id">
											    <input type="hidden" value="<%=pcdto.getRef() %>" name="ref">
											    <input type="hidden" value="<%=pcdto.getLev() %>" name="lev">
											    <input type="hidden" value="<%=pcdto.getSunbun() %>" name="sunbun">
												<button onclick="return reWrite('<%=buyerlist.get(i).getProducts_comment_idx()%>')">댓글작성</button>
											</div>
										</form>											 	
										</td>
									</tr><%																
								}
							}
						}%>
				</tbody>
				<tfoot>
					<tr>
						<td>
						<form name="saleProductiVeiw" action="productComment_ok.jsp">
							<div class="comment-box">
							    <div class="comment-header">
							        <a href="../mypage/mypage.jsp">
							    	<%if(!arr2.isEmpty() && arr2.get(0).getProfile_uri() != null){ %>
										<img src="/<%=arr2.get(0).getProfile_uri() %>" alt="프로필 이미지" width="40" height="40" style=border-radius:50% />
								    <%}else{ %>
								         <i class="fa-solid fa-circle-user" style="color: darkgray; font-size: 25px;"></i>
								    <%} %>
							        </a>
							        <span class="user-id"><%=udao.myinfo(sid).get(0).getNickname() %></span>
							    </div>
							    <input type="hidden" value="<%=sid %>" name="buyerId">
							    <input type="hidden" value="<%=prodcutsId %>" name="prodcutsId">
							    <input type="hidden" value="<%=sid %>" name="sellerId">
							    <textarea class="comment-input" placeholder="댓글을 작성해주세요" name="contentname"></textarea>
							    <button class="comment-submit" onclick="return contentclick()">댓글 작성</button>
							</div>
						</form>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		</div>
    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>  