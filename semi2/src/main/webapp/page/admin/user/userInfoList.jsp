<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.user.*" %>
<jsp:useBean id="udao" class="com.ksj.user.UserDAO"></jsp:useBean>

<%
String input = request.getParameter("input");
String select_str = request.getParameter("select");
int select = 0;
if(select_str!=null){
	if(select_str.equals("ID")){
		select = 1;
	}else if(select_str.equals("이름")){
		select = 2;
	}else if(select_str.equals("닉네임")){
		select = 3;
	}
}
//총 사용자 아이디 갯수
ArrayList<UserDTO> arr = udao.userList(select, input);
int totalCnt = arr.size();

//보여줄 리스트 수
int listSize = 10; 

//보여줄 페이지 수
int pageSize = 5; 

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//총 페이지 수
int totalPage = (totalCnt/listSize)+1;
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;
%>

<table>
	<thead>
		<tr>
			<th style="width: 120px; text-align: center;">ID</th>
			<th style="width: 120px; text-align: center;">이름</th>
			<th style="width: 120px; text-align: center;">닉네임</th>
			<th style="width: 150px; text-align: center;">주소</th>
			<th>E-mail</th>
			<th style="width: 120px; text-align: center;">가입일자</th>
			<th style="width: 30px;"><input type='submit' value='삭제'></th>
		</tr>
	</thead>
	<tbody>
		<%		
			if(arr==null || arr.size()==0){
				%>
				<tr>
					<td colspan='6' align='center'>등록된 사용자가 없습니다.</td>
				</tr>
				<%
			}else{
				for(int i=((cp-1)*listSize); i<((cp-1)*listSize)+listSize; i++){
					%>
					<tr>
						<td style="text-align: center;"><%=arr.get(i).getId() %></td>
						<td style="text-align: center;"><%=arr.get(i).getName() %></td>
						<td style="text-align: center;"><%=arr.get(i).getNickname() %></td>
						<td style="text-align: center;"><%=arr.get(i).getLocation() %></td>
						<td style="text-align: center;"><%=arr.get(i).getEmail() %></td>
						<td style="text-align: center;"><%=arr.get(i).getCreate_date() %></td>
						<td style="text-align: center;"><input type="checkbox" name='<%=arr.get(i).getId()%>'></td>
					<tr>
					<%
					if(i==totalCnt-1) break;
				}
			}
		%>
	</tbody>
	<tfoot>
		<tr>
			<td colspan='7' align='center'>
			<%
			
			if(userGroup!=0){
				%>
				<a href="userManagement.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>&input=<%=input %>&select=<%=select_str %>" style="color:black; font-size:10px; text-decoration:none">&lt;</a>
				<%
			}
			for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
				if(cp == i){
					%>&nbsp;&nbsp;<a href="userManagement.jsp?cp=<%=i%>&input=<%=input %>&select=<%=select_str %>" style="color:black; text-decoration:underline;"><%=i%></a>&nbsp;&nbsp;<%	
				}else{
					%>&nbsp;&nbsp;<a href="userManagement.jsp?cp=<%=i%>&input=<%=input %>&select=<%=select_str %>" style="color:black; text-decoration:none;"><%=i%></a>&nbsp;&nbsp;<%					
				}
				if(i==totalPage){
					break;
				}
			}
			if(((totalPage/pageSize)-(totalPage%pageSize==0?1:0))!=userGroup){
				%>
				<a href="userManagement.jsp?cp=<%=(userGroup+1)*pageSize+1%>&input=<%=input %>&select=<%=select_str %>" style="color:black; font-size:10px; text-decoration:none">&gt;</a>
				<%
			}
			%>
			</td>
		</tr>
	</tfoot>
</table>