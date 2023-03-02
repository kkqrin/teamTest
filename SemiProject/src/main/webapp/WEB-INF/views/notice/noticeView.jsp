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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">공지사항</div>
		<table class="tbl" id="noticeView">
			<tr class="tr-3">
				<th colspan="6"><%=n.getNoticeTitle() %></th>
			</tr>
			<tr class="tr-1">
				<th class="td-1">작성자</th>
				<% if(n.getMemberNo() == 1) {%>
				<td>중고사자 관리자</td>
				<%} %>	
				<th class="td-1">작성일</th>
				<td><%=n.getEnrollDate() %></td>
				<th class="td-1">조회수</th>
				<td><%=n.getReadCount() %></td>
			</tr>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>