<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>
<jsp:useBean id="udto" class="com.ksj.user.UserDTO"></jsp:useBean>

<%


String savepath = request.getRealPath("/page/user/login/profile");
MultipartRequest mr = new MultipartRequest(request,savepath,1024*1024*30,"utf-8",new DefaultFileRenamePolicy());

/*multipartrequest 이용 시 jsp:setProperty 불가, request.getParameter 방식 불가*/
udto.setId(mr.getParameter("id"));
udto.setName(mr.getParameter("name"));
udto.setPwd(mr.getParameter("pwd"));
udto.setEmail(mr.getParameter("email"));
udto.setNickname(mr.getParameter("nickname"));
udto.setLocation(mr.getParameter("location"));

String profile = mr.getFilesystemName("profile");
if (profile != null) {
    udto.setProfile_uri("semi2/page/user/login/profile/" + profile);
} else {
	//이미지 변동 없을 때 이전 값 불러오기
	udto.setProfile_uri(udao.KeepProfile(mr.getParameter("id")));
}

int result=udao.UpdateMyinfo(udto);
String msg = result>0?"정보수정 성공": "성보수정 실패";


%>

<script>
window.alert('<%=msg%>');
location.href='mypage.jsp';
</script>
