<%@page import="com.ksj.tempproductimages.TempProductImagesDTO"%>
<%@page import="com.ksj.product.ProductDTO"%>
<%@page import="com.ksj.tempproduct.TempProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.category.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="cdao" class="com.ksj.category.CategoryDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<jsp:useBean id="tpdao" class="com.ksj.tempproduct.TempProductDAO"></jsp:useBean>
<jsp:useBean id="tidao" class="com.ksj.tempproductimages.TempProductImagesDAO"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" type="text/css" href="/semi2/page/user/main/mainLayout.css">
<style>
body {
	margin: 0px auto;
    height: 100%;
}
</style>
<script>
function check(){
	  var title = document.writeSaleProduct.title.value;
	  if(title==null||title==""){
	        alert("상품명을 입력해주세요!");
	        return false;		  
	  }
	  var category = document.querySelector('input[name="category"]:checked'); // 선택된 라디오 버튼 가져오기
	    if (!category) {
	        alert("카테고리를 선택해주세요!");
	        return false;
	    }
		var content = document.writeSaleProduct.content.value;
		  if(content==null||content==""){
		        alert("상품설명을 입력해주세요!");
		        return false;		  
		  }
		var price = document.writeSaleProduct.price.value;
		  if(price==null||price==""){
		        alert("가격을 입력해주세요!");
		        return false;		  
		  }
			var location = document.writeSaleProduct.location.value;
				 if(location==null||location==""){
					     alert("거래희망장소를 입력해주세요!");
					     return false;		  
				 }
}
function show(){
}
    function previewImage(event,idx) {
        var file = event.target.files[0]; // 파일 가져오기
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("previewImage"+idx).src = e.target.result; // 이미지 설정
                document.getElementById("imageContainer"+idx).style.display = "block"; // 미리보기 활성화
                document.getElementById("imageUpload"+idx).style.display = "none"; // 파일 선택 버튼 숨기기
            };
            reader.readAsDataURL(file);
        }
    }

    function removePreview(event,idx) {
        if(event){
        	event.preventDefault();
        }
        document.getElementById("previewImage"+idx).src = ""; // 이미지 제거
        document.getElementById("imageContainer"+idx).style.display = "none"; // 미리보기 숨기기
        document.getElementById("imageUpload"+idx).style.display = "block"; // 파일 선택 버튼 다시 표시
        document.getElementById("imageUpload"+idx).value = "";
        document.getElementById("loadimage"+idx).value="";

    }
    function removeImg(){
    	for(var i=0;i<5;i++){
            document.getElementById("previewImage"+i).src = ""; // 이미지 제거
            document.getElementById("imageContainer"+i).style.display = "none"; // 미리보기 숨기기
            document.getElementById("imageUpload"+i).style.display = "block"; // 파일 선택 버튼 다시 표시
            document.getElementById("imageUpload"+i).value = "";
            document.getElementById("loadimage"+i).value="";    		
    	}
    }
