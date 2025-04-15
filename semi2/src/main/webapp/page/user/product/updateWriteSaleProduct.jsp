<%@page import="com.ksj.productimages.ProductImagesDTO"%>
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
<jsp:useBean id="pidao" class="com.ksj.productimages.ProductImagesDAO"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
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
		document.forms["writeSaleProduct"].enctype ="multipart/form-data";
}
function show(){
		<%for(int i=0;i<5;i++){
			%>
			var filename = document.writeSaleProduct.img<%=i%>.value;			
			if(filename!=""){
				  window.alert('임시저장은 이미지가 없어야 저장이 됩니다');
				  return false;
				}
			<%
			}
			%>
			document.forms["writeSaleProduct"].enctype ="application/x-www-form-urlencoded";
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
ArrayList<ProductImagesDTO> imgArr = pidao.ProductImagesList(productId);
if(pdto==null||pdto.equals("")){
	if(tpdto!=null){
		%>
		<script>
		window.onload =function(){
			document.writeSaleProduct.title.value = "<%=tpdto.getTitle()%>";
			document.writeSaleProduct.category.value = "<%=tpdto.getCategory_id()%>";
			document.writeSaleProduct.content.value = "<%=tpdto.getContent()%>";
			document.writeSaleProduct.price.value = "<%=tpdto.getPrice()%>";
			document.writeSaleProduct.location.value = "<%=tpdto.getWish_location()%>";
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
		<form name="writeSaleProduct" action="" method="post" enctype="multipart/form-data">
		<input type="hidden" name ="productId" value="<%=productId%>">
			<div>
				<div>
					<h2>상품정보</h2>
				</div>
				<div class="form-section">
					<h3>상품이미지(최대5개)</h3>
					<div class="image-grid">
						<%
							ArrayList<String> imgStringArr = new ArrayList<String>();
							imgStringArr.add(pdao.ProductList(productId).getThumb_image());
							for(int i=0;i<imgArr.size();i++){
								if(!(imgArr.get(i).getProductImagesId().equals(pdao.ProductList(productId).getThumb_image()))){
									imgStringArr.add(imgArr.get(i).getProductImagesId());
								}
							}
							for(int i=0;i<imgStringArr.size();i++){%>
								<div class="image-box" id="imageContainer<%=i%>" style="display:<%=imgStringArr.get(i)!=null? "block":"none"%>;">								
								    <img id="previewImage<%=i %>" alt="" src="img/<%=imgStringArr.get(i)%>" style="width: 150px; height: 150px;">
								    <input type="hidden" name="loadimage<%=i %>" id="loadimage<%=i %>" value="<%=imgStringArr.get(i)%>">
								    <button id="removeImage<%=i %>" onclick="removePreview(event,<%=i %>)"class="remove-btn">✖</button>
								 </div>
								 <input type="file" name="img<%=i %>" id="imageUpload<%=i %>" accept="image/*" onchange="previewImage(event,<%=i %>)" style="display:<%=imgStringArr.get(i)!=null?"none":"block" %>;"><%	
							}														
							for(int i=imgStringArr.size();i<5;i++){ %>
								<div class="image-box" id="imageContainer<%=i%>" style="display:none;">
									<img id="previewImage<%=i %>" src="" style="width: 150px; height: 150px;">
								    <input type="hidden" name="loadimage<%=i %>" id="loadimage<%=i %>">
									<button id="removeImage<%=i %>" onclick="removePreview(event,<%=i %>)" class="remove-btn">✖</button>
								</div>
					         	<input type="file" name="img<%=i %>" id="imageUpload<%=i %>"accept="image/*" onchange="previewImage(event,<%=i %>)" style="display: block;">
						<%  }%>	
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
						<input type="text" name="price" value="0">
					</div>
					<div class="form-group">
						<label>거래희망장소</label>
						<input type="text" name="location">
					</div>
				</div>
				<div class="form-section action-btns">
					<input type="reset" onclick="removeImg()" value="초기화">
					<!--<input type="submit" name="tempsave" value="임시저장" onclick="return show()" formaction="temporarySave.jsp"> 수정할때 임시저장할 필요는 없을거같음--> 
					<input type="submit" name="save" value="수정하기" onclick="return check()" formaction="updateWriteSaleProduct_ok.jsp">
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