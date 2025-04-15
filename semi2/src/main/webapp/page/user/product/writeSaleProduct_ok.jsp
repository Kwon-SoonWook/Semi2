<%@page import="java.io.File"%>
<%@page import="com.ksj.tempproductimages.TempProductImagesDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="com.ksj.productimages.ProductImagesDTO"%>
<%@page import="com.ksj.product.ProductDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="pdao" class="com.ksj.product.ProductDAO"></jsp:useBean>
<jsp:useBean id="idao" class="com.ksj.productimages.ProductImagesDAO"></jsp:useBean>
<jsp:useBean id="tpdao" class="com.ksj.tempproduct.TempProductDAO"></jsp:useBean>
<jsp:useBean id="tidao" class="com.ksj.tempproductimages.TempProductImagesDAO"></jsp:useBean>
<%
	String sid = (String)session.getAttribute("sid");
	String savepath = request.getRealPath("/page/user/product/img");
	ArrayList saveFiles = new ArrayList();
	ArrayList images = new ArrayList();
	ArrayList<String> imagesIdArr = new ArrayList<String>();
	MultipartRequest mr = new MultipartRequest(request,savepath,1024*1024*20,"utf-8",new DefaultFileRenamePolicy());
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
	}
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
		saveFiles.add(mr.getFilesystemName(name));
	}
	//기존에 불러온 이미지를 저장하기 위해 만들엇던 리스트 초기화 
	imagesIdArr.clear();
	//전체 사진 이름 저장
	for(int i=0;i<5;i++){
		if(mr.getParameter("loadimage"+i)==null||mr.getParameter("loadimage"+i).length()==0){
			if(mr.getFilesystemName("img"+i)!=null&&mr.getFilesystemName("img"+i).length()!=0){
				imagesIdArr.add(mr.getFilesystemName("img"+i));
			}
		}else{
			imagesIdArr.add(mr.getParameter("loadimage"+i));
		}
	}
	
	String categoryIds = mr.getParameter("category");
	int categoryid;
	if(categoryIds==null||categoryIds.length()==0){
		categoryid = 0;
	}else{
		categoryid = Integer.parseInt(categoryIds);		
	}
	
	String title= mr.getParameter("title");
	String buyerId = null;
	String sellerId = sid;//(String)session.getAttribute("Id");
	String prices = mr.getParameter("price");
	int price;
	if(prices==null||prices.length()==0){
		price= 0;
	}else{
		price = Integer.parseInt(prices);
	}
	String content = mr.getParameter("content");
	String location = mr.getParameter("location");
	int tradeState = 0;
	int bbsState=0;;
	int veiwCnt = 0;
	for(int i=0;i<saveFiles.size();i++){
		if(!(saveFiles.get(i)==null||saveFiles.get(i).equals(""))){
			images.add(saveFiles.get(i));
		}
	}
	String imagePath = imagesIdArr.get(0).toString(); 
	ProductDTO pdto = new ProductDTO(0,categoryid,buyerId,sellerId,price,title,content,location,tradeState,bbsState,imagePath,0,null,null,savepath);
	String msgProduct = pdao.productInsert(pdto)>0?"등록 성공":"등록 실패";
	for(int i=0;i<imagesIdArr.size();i++){
		ProductImagesDTO idto = new ProductImagesDTO(imagesIdArr.get(i),pdao.searchProductIdx());
		idao.addProductImages(idto);
	}
	tidao.deleteProductImages(sid);
	tpdao.deleteTempProduct(sid);
%>
<script>
window.alert('<%=msgProduct%>');
location.href='../main/index.jsp';
</script>

