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
//	MultipartRequest mr = new MultipartRequest(request,savepath,1024*1024*20,"utf-8");
/*	Enumeration files = mr.getFileNames();
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
		if(name==null||name.equals("")){
			continue;
		}
		saveFiles.add(mr.getFilesystemName(name));
	}
	*/
	String categoryIds = request.getParameter("category");
	int categoryid;
	if(categoryIds==null||categoryIds.length()==0){
		categoryid = 0;
	}else{
		categoryid = Integer.parseInt(categoryIds);		
	}
	String title= request.getParameter("title");
	String buyerId = "tnsdnr9331";
	String sellerId = sid;//(String)session.getAttribute("Id");
	String prices = request.getParameter("price");
	int price;
	if(prices==null||prices.length()==0){
		price= 0;
	}else{
		price = Integer.parseInt(prices);
	}
	String content = request.getParameter("content");
	String location = request.getParameter("location");
	int tradeState = 0;
	int bbsState=0;;
	int veiwCnt = 0;
	ProductDTO pdto = new ProductDTO(0,categoryid,buyerId,sellerId,price,title,content,location,tradeState,bbsState,null,0,null,null,null);
	String msgProduct = pdao.productInsert(pdto)>0?"등록 성공":"등록 실패";
	for(int i=0;i<5;i++){
		ProductImagesDTO idto = new ProductImagesDTO("추가예정",pdao.searchProductIdx());
	}
%>
<script>
window.alert('<%=msgProduct%>');
location.href='writeSaleProduct.jsp';
</script>

