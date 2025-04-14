<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.tempproduct.TempProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="tpdao" class="com.ksj.tempproduct.TempProductDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid = (String) session.getAttribute("sid");
String savepath = request.getRealPath("/page/user/product/img");
ArrayList saveFiles = new ArrayList();
ArrayList images = new ArrayList();
MultipartRequest mr = new MultipartRequest(request, savepath, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
Enumeration files = mr.getFileNames();

while (files.hasMoreElements()) {
	String name = (String) files.nextElement();
	saveFiles.add(mr.getFilesystemName(name));
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
int result;
String imagePath = (images.size() > 0) ? (String) images.get(0) : "";
TempProductDTO dto = new TempProductDTO(sid, title, categoryid, content, price, location, imagePath, savepath);
if (tpdao.tempProductList(sid) == null) {
	result = tpdao.addTempProdcuct(dto);
} else {
	result = tpdao.updateTempProdcuct(dto);
}
String msg = result > 0 ? "임시저장성공" : "임시저장실패";
%>
<script>
window.alert('<%=msg%>
	');
	location.href = 'writeSaleProduct.jsp';
</script>