</script>
<%
String sid = (String)session.getAttribute("sid");
TempProductDTO tpdto = tpdao.tempProductList(sid);
String productIds = request.getParameter("productId");
int productId;
if(productIds==null||productIds.equals("")){
	productId=0;
}else{
	productId = Integer.parseInt(productIds);
}
ProductDTO pdto = pdao.ProductList(productId);
ArrayList<TempProductImagesDTO> tempImgArr = tidao.TempProductImagesList(sid);
if(pdto==null||pdto.equals("")){
	if(tpdto!=null){
		%>
		<script>
		if(confirm("임시저장된 데이터를 불러올까요?")){
			window.onload =function(){
				document.writeSaleProduct.title.value = "<%=tpdto.getTitle()%>";
				document.writeSaleProduct.category.value = "<%=tpdto.getCategory_id()%>";
				document.writeSaleProduct.content.value = "<%=tpdto.getContent()%>";
				document.writeSaleProduct.price.value = "<%=tpdto.getPrice()%>";
				document.writeSaleProduct.location.value = "<%=tpdto.getWish_location()%>";
				<%
				if(tempImgArr!=null&&tempImgArr.size()!=0){
					ArrayList<TempProductImagesDTO> imgArr = tidao.TempProductImagesList(sid);
					ArrayList<String> imgStringArr = new ArrayList<String>();
					imgStringArr.add(tpdao.tempProductList(sid).getThumb_image());
					
					for(int i=0;i<imgArr.size();i++){
						if(!(imgArr.get(i).getTemp_product_images_id().equals(tpdao.tempProductList(sid).getThumb_image()))){
							imgStringArr.add(imgArr.get(i).getTemp_product_images_id());
						}
					}
					for(int i=0;i<tempImgArr.size();i++){
						%>
						document.getElementById("loadimage<%=i%>").value = "<%=imgStringArr.get(i)%>"
				        document.getElementById("previewImage<%=i%>").src = "img/<%=imgStringArr.get(i)%>";
						document.getElementById("imageContainer<%=i%>").style.display = "block";
						document.getElementById("imageUpload<%=i%>").style.display = "none";						
						<%
					}
				}
				%>
			}
		}
		</script>
		<%
	}
}else{
	%>
	<script>
	window.onload =function(){
		document.writeSaleProduct.title.value = "<%=pdto.getTitle()%>";
		document.writeSaleProduct.category.value = "<%=pdto.getCategory_id()%>";
		document.writeSaleProduct.content.value = "<%=pdto.getContent()%>";
		document.writeSaleProduct.price.value = "<%=pdto.getPrice()%>";
		document.writeSaleProduct.location.value = "<%=pdto.getLocation()%>";
	}
	</script>
	<%	
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
</head>
	<%@include file="/page/user/main/header.jsp"%>
<body>	
	<div class="container">
	<%@include file="/page/user/main/category.jsp" %>
    <main class="main-content">
	<%
	ArrayList<CategoryDTO> arr = cdao.categoryList();
	%>
			<form name="writeSaleProduct" action="writeSaleProduct_ok.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name ="productId" value="<%=productId%>">
				<table>
					<tr>
						<th>상품정보</th>
					</tr>
					
					<tr>
						<th>상품이미지(최대5개)</th>
						<td>
						<div style="display: flex; align-items: center; gap: 10px;">
							<% for(int i=0;i<5;i++){ %>
						    <input type="file" name="img<%=i %>" id="imageUpload<%=i %>" accept="image/*" onchange="previewImage(event,<%=i %>)" style="display: block;">
						    <div id="imageContainer<%=i %>" style="position: relative; display: none;">
						        <img id="previewImage<%=i %>" src="" style="width: 150px; height: 150px;">
								<input type="hidden" name="loadimage<%=i %>" id="loadimage<%=i %>" value="">
						        <button id="removeImage<%=i %>" onclick="removePreview(event,<%=i %>)" style="
						            position: absolute; top: 5px; right: 5px; background: red; color: white;
						            border: none; padding: 5px; cursor: pointer; font-size: 14px;">
						            ✖
						        </button>
						    </div>
							<%	}  %>	
						</div>
						</td>					
						</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<%
						if (arr == null || arr.size() == 0) {
						%>
						<td>등록된 카테고리가 없습니다</td>
						<%
						} else {
						%><td>
							<%
							for (int i = 0; i < arr.size(); i++) {
								if(i==0){
									%><input type="radio" name="category" value="<%=arr.get(i).getCategoryId()%>" checked="checked"><%=arr.get(i).getCategoryName()%><%
								}else{
							%>
							<input type="radio" name="category" value="<%=arr.get(i).getCategoryId()%>"><%=arr.get(i).getCategoryName()%>
							<%
								}
							}
							%>
						</td>
						<%
						}
						%>
					</tr>
					<tr>
						<th>상품설명</th>
						<td><textarea rows="8" cols="45" name="content"></textarea></td>
					</tr>
					<th>가격</th>
					<td><input type="text" name="price" value="0"></td>
					</tr>
					<tr>
						<th>거래희망장소</th>
						<td><input type="text" name="location"></td>
					</tr>
				</table>
				<tfoot>
					<input type="reset" value="초기화" onclick="removeImg()">
					<input type="submit" name="tempsave" value="임시저장" onclick="return show()" formaction="temporarySave.jsp"> 
					<input type="submit" name="save" value="저장" onclick="return check()" formaction="writeSaleProduct_ok.jsp"></td>
				</tfoot>
			</form>
    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>