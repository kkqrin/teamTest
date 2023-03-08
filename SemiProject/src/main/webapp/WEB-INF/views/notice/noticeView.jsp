<%@page import="sp.notice.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Notice n = (Notice)request.getAttribute("n");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#noticeView th, #noticeView td{
		border : 1px solid #eee;
	}
	#noticeContent{
		text-align : left;
		min-height : 300px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">공지사항</div>
		<table class="tbl" id="noticeView">
			<tr class="bg-5">
				<th colspan="6"><%=n.getNoticeTitle() %></th>
			</tr>
			<tr class="tr-1">
				<th class="td-1">작성자</th>
				<% if(n.getMemberNo() == 1) {%>
				<td class="td-0">중고사자 관리자</td>
				<%} %>	
				<th class="td-1">작성일</th>
				<td class="td-0"><%=n.getEnrollDate() %></td>
				<th class="td-1">조회수</th>
				<td class="td-0"><%=n.getReadCount() %></td>
			</tr>
			<tr class="td-0">
				<th class="td-1">첨부파일</th>
				<td colspan="5">
					<%if(n.getFilename() != null) {%>			
					<img src="/img/file.png" width="16px">
					<a href="/noticeFileDown.do?noticeNo=<%=n.getNoticeNo() %>">
						<%=n.getFilename() %>
					</a>
					<%} %>
				</td>
			</tr>
			<tr class="td-0">
				<th colspan="6">
					<div id="noticeContent">
						<%=n.getNoticeContentBr() %>
					</div>
				</th>
			</tr>
			<%if(m!=null && m.getMemberGrade() == 1) {%>
			<tr class="tr-1">
				<th colspan="6">
					<a class="btn bc44" href="/noticeUpdateFrm.do?noticeNo=<%=n.getNoticeNo() %>">수정</a>
					<button class="btn bc44" onclick="noticeDelete(<%=n.getNoticeNo()%>);">삭제</button>
				</th>
			</tr>
			<%}%>
		</table>
		<script>
			function noticeDelete(noticeNo){
				if(confirm("게시글을 삭제하시겠습니까?")){
					location.href="/deleteNotice.do?noticeNo="+noticeNo;
				}
			}
		</script>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>