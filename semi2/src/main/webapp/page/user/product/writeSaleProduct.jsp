<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.category.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="cdao" class="com.ksj.category.CategoryDAO"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 680px;
}

body {
	margin: 0px auto;
	width: 680px;
}
</style>
<script>
var selectedFiles = [];

function addFile(input) {
    const files = input.files;
    if (files.length > 0) {
        for (let i = 0; i < files.length; i++) {
            if (selectedFiles.length < 5) { // 최대 5개 제한
                selectedFiles.push(files[i]);
                fileShow();
            } else {
                alert("최대 5개까지 업로드할 수 있습니다.");
                break;
            }
        }
    }
    input.value = ""; // 같은 파일 다시 선택 가능하도록 초기화
}
function fileShow(){
	document.getElementById('filelist').innerHTML="";
	for(let i =0;i< selectedFiles.length;i++){
		document.getElementById('filelist').innerHTML+='<li>'+selectedFiles[i].name+'<a href="#" onclick="removefile('+i+'); return false;">삭제</a></li>'
	}	
}
function removefile(index){
	selectedFiles.splice(index,1);
	fileShow();
}	
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
			var price = document.writeSaleProduct.price.value;
			  if(price==null||price==""){
			        alert("가격을 입력해주세요!");
			        return false;		  
			  }
			var ea = document.writeSaleProduct.ea.value;
				 if(ea==null||ea==""){
				      alert("수량을 입력해주세요!");
				      return false;		  
				  }
			var location = document.writeSaleProduct.location.value;
				 if(location==null||location==""){
					     alert("거래희망장소를 입력해주세요!");
					     return false;		  
				 }
}
</script>
</head>
<body>
	<%@include file="/page/user/main/header.jsp"%>
	<%
	ArrayList<CategoryDTO> arr = cdao.categoryList();
	%>
	<section>
		<article>
			<form name="writeSaleProduct" action="writeSaleProduct_ok.jsp" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>상품정보</th>
					</tr>
					<tr>
						<th>상품이미지(최대5개)</th>
						<td>
						<input type="file" name="img" accept="image/*" onchange="addFile(this)">
						<ui id="filelist"></ui>
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
							%><input type="radio" name="category" value="<%=arr.get(i).getCategoryId()%>"><%=arr.get(i).getCategoryName()%>
							<%
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
					<tr>
						<th>태그</th>
						<td><input type="text" name="tage"></td>
					</tr>
					<th>가격</th>
					<td><input type="text" name="price"></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="text" name="ea"></td>
					</tr>
					<tr>
						<th>거래희망장소</th>
						<td><input type="text" name="location"></td>
					</tr>
					<tr>
						<td colspan="3" align="right"><input type="reset" value="초기화">
							<input type="submit" name="tempsave" value="임시저장"> 
							<input type="submit" name="save" value="저장" onclick="return check()"></td>
					</tr>
				</table>
			</form>
		</article>
	</section>
	<%@include file="/page/user/main/footer.jsp"%>
</body>
</html>