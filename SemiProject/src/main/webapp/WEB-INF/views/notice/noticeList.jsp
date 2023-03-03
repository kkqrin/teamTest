<%@page import="sp.notice.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	int start = (int)request.getAttribute("start");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.page-title{
		font-size : 40px;
		font-weight : bold;
	}
	.tr-0{
		border-bottom : 1px solid #EEEEEE;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">공지사항</div>
		<%--<%if(n!=null && n.getMemberNo() == 1) {%>--%>
		<a class="btn bc1 bs1" href="#">글쓰기</a>
		<%--<%} %>--%>
		<table class="tbl tbl-hover notice-tbl">
			<tr class="tr-1">
				<th style="width:10%">번호</th>
				<th style="width:45%">제목</th>
				<th style="width:15%">작성자</th>
				<th style="width:20%">작성일</th>
				<th style="width:10%">조회수</th>
			</tr>
			<%for(int i=0;i<list.size();i++) {%>
				<%Notice n = list.get(i); %>		
			<tr class="tr-0">
				<td><%=i+start %></td>
				<td>
					<a href="/noticeView.do?noticeNo=<%=n.getNoticeNo() %>">
						<%=n.getNoticeTitle() %>
					</a>
				<% if(n.getMemberNo() == 1) {%>
				<td>중고사자 관리자</td>
				<%} %>	
				<td><%=n.getEnrollDate() %></td>
				<td><%=n.getReadCount() %></td>
			</tr>
			<%} %>
		</table>
		<div id="pageNavi"><%=pageNavi %></div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>