<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ksj.product.ProductDTO"%>
<jsp:useBean id="kdao" class="com.ksj.login.loginDAO" scope="session"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>노후재활센터</title>
<style>
/* 공통 폰트 및 색상 */
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
body {
    background-color: #EBEDE0;
    color: #EBEDE0;
}

.container {
    min-height: 100vh;
}

/* index main 페이지 */
.main-content {
    padding: 100px;
    max-width: 1920px;
    margin-left: 100px;
}

/* 전체 게시물 목록 */
.photo-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 32px;
}
.photo-grid a {
    text-decoration: none;
    color: inherit;
}

/* 게시물 카드 */
.photo-card {
	font-family: "Pretendard-Regular", Helvetica;
    background: #ffffff;
    border: 1px solid #eaeaea;
    border-radius: 16px;
    padding: 16px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.03);
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    height: 270px;
    overflow: hidden;                                                                                                                                                         
}
.photo-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.06);
}
.thumbnail {
    width: 100%;
    height: 180px;
    border-radius: 12px;
    background-color: #E9EAE5;
    object-fit: cover;
    object-position: center;
    display: block;
}

.photo-card p {
    font-size: 0.85rem;
    margin: 10px 0;
}

/* 반응형 */
@media (max-width: 768px) {
    .main-content {
        padding: 40px 20px;
    }
}

.phrase{
	line-height: 100%;
}
.text1{
	text-align: center;
	font-family: "Pretendard-Bold", Helvetica;
	font-size: 40px;
	font-weight: 700;
	letter-spacing: -1.00px;
}
.text2{
	text-align: center;
	font-family: "Pretendard-Medium", Helvetica;
	font-size: 18px;
	font-weight: 500;
	letter-spacing: -0.40px;
	
}
.search-bar-wrapper {
    display: flex;
    justify-content: center;
    margin-top: 60px; /* 위쪽 여백 조정 가능 */
}
/* 검색창 */
.search-bar2 {
    background: #ffffff;
    border: 1px solid #ddd;
	padding: 10px 20px;
	border-radius: 10px;
    display: flex;
    max-width: 700px;
    width: 100%;
    height: 40px;
    margin-bottom: 50px;
}

.search-bar2 input {
    border: none;
    outline: none;
    font-family: "Pretendard-Medium", Helvetica;
    font-size: 18px;
    flex: 1;
    padding: 10px 30px;

}
</style>
<script src="https://kit.fontawesome.com/f0cba69f8f.js" crossorigin="anonymous"></script><!-- 안보이면 해당 사이트 로그인 후 주소받기 -->
</head>
<%
String indexid = (String)session.getAttribute("sid");
String productsIds = request.getParameter("productsIds");
int productsId;
if(productsIds==null||productsIds.equals("")){
	productsId = 0;
}else{
	productsId = Integer.parseInt(productsIds);
}
%>
<%@include file="/page/user/main/header.jsp" %> 
<body>
<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">
      	<%if(indexid!=null){ %>
      		<div class="phrase">
	           	<p class="text1" style="color:#111111">소중한 물건을 재활용하고 재탄생 시키는 공간</p>
			   	<p class="text2">
			   		<span class="span1" style="color:#111111">노후재활센터</span><span class="span2" style="color:#767676">에서 따뜻한 거래를 시작하세요</span>
			   	</p>
			</div>
			<div class="search-bar-wrapper">
				<div class="search-bar2">
				    <form id=searchform method="post" action="/semi2/page/user/main/search.jsp" style="display: flex; align-items: center; width: 100%;">
				        <i class="fas fa-search" style="font-size: 22px; color:#767676 "></i>
				        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
				        <a href="#" onclick="searchClick();" style="color: #111111;">
				        	<i class="fa-solid fa-circle-arrow-right" style="font-size: 28px; cursor: pointer;"></i>
				        </a>
				    </form>
			    </div>
	    	</div>
	    	<div class="photo-grid">
	        <%
			ArrayList<ProductDTO> arr = pdao.stateProductList();
			if(arr==null || arr.size()==0){
			%>
				<h3>등록된 글이 없습니다.</h3>
			<%
			}else{
				for(int i=0; i<arr.size(); i++){
				%>
	            <div class="photo-card">
		            <a href="/semi2/page/user/product/saleProductView.jsp?productsIds=<%=arr.get(i).getProducts_id()%>">
			            <%if(arr.get(i).getThumb_image()!=null) {%>
			            <img src="/semi2/page/user/product/img/<%=arr.get(i).getThumb_image()%>"class="thumbnail">
				        <%}else{ %>
				        <div class="thumbnail"></div>
				        <%} %>
				        <p style="font-size: 16px;"><%=arr.get(i).getTitle() %></p>
		       			<p style="font-size: 18px; font-weight: bold;"><%=arr.get(i).getPrice() %>원</p>
		        		<p style="color: #6e6e73;"><%=arr.get(i).getCreate_date() %></p>
		            </a> 
	            </div>
	        	<% 
				}
			}%>  
	        </div>
       	<%}else{ %>
       	<div class="phrase">
           <p class="text1" style="color:#111111">소중한 물건을 재활용하고 재탄생 시키는 공간</p>
		   <p class="text2">
		   		<span class="span1" style="color:#111111">노후재활센터</span><span class="span2" style="color:#767676">에서 따뜻한 거래를 시작하세요</span>
		   </p>
		</div>   
        <%} %>
    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>