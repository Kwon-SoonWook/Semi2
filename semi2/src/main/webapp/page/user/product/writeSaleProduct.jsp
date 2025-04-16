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
<%
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
<link rel="stylesheet" type="text/css" href="/semi2/page/user/main/mainLayout.css">
<style>
.form-section {
  border: 1px solid #ddd;
  padding: 20px;
  margin-bottom: 50px;
  margin-left:114px;
  width: 1100px;
  border-radius: 8px;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}
.form-section h3 {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 20px;
  border-bottom: 1px solid #eee;
  padding-bottom: 10px;
}
.form-group {
  margin-bottom: 20px;
}
.form-group label {
  display: block;
  font-weight: bold;
  margin-bottom: 8px;
}
.form-group input[type="text"],
.form-group textarea {
  width: 90%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}
.image-grid {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}
.image-grid input[type="file"] {
    width: 90px; /* 기존보다 크기 조정 */
}
.image-box {
  width: 150px;
  height: 150px;
  position: relative;
  border: 1px dashed #ccc;
  border-radius: 6px;
  background-color: #fafafa;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}
.image-box img {
  max-width: 100%;
  max-height: 100%;
  object-fit: cover;
}
.remove-btn {
  position: absolute;
  top: 5px;
  right: 5px;
  background: red;
  color: white;
  border: none;
  padding: 5px;
  cursor: pointer;
  font-size: 12px;
  border-radius: 50%;
}
.radio-group {
  display: flex;
  gap: 15px;
  flex-wrap: wrap;
}
.action-btns {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}
.action-btns input {
  padding: 10px 20px;
  font-size: 14px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}
.action-btns input[type="submit"] {
  background-color: #ddd;
}
.action-btns input[type="reset"] {
  background-color: #ddd;
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
	var id = <%=sid%>;
	if(id==null||id==""){
		alert("로그인후 이용해주세요");
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
    function isNumberkey(event){
        // 허용할 키 목록
        const allowedKeys = ["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Enter", "Tab","F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12","Escape","CapsLock"];
    	if(event.key >="0" && event.key <= "9"||allowedKeys.includes(event.key)){
    		return true;
    	}else{
    		alert("정수만 입력해주세요");
    		return false;
    	}
    }
    function filterInvalidInput(event) {
        event.target.value = event.target.value.replace(/[^0-9]/g, ''); // 숫자만 남기기
    }
</script>
<%
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
			<div>
				<div>
				<h2>상품정보</h2>
				</div>
				<div class="form-section">
					<h3>상품이미지(최대5개)</h3>
					<div class="image-grid">
						<% for(int i=0;i<5;i++){ %>
							<div class="image-box" id="imageContainer<%=i%>" style="display:none;">
								<img id="previewImage<%=i %>" src="">
								<input type="hidden" name="loadimage<%=i %>" id="loadimage<%=i %>" value="">
								<button id="removeImage<%=i %>" onclick="removePreview(event,<%=i %>)" class="remove-btn">✖</button>
							</div>
							<input type="file" name="img<%=i %>" id="imageUpload<%=i %>" accept="image/*" onchange="previewImage(event,<%=i %>)" style="display: block;">
						<%	}  %>	
					</div>
				</div>
				
				<div class="form-section">
	    		<h3>기본 정보</h3>
					<div class="form-group"">
						<label>상품명</label>
						<input type="text" name="title">
					</div>
					<div class="form-group">
						<label>카테고리</label>
						<div class="radio-group">
						<%
						if (arr == null || arr.size() == 0) {
							%><label>등록된 카테고리가 없습니다</label><%
						} else {
							for (int i = 0; i < arr.size(); i++) {
								if(i==0){
									%><label><input type="radio" name="category" value="<%=arr.get(i).getCategoryId()%>" checked="checked"><%=arr.get(i).getCategoryName()%></label><%
								}else{
									%><label><input type="radio" name="category" value="<%=arr.get(i).getCategoryId()%>"><%=arr.get(i).getCategoryName()%></label><%
								}
							}
						}
						%>
						</div>
					</div>
					<div class="form-group">
						<label>상품설명</label>
						<textarea rows="8" cols="45" name="content"></textarea>
					</div>
					<div class="form-group">
						<label>가격</label>
						<input type="text" name="price" value="0" onkeydown="return isNumberkey(event)" oninput="filterInvalidInput(event)">
					</div>
					<div class="form-group">
						<label>거래희망장소</label>
						<input type="text" name="location">
					</div>
				</div>
				<div class="form-section action-btns">
					<input type="reset" value="초기화" onclick="removeImg()">
					<input type="submit" name="tempsave" value="임시저장" onclick="return show()" formaction="temporarySave.jsp"> 
					<input type="submit" name="save" value="저장" onclick="return check()" formaction="writeSaleProduct_ok.jsp">
				</div>
			</div>
		</form>
    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>