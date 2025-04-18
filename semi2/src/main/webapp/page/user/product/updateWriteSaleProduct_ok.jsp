<%@page import="java.io.File"%>
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
<%
	String sid = (String)session.getAttribute("sid");
	String msgProduct = "로그인 후 이용해주세요";
if(sid==null){
	%>
	<script>
	window.alert('로그인 후 이용해주세요~');
	const login = confirm('로그인 하시겠습니까?');
	if(login == true){
		location.href = '/semi2/page/user/login/login.jsp';
	}
	</script>
	<%
	return;
}
	String savepath = request.getRealPath("/page/user/product/img");
	ArrayList<String> imagesIdArr = new ArrayList<String>();
	ArrayList saveFiles = new ArrayList();//저장된 파일이름을 저장하기위한 어레이 리스트
	ArrayList images = new ArrayList();//새로 추가된 이미지 이름을 저장하기위한 어레이 리스트
	MultipartRequest mr = new MultipartRequest(request,savepath,1024*1024*20,"utf-8",new DefaultFileRenamePolicy());
	String productId_s = mr.getParameter("productId");
	int productId = 0;
	if(productId_s!=null&&productId_s.length()!=0){
		productId = Integer.parseInt(productId_s);
	}
	Enumeration files = mr.getFileNames();
	for(int i=0;i<5;i++){
		if(mr.getParameter("loadimage"+i)!=null&&mr.getParameter("loadimage"+i).length()!=0){
			imagesIdArr.add(mr.getParameter("loadimage"+i));
		}
	}
	//불러온 이미지를 제외한 기존에있던 이미지 삭제
	if(imagesIdArr!=null&&imagesIdArr.size()!=0){
		ArrayList<ProductImagesDTO> imgArr = idao.ProductImagesList(productId, imagesIdArr);
		if(imgArr!=null&&imgArr.size()!=0){
			for(int i=0; i<imgArr.size(); i++){
				idao.deleteLoadProductImages(productId, imgArr.get(i).getProductImagesId());
				File f = new File(savepath+"\\"+imgArr.get(i).getProductImagesId());
				if(f.isFile()) {
					f.delete();
				}		
			}	
		}
	}else{
		ArrayList<ProductImagesDTO> imglist = idao.ProductImagesList(productId);
		if(imglist!=null&&imglist.size()!=0){
			idao.deleteProductImages(productId);
			for(int i=0;i<imglist.size();i++){
				File f = new File(savepath+"\\"+imglist.get(i).getProductImagesId());
				if(f.isFile()){
					f.delete();
				}
			}
		}
	}
	//파일저장
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
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
	for(int i=0;i<saveFiles.size();i++){
		if(!(saveFiles.get(i)==null||saveFiles.get(i).equals(""))){
			images.add(saveFiles.get(i));
		}
	}
	String imagePath = imagesIdArr.isEmpty() ? "":imagesIdArr.get(0).toString();
	ProductDTO pdto = new ProductDTO(productId,categoryid,buyerId,sellerId,price,title,content,location,0,0,imagePath,0,null,null,savepath);
	msgProduct = pdao.upadteProduct(pdto)>0?"수정 성공":"수정 실패";
	for(int i=0;i<images.size();i++){
		ProductImagesDTO idto = new ProductImagesDTO((String)images.get(i),productId);
		idao.addProductImages(idto);
	}
%>
<script>
window.alert('<%=msgProduct%>');
location.href='../main/index.jsp';
</script>
