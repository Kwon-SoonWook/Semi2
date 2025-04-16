<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ksj.content.*"%>
<jsp:useBean id="bdao" class="com.ksj.content.BbsDAO"></jsp:useBean>
<%
String input = request.getParameter("input");
String select_str = request.getParameter("select");
int select = 0;
if(select_str!=null){
	if(select_str.equals("구분")){
		select = 1;
	}else if(select_str.equals("제목")){
		select = 2;
	}else if(select_str.equals("작성자")){
		select = 3;
	}
}
//총 게시글 수
ArrayList<BbsDTO> arr = bdao.bbsList(select, input);
int totalCnt;
if(arr==null || arr.size()==0){
	totalCnt = 0;
}else{
	totalCnt = arr.size();
}

//보여줄 리스트 수
int listSize = 10;

//보여줄 페이지 수
int pageSize = 5;

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//총 페이지 수
int totalPage = (totalCnt / listSize) + 1;
if (totalCnt % listSize == 0)
	totalPage--;

int userGroup = cp / pageSize;
if (cp % pageSize == 0) userGroup--;
%>

<table>
	<thead>
		<tr>
			<th style="width: 50px; text-align: center;">No</th>
			<th style="width: 120px; text-align: center;">구분</th>
			<th>제목</th>
			<th style="width: 100px; text-align: center;">작성자</th>
			<th style="width: 110px; text-align: center;">작성일</th>
			<th style="width: 70px; text-align: center;">조회수</th>
			<th style="width: 30px;"><input type='submit' value='삭제'></th>
		</tr>
	</thead>
	<tbody>
		<%
		if (arr == null || arr.size() == 0) {
		%>
		<tr>
			<td colspan='7' align='center'>등록된 게시글이 없습니다.</td>
		</tr>
		<%
		} else {
		for (int i = ((cp - 1) * listSize); i < ((cp - 1) * listSize) + listSize; i++) {
		%>
		<tr>
			<td style="text-align: center;"><%=arr.get(i).getBbs_idx()%></td>
			<%
			if(arr.get(i).getBbs_div()==0){
				%>
				<td style="text-align: center;">공지 (0)</td>
				<%
			}else if(arr.get(i).getBbs_div()==1){
				%>
				<td style="text-align: center;">자유 (1)</td>
				<%
			}else if(arr.get(i).getBbs_div()==2){
				%>
				<td style="text-align: center;">구매 (2)</td>
				<%	
			}
			%>
			<td style="text-align: center;"><%=arr.get(i).getTitle()%></td>
			<td style="text-align: center;"><%=arr.get(i).getBbs_id()%></td>
			<td style="text-align: center;"><%=arr.get(i).getCreate_date()%></td>
			<td style="text-align: center;"><%=arr.get(i).getView_cnt()%></td>
			<td style="text-align: center;"><input type="checkbox" name='<%=arr.get(i).getBbs_idx()%>'></td>
		<tr>
			<%
				if (i == totalCnt - 1)
					break;
				}
			}
			%>
		
	</tbody>
	<tfoot>
		<tr>
			<td colspan='7' align='center'>
				<%
				if(arr==null || arr.size()==0){
					%>&nbsp;&nbsp;<a
					href="contentList.jsp?cp=1&category=일반 게시글&input=<%=input%>&select=<%=select_str%>"
					style="color: black; text-decoration: underline;">1</a>&nbsp;&nbsp;<%	
				}else{
					if (userGroup != 0) {
					%> <a
					href="contentList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>&category=일반 게시글&input=<%=input%>&select=<%=select_str%>"
					style="color: black; font-size: 10px; text-decoration: none">&lt;</a>
					<%
					}
					for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
					if (cp == i) {
					%>&nbsp;&nbsp;<a
					href="contentList.jsp?cp=<%=i%>&category=일반 게시글&input=<%=input%>&select=<%=select_str%>"
					style="color: black; text-decoration: underline;"><%=i%></a>&nbsp;&nbsp;<%
					} else {
					%>&nbsp;&nbsp;<a
					href="contentList.jsp?cp=<%=i%>&category=일반 게시글&input=<%=input%>&select=<%=select_str%>"
					style="color: black; text-decoration: none;"><%=i%></a>&nbsp;&nbsp;<%
					}
					if (i == totalPage) {
					break;
					}
					}
					if (((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) != userGroup) {
					%> <a
					href="contentList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>&category=일반 게시글&input=<%=input%>&select=<%=select_str%>"
					style="color: black; font-size: 10px; text-decoration: none">&gt;</a>
					<%
					}	
				}
				%>
			</td>
		</tr>
	</tfoot>
</table>

