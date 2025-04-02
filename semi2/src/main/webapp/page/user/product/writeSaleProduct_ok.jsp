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
<%
	String sid = (String)session.getAttribute("sid");
	String savepath = request.getRealPath("/page/user/product/img");
	ArrayList saveFiles = new ArrayList();
	ArrayList images = new ArrayList();
	MultipartRequest mr = new MultipartRequest(request,savepath,1024*1024*20,"utf-8",new DefaultFileRenamePolicy());
	Enumeration files = mr.getFileNames();
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
		saveFiles.add(mr.getFilesystemName(name));
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
	ProductDTO pdto = new ProductDTO(0,categoryid,buyerId,sellerId,price,title,content,location,tradeState,bbsState,(String)images.get(0),0,null,null,savepath);
	String msgProduct = pdao.productInsert(pdto)>0?"등록 성공":"등록 실패";
	for(int i=0;i<images.size();i++){
		ProductImagesDTO idto = new ProductImagesDTO((String)images.get(i),pdao.searchProductIdx());
		idao.addProductImages(idto);
	}
%>
<script>
window.alert('<%=msgProduct%>');
location.href='writeSaleProduct.jsp';
</script>

