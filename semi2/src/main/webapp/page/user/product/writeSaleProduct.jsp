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
	const login = confirm('로그인 하시겠습니까?');
	if(login == true){
		location.href = '/semi2/page/user/login/login.jsp';
	}
	</script>
	<%
    return;
}
%> 
<link rel="stylesheet" type="text/css" href="/semi2/page/user/main/mainLayout.css">
<style>
h2{
	text-align: center;
}
.form-section {
  border: 1px solid #ddd;
  padding: 20px;
  margin: 15px auto;
  width: 900px;
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
  margin-left: 80px;
}
.form-group label {
  display: block;
  font-weight: bold;
  margin-bottom: 8px;
}
.form-group2{
  margin-left: 80px;
}
.form-group2 label {
  display: block;
  font-weight: bold;
  margin-bottom: 8px;
}
.form-group2 input[type="text"],
.form-group2 textarea {
  width: 90%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}
label[for="price"] {
  display: inline-block; /* 블록 대신 인라인 요소로 변경 */
  margin-right: 10px; /* 오른쪽 여백 추가 */
  flex-wrap: wrap; /* 줄바꿈 방지 */

}

label[for="location"] {
  display: inline-block; /* 블록 대신 인라인 요소로 변경 */
  margin-left: 270px;  
}
.form-group input[type="text"],
.form-group textarea {
  width: 90%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}
#price {
  width: 30%;  /* `price` 입력칸 너비 조정 */
}

#location {
  margin-left: 60px;  
  width: 50%;  /* `location` 입력칸 너비 조정 */
}
.image-grid {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}
.image-grid input[type="file"] {
    width: 200px; /* 기존보다 크기 조정 */
}
.image-box {
  width: 198px;
  height: 250px;
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
.action-btns input[type="submit"]:disabled {
  background-color: #ccc;
  cursor: not-allowed; /* 클릭 불가능한 상태 */
  opacity: 0.6; /* 흐리게 표시 */
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
function idcheck(){
	var id = <%=sid%>;
	if(id==null||id==""){
		alert("로그인후 이용해주세요");
		return false;		  			
	}	
}
function tempInput(){
	var title = document.getElementById("title").value.trim();
	var content = document.getElementById("content").value.trim();
	var price = document.getElementById("price").value.trim();
	var location = document.getElementById("location").value.trim();
	var tempsavebtn = document.getElementById("tempsave");
	let hasImage = false; // 이미지 값 확인용 변수
	for(let i=0;i<5;i++){
		let temploadimage = document.getElementById("loadimage"+i).value;
		let tempimage = document.getElementById("imageUpload"+i).value;
		if(temploadimage ||tempimage){
			hasImage = true; // 이미지 값 확인용 변수
			break;
		}
	}
	tempsavebtn.disabled = !(title || content || price || location || hasImage);	
}
window.addEventListener("load", function(){
	//각 입력 필드에 직접 이벤트 추가
	document.getElementById("title").addEventListener("input", tempInput);
	document.getElementById("content").addEventListener("input", tempInput);
	document.getElementById("price").addEventListener("input", tempInput);
	document.getElementById("location").addEventListener("input", tempInput);

	// 이미지 입력 필드에도 이벤트 추가
	for (let i = 0; i < 5; i++) {
	    let loadImageElement = document.getElementById("loadimage" + i);
	    let imageUploadElement = document.getElementById("imageUpload" + i);
	    
	    if (loadImageElement) loadImageElement.addEventListener("input", tempInput);
	    if (imageUploadElement) imageUploadElement.addEventListener("input", tempInput);
	}
});

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
        var allowedKeys = ["Backspace", "Delete", "ArrowLeft", "ArrowRight","ArrowUp","ArrowDown", "Enter", "Tab","F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12","Escape","CapsLock","NumLock", "Insert", "End", "PageDown","PageUp","Home","Clear","Shift","Control","Alt"];
    	if(event.key >="0" && event.key <= "9"||allowedKeys.includes(event.key)){
    		return true;
    	}else{
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
				}%>
				tempInput();
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
	tempInput();
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
				<h2>상품등록</h2>
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
						<input type="text" name="title" id="title">
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
						<textarea rows="8" cols="45" name="content" id="content"></textarea>
					</div>
					<div class="form-group2">
						<label for="price">가격</label>
						<label for="location">거래희망장소</label>
					</div>
					<div class="form-group2">
						<input type="text" name="price" id="price" value="" onkeydown="return isNumberkey(event)" oninput="filterInvalidInput(event)">
						<input type="text" name="location" id="location">
					</div>
				</div>
				<div class="form-section action-btns">
					<input type="reset" value="초기화" onclick="removeImg()">
					<input type="submit" name="tempsave" id="tempsave" value="임시저장" onclick="return idcheck()" formaction="temporarySave.jsp" disabled >
					<%if(tpdao.tempProductList(sid)!=null){%> 
					<input type="submit" name="tempsavedelete" id="tempsavedelete" value="임시저장삭제" onclick="return idcheck()" formaction="temporarySaveDelete.jsp" >
					<%}%> 
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