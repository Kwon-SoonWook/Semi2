<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="com.ksj.review.ReviewDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class="com.ksj.review.ReviewDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<%
rdto.setUsere_id((String)session.getAttribute("sid"));
rdto.setReview_type(0);
if(request.getParameter("review_type")!=null&&request.getParameter("review_type").length()!=0){
	rdto.setReview_type(1);
}
pdao.upadteProductBuyerId(rdto.getUser_id(), Integer.parseInt(rdto.getProducts_id()));
String msg = rdao.addReview(rdto)>0?"등록성공":"등록실패";
%>
<script>
window.alert('<%=msg%>'); 
if (window.opener) { 
    setTimeout(() => { 
        fetch('/semi2/page/user/product/productTrade_ok.jsp?productId=<%=rdto.getProducts_id()%>&trade=2')
        .then(() => { 
            window.opener.document.getElementById("tradestateid").value = "2"; // ✅ 부모 창 값 변경 
            window.opener.location.reload(); // ✅ 부모 창 새로고침
        })
        .finally(() => {
            window.self.close(); // ✅ 요청이 완료된 후 창 닫기
        }); 
    }, 500); // 500ms 딜레이 추가
}
</script>