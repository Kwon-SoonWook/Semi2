<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ksj.tempproductimages.TempProductImagesDTO"%>
<%@page import="com.ksj.tempproduct.TempProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="tpdao" class="com.ksj.tempproduct.TempProductDAO"></jsp:useBean>
<jsp:useBean id="tidao" class="com.ksj.tempproductimages.TempProductImagesDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid = (String)session.getAttribute("sid");
if(sid==null){
	%>
	<script>
	window.alert('로그인 후 이용해주세요~');
	const login = confirm('로그인 하시겠습니까?');
	if(login == true){
		location.href = "../login/login.jsp"
	}
	</script>
	<%
	return;
}
String savepath = request.getRealPath("/page/user/product/img");
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
String msg = tpdao.deleteTempProduct(sid) > 0 ? "임시저장삭제성공" : "임시저장삭제실패";
%>
<script>
window.alert('<%=msg%>');
location.href='../main/index.jsp';
</script>