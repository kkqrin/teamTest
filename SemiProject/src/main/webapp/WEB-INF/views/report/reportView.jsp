<%@page import="sp.report.vo.Report"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Report r = (Report)request.getAttribute("r");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#boardView th, #boardView td{
		border : 1px solid #eee;
	}
	#boardContent{
		text-align : left;
		min-height : 300px;
	}
	
	
	.inputCommentBox{
		margin: 50px;
	}
	.inputCommentBox>form>ul{
		list-style-type: none;
		display:flex;
	}
	.inputCommentBox>form>ul>li:first-child{
		width : 15%;
		display : flex;
		justify-content : center;
		align-items : center;
	}
	.inputCommentBox>form>ul>li:first-child>span{
		font-size : 80px;
		color : #ccc;
	}
	.inputCommentBox>form>ul>li:nth-child(2){
		width : 75%;
	}
	.inputCommentBox>form>ul>li:nth-child(2)>textarea{
		height : 96px;
		min-height : 96px;
	}
	.inputCommentBox>form>ul>li:last-child{
		width : 10%;
	}
	.commentBox{
		margin : 50px
	}
	.inputReCommentBox{
		margin : 30px 0px;
		display : none;
	}
</style>
</head>
<body>
 		<%@include file="/WEB-INF/views/common/admin.jsp" %>
 		<div class="page-content">
		<div class="page-title">신고게시판</div>
		<table class="tbl" id="boardView">
			<tr class="tr-3">
				<th colspan="6">신고게시판</th>
			</tr>
			<tr class="tr-1">
				<th class="td-3">신고자</th>
				<td><%=r.getReportMember() %></td>
				<th class="td-3">작성일</th>
				<td><%=r.getEnrollDate() %></td>
				<th class="td-3">사기꾼</th>
				<td><%=r.getMemberId() %></td>
			</tr>
			<tr class="tr-1">
				<th class="td-3">첨부파일</th>
				<td colspan="5">
					<%if(r.getFilename() != null){ %>
					<img src="/img/file.png" width="16px">
					<a href="/boardFileDown.do?reportNo=<%=r.getReportNo() %>">
						<%=r.getFilename() %>
					</a>
					<%} %>
				</td>
			</tr>
			<tr class="tr-1">
				<td colspan="6">
					<div id="boardContent">
						<%=r.getReportContent() %>
					</div>
				</td>
			</tr>
			</table>
			</div>
</body>
</html>