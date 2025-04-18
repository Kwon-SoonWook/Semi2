<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ksj.ask.*" %>
<jsp:useBean id="adao" class="com.ksj.ask.AskDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"> <!-- 반응형 화면 변환 -->
<title>나의 문의</title>
<style>
body{
	height: auto;
	overflow: hidden;
}
/* 제목 */
h2 {
	color: #333;
    text-align: center;
    margin-bottom: 30px;
}

/* 테이블 스타일 */
table {
    width: 100%;
    max-width: 700px;
    margin: 0 auto;
    border-collapse: collapse;
    border-top: 3px double #393E46;
    border-bottom: 3px double #393E46;
    background-color: #fafafa;
}

/* 테이블 헤더 */
table th {
    background-color: #ddd;
    padding: 12px 8px;
    text-align: center;
    font-weight: bold;
    color: #333;
}

/* 테이블 데이터 셀 (추가적으로 필요 시 적용) */
table td {
    padding: 12px 10px;
}
input[type="submit"], input[type="reset"], input[type="button"] {
   background-color: #8c8c8c;
   color: white;
   border: none;
   padding: 5px 20px;
   font-size: 14px;
   border-radius: 5px;
   cursor: pointer;
   margin-top: 5px;
}
</style>
</head>
<%
String sid = (String)session.getAttribute("sid");
ArrayList<AskDTO> arr = adao.userAskList(sid);
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
<body>
<section>
	<article>
	<h2>나의 문의</h2>
	<form name='userAskList' action='askWrite.jsp'>
		<table>
			<caption style="text-align:right; margin-bottom: 10px;"><input type='submit' value='문의작성'></caption>
			<thead>
				<tr>
					<th style="text-align: center;">제목</th>
					<th style="width: 130px; text-align: center;">작성자</th>
					<th style="width: 130px; text-align: center;">작성일</th>
					<th style="width: 80px; text-align: center;">처리상태</th>
				</tr>
			</thead>
			<tbody>
				<%
				if(arr==null || arr.size()==0){
					%>
					<tr>
						<td colspan='5' align='center'>등록된 문의가 없습니다.</td>
					</tr>
					<%
				}else{
					for(int i=((cp-1)*listSize); i<((cp-1)*listSize)+listSize; i++){
						%>
						<tr>
							<td>
						<%
						if(arr.get(i).getAsk_type()==2){
							out.println("&nbsp");
						}
							%>
							<a href="userAskContent.jsp?ask_id=<%=arr.get(i).getAsk_id()%>&cp=<%=cp %>" style="color: black; text-decoration: none;"><%=arr.get(i).getAsk_title() %></a></td>
							<td style="text-align: center;"><%=arr.get(i).getAsk_user_id() %></td>
							<td style="text-align: center;"><%=arr.get(i).getAsk_date() %></td>
						<%if(arr.get(i).getAsk_type()==0){
							%>	
							<td style="color: red; text-align: center;">미처리</td>
							<%	
						}else if(arr.get(i).getAsk_type()==1){
							%>
							<td style="text-align: center;">처리완료</td>	
							<%
						}else if(arr.get(i).getAsk_type()==2){
							%>
							<td style="text-align: center;">문의답변</td>	
							<%
						}
						%>
						</tr>
						<%
						if(i==totalCnt-1) break;
					}
				}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan='5' align='center' style="padding: 5px 5px;">
					<%
					if(arr.size()==0){
						%>&nbsp;&nbsp;<a href="userAskList.jsp?cp=1" style="color:black; text-decoration:underline;">1</a>&nbsp;&nbsp;<%
					}else{
						if(userGroup!=0){
							%>
							<a href="userAskList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>" style="color:black; font-size:10px; text-decoration:none">&lt;</a>
							<%
						}
						for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
							if(cp == i){
								%>&nbsp;&nbsp;<a href="userAskList.jsp?cp=<%=i%>" style="color:black; text-decoration:underline;"><%=i%></a>&nbsp;&nbsp;<%	
							}else{
								%>&nbsp;&nbsp;<a href="userAskList.jsp?cp=<%=i%>" style="color:black; text-decoration:none;"><%=i%></a>&nbsp;&nbsp;<%					
							}
							if(i==totalPage){
								break;
							}
						}
						if(((totalPage/pageSize)-(totalPage%pageSize==0?1:0))!=userGroup){
							%>
							<a href="userAskList.jsp?cp=<%=(userGroup+1)*pageSize+1%>" style="color:black; font-size:10px; text-decoration:none">&gt;</a>
							<%
						}
					}
					%>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	</article>
</section>            
</body>
</html>
