<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.product.*" %>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜리스트</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
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
.container {
    min-height: 100vh;
}

/* index main 페이지 */
.main-content {
    padding: 60px;
    max-width: 1200px;
    margin: 0 auto;
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

/* 숨겨진 게시물 전체 카드 흐리게 */
.photo-card.hidden {
    opacity: 0.5;
    filter: grayscale(100%);
    position: relative;
}

/* 숨김 텍스트 강조 */
.photo-card .thumbnail-status {
    color: red;
    font-weight: bold;
    text-align: center;
    margin-bottom: 8px;
}

/* 숨겨진 카드 위에 반투명 레이어 */
.photo-card.hidden::after {
    content: "숨김 처리된 게시물";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.6);
    color: red;
    font-size: 16px;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    pointer-events: none;
}
</style>
</head>
<%
String fid = (String)session.getAttribute("sid");
//총 게시물 수
int favoriteCnt = pdao.getfavoriteCnt(fid); // db로부터 조회
session.setAttribute("favoriteCnt", favoriteCnt);

%>
<body>
<section>
<article>
	<h2>찜 리스트</h2>
    <%
	ArrayList<ProductDTO> arr = pdao.favoriteList(fid);
	if(arr==null || arr.size()==0){
	%>
	<h3 align='center'>등록된 글이 없습니다.</h3>
	<%
	}else{%>
	<div class="photo-grid">
		<%for(int i=0; i<arr.size(); i++){%>
            <div class="photo-card">
	            <a href="#" onclick="window.parent.location='/semi2/page/user/product/saleProductView.jsp?productsIds=<%=arr.get(i).getProducts_id()%>';">
		            <%if(arr.get(i).getThumb_image()!=null) {%>
			        	<img src="/semi2/page/user/product/img/<%=arr.get(i).getThumb_image()%>"class="thumbnail">
					<%}else{ %>
						<div class="thumbnail"></div>
					<%} %>
			        <p style="font-size: 16px; color: black"><%=arr.get(i).getTitle() %></p>
		        	<p style="font-size: 18px; font-weight: bold;"><%=arr.get(i).getPrice() %>원</p>
		        	<p style="color: #6e6e73;"><%=arr.get(i).getCreate_date() %></p>
	            </a> 
            </div>
        	<% 
			}
		}%>  
    </div>
</article>
</section>
</body>
</html>