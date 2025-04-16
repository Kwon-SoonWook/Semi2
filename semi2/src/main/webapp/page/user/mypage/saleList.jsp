<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.product.*" %>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매물품 리스트</title>
<link rel="stylesheet" type="text/css" href="mypageLayout.css">
<style>
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
String mypageid = (String)session.getAttribute("sid");
 
//총 게시물 수
int productCnt = pdao.getProductCnt(mypageid); // db로부터 조회
session.setAttribute("productCnt", productCnt);

String productsIds = request.getParameter("productsIds");
int productsId;
if(productsIds==null||productsIds.equals("")){
	productsId = 0;
}else{
	productsId = Integer.parseInt(productsIds);
}
%>
<body>
<section>
<article>
	<h2>판매물품 리스트</h2>
	<div style="text-align: right">
	<button onclick="top.location.href='/semi2/page/user/product/writeSaleProduct.jsp'">새글쓰기
	</div>
    <%
	ArrayList<ProductDTO> arr = pdao.saleList(mypageid);
	if(arr==null || arr.size()==0){
	%>
		<h3 align='center'>등록된 글이 없습니다.</h3>
	<%
	}else{
	%>
	<div class="photo-grid">
		<%for(int i=0; i<arr.size(); i++){%>
           <div class="photo-card <%= arr.get(i).getBbs_state() == 1 ? "hidden" : "" %>">
            <a href="#" onclick="window.parent.location='/semi2/page/user/product/saleProductView.jsp?productsIds=<%=arr.get(i).getProducts_id()%>';">
	            <%if(arr.get(i).getBbs_state()== 1){ %>
	            	<div class="thumbnail"></div>
		        <%}else{ %>
		            <%if(arr.get(i).getThumb_image()!=null) {%>
				        <img src="/semi2/page/user/product/img/<%=arr.get(i).getThumb_image()%>"class="thumbnail">
					<%}else{ %>
						<div class="thumbnail"></div>
					<%} %>
				<%} %>
		        <h3><%=arr.get(i).getTitle() %></h3>
		        <p><%=arr.get(i).getPrice() %></p>
		        <p><%=arr.get(i).getCreate_date() %></p>
		        
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
</body>
</html>