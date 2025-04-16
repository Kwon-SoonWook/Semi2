<%@page import="java.io.File"%>
<%@page import="com.ksj.tempproductimages.TempProductImagesDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.tempproduct.TempProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="tpdao" class="com.ksj.tempproduct.TempProductDAO"></jsp:useBean>
<jsp:useBean id="tidao" class="com.ksj.tempproductimages.TempProductImagesDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid = (String)session.getAttribute("sid");
String savepath = request.getRealPath("/page/user/product/img");

ArrayList saveFiles = new ArrayList();
ArrayList images = new ArrayList();

ArrayList<String> imagesIdArr = new ArrayList<String>();

MultipartRequest mr = new MultipartRequest(request, savepath, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
Enumeration files = mr.getFileNames();
for(int i=0;i<5;i++){
	if(mr.getParameter("loadimage"+i)!=null&&mr.getParameter("loadimage"+i).length()!=0){
		imagesIdArr.add(mr.getParameter("loadimage"+i));
	}
}
//불러온 이미지를 제외한 기존에있던 이미지 삭제
if(imagesIdArr!=null&&imagesIdArr.size()!=0){
	ArrayList<TempProductImagesDTO> imgArr = tidao.ProductImagesList(sid, imagesIdArr);
	if(imgArr!=null&&imgArr.size()!=0){
		for(int i=0; i<imgArr.size(); i++){
			tidao.deleteLoadProductImages(sid, imgArr.get(i).getTemp_product_images_id());
			File f = new File(savepath+"\\"+imgArr.get(i).getTemp_product_images_id());
			if(f.isFile()) {
				f.delete();
			}		
		}
	}
}else{
	ArrayList<TempProductImagesDTO> imglist = tidao.TempProductImagesList(sid);
	if(imglist!=null&&imglist.size()!=0){
		tidao.deleteProductImages(sid);
		for(int i=0;i<imglist.size();i++){
			File f = new File(savepath+"\\"+imglist.get(i).getTemp_product_images_id());
			if(f.isFile()){
				f.delete();
			}
		}
	}
}

while (files.hasMoreElements()) {
	String name = (String) files.nextElement();
	saveFiles.add(mr.getFilesystemName(name));
}
//기존에 불러온 이미지를 저장하기 위해 만들엇던 리스트 초기화 
imagesIdArr.clear();
//전체 사진 이름 저장
for(int i=0;i<5;i++){
	if(mr.getParameter("loadimage"+i)==null||mr.getParameter("loadimage"+i).equals("null")||mr.getParameter("loadimage"+i).length()==0){
		if(mr.getFilesystemName("img"+i)!=null&&mr.getFilesystemName("img"+i).length()!=0){
			imagesIdArr.add(mr.getFilesystemName("img"+i));
		}
	}else{
		imagesIdArr.add(mr.getParameter("loadimage"+i));
	}
}
String categoryIds = mr.getParameter("category");
int categoryid;
if (categoryIds == null || categoryIds.length() == 0) {
	categoryid = 0;
	System.out.println("null?");
} else {
	categoryid = Integer.parseInt(categoryIds);
}

String title = mr.getParameter("title");
String prices = mr.getParameter("price");
int price;
if (prices == null || prices.length() == 0) {
	price = 0;
} else {
	price = Integer.parseInt(prices);
}
String content = mr.getParameter("content");
String location = mr.getParameter("location");
for(int i=0;i<saveFiles.size();i++){
	if(!(saveFiles.get(i)==null||saveFiles.get(i).equals(""))){
		images.add(saveFiles.get(i));
	}
}
int result;
String imagePath = imagesIdArr.isEmpty() ? "": imagesIdArr.get(0).toString();
TempProductDTO dto = new TempProductDTO(sid, title, categoryid, content, price, location, imagePath, savepath);
if (tpdao.tempProductList(sid) == null) {
	result = tpdao.addTempProdcuct(dto);
} else {
	result = tpdao.updateTempProdcuct(dto);
}
String msg = result > 0 ? "임시저장성공" : "임시저장실패";
for(int i=0;i<images.size();i++){
	TempProductImagesDTO tidto = new TempProductImagesDTO((String)images.get(i),sid);
	tidao.addTempProductImages(tidto);
}
%>
<script>
window.alert('<%=msg%>');
location.href='../main/index.jsp';
</script>
