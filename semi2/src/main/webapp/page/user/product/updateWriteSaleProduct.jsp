<%@page import="com.ksj.tempproductimages.TempProductImagesDTO"%>
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
body {
	margin: 0px auto;
    height: 100%;
}
ul {
    display: flex;
    gap: 10px; /* 요소 간 간격 설정 */
    list-style: none; /* 기본 리스트 스타일 제거 */
    padding: 0;
}
/* 전체 컨테이너 */
.productcontainer {
    padding: 20px;
    background: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

/* 제목 */
h2 {
    font-size: 24px;
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
}

/* 입력 폼 스타일 */
.form-group {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 15px;
}

/* 라벨 */
.form-group label {
    flex: 1;
    font-size: 16px;
    font-weight: bold;
    color: #444;
}

/* 입력 필드 */
.form-group input,
.form-group textarea {
    flex: 2;
    padding: 10px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

/* 파일 입력 필드 */
input[type="file"] {
    border: none;
}
.image-upload-wrapper {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    align-items: flex-start;
}

.image-upload-wrapper input[type="file"],
.image-upload-wrapper .image-preview {
    margin: 0;
}
.image-preview img {
    width: 150px;
    height: 150px;
    object-fit: cover;
}
.image-preview {
    position: relative;
}
.image-preview button {
    position: absolute;
    top: 5px;
    right: 5px;
    background: red;
    color: white;
    border: none;
    padding: 5px;
    cursor: pointer;
    font-size: 14px;
}
.submit-btn:hover {
    background: #e55a00;
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

if(pdto!=null){
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
		<div class="productcontainer">
			<form name="writeSaleProduct" action="" method="post" enctype="multipart/form-data">
			<input type="hidden" name ="productId" value="<%=productId%>">
					<div>
						<h2>상품정보</h2>
						<div class="form-group">
						<label>상품이미지(최대5개)</label>
						<div class="image-upload-wrapper">
						<%
							ArrayList<String> imgStringArr = new ArrayList<String>();
							imgStringArr.add(pdao.ProductList(productId).getThumb_image());
							for(int i=0;i<imgArr.size();i++){
								if(!(imgArr.get(i).getProductImagesId().equals(pdao.ProductList(productId).getThumb_image()))){
									imgStringArr.add(imgArr.get(i).getProductImagesId());
								}
							}
							for(int i=0;i<imgStringArr.size();i++){
								%>
								    <input type="file" name="img<%=i %>" id="imageUpload<%=i %>" accept="image/*" onchange="previewImage(event,<%=i %>)" style="display:<%=imgStringArr.get(i)!=null?"none":"block" %>;">
								    <div id="imageContainer<%=i %>" style="position: relative; display: <%=imgStringArr.get(i)!=null?"block" : "none" %>;">
								        <img id="previewImage<%=i %>" alt="" src="img/<%=imgStringArr.get(i)%>" style="width: 150px; height: 150px;">
								        <input type="hidden" name="loadimage<%=i %>" id="loadimage<%=i %>" value="<%=imgStringArr.get(i)%>">
								        <button id="removeImage<%=i %>" onclick="removePreview(event,<%=i %>)" style="
								            position: absolute; top: 5px; right: 5px; background: red; color: white;
								            border: none; padding: 5px; cursor: pointer; font-size: 14px;">
								            ✖
								        </button>
								    </div>
									<%	}														
							for(int i=imgArr.size();i<5;i++){ 
								%>
								    <input type="file" name="img<%=i %>" id="imageUpload<%=i %>"accept="image/*" onchange="previewImage(event,<%=i %>)" style="display: block;">
								    <div id="imageContainer<%=i %>" style="position: relative; display: none;">
								        <img id="previewImage<%=i %>" src="" style="width: 150px; height: 150px;">
								        <button id="removeImage<%=i %>" onclick="removePreview(event,<%=i %>)" style="
								            position: absolute; top: 5px; right: 5px; background: red; color: white;
								            border: none; padding: 5px; cursor: pointer; font-size: 14px;">
								            ✖
								        </button>
								    </div>
									<%	}							
						%>
						</div>	
						</div>
						</div>
				        <div class="form-group">
				        <label for="title">상품명</label>
				            <input type="text" id="title" name="title" placeholder="상품명을 입력하세요" required>
				        </div>
						<ul>
						<li>카테고리
						<%
						if (arr == null || arr.size() == 0) {
						%>
						등록된 카테고리가 없습니다</li>
						<%
						} else {
						%>
							<%
							for (int i = 0; i < arr.size(); i++) {
								if(i==0){
									%><input type="radio" name="category" value="<%=arr.get(i).getCategoryId()%>" checked="checked"><%=arr.get(i).getCategoryName()%><%
								}else{
							%><input type="radio" name="category" value="<%=arr.get(i).getCategoryId()%>"><%=arr.get(i).getCategoryName()%>
							<%
								}
							}
							%>
						</li>
						<%
						}
						%>
					</ul>
			        <div class="form-group">
			            <label for="description">상품 설명</label>
			            <textarea id="content" name="content" rows="4" placeholder="상품 설명을 입력하세요" required></textarea>
			        </div>
			        <div class="form-group">
			            <label for="price">가격</label>
			            <input type="number" id="price" name="price" placeholder="가격 입력" required>
			        </div>
			        <div class="form-group">
			            <label for="location">거래 장소</label>
			            <input type="text" id="location" name="location" placeholder="거래 장소 입력" required>
			        </div>
			        </tbody>
				</div>
					<input type="reset" value="초기화" onclick="removeImg()">
					<!--<input type="submit" name="tempsave" value="임시저장" onclick="return show()" formaction="temporarySave.jsp"> 수정할때 임시저장할 필요는 없을거같음--> 
					<input type="submit" name="save" value="수정하기" onclick="return check()" formaction="updateWriteSaleProduct_ok.jsp"></td>
			</form>
			</div>
    </main>   
</div>
</body>
<footer>
<%@include file="/page/user/main/footer.jsp" %>
</footer>
</html>