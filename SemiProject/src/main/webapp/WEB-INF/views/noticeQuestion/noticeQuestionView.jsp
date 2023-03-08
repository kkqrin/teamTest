<%@page import="sp.noticeQuestion.vo.NoticeQuestion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	NoticeQuestion nq = (NoticeQuestion)request.getAttribute("nq");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#noticeQuestionView th, #noticeQuestionView td{
		border : 1px solid #eee;
	}
	#noticeQuestionContent{
		text-align : left;
		min-height : 300px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">자주묻는질문</div>
		<table class="tbl" id="noticeQuestionView">
			<tr class="bg-5">
				<th colspan="6"><%=nq.getFaqTitle()%></th>
			</tr>
			<tr class="tr-1">
				<th class="td-1">작성자</th>
				<% if(nq.getMemberNo() == 1) {%>
				<td class="td-0">중고사자 관리자</td>
				<%} %>	
				<th class="td-1">번호</th>
				<td class="td-0"><%=nq.getFaqNo() %></td>
				<th class="td-1">조회수</th>
				<td class="td-0"><%=nq.getFaqCount() %></td>
			</tr>
			<tr class="tr-1"> 
				<th class="td-1">유형</th>
				<% if(nq.getFaqCategory() == 0) {%>
				<td class="td-0" colspan="5">공통</td>
				<%} else if(nq.getFaqCategory() == 1) {%>
				<td class="td-0" colspan="5">이용정책</td>
				<%} else if(nq.getFaqCategory() == 2) {%>
				<td class="td-0" colspan="5">구매</td>
				<%} else if(nq.getFaqCategory() == 3) {%>
				<td class="td-0" colspan="5">판매</td>
				<%} %>
				
			</tr>
			<tr class="td-0">
				<th colspan="6">
					<div id="noticeQuestionContent">
						<%=nq.getFaqContentBr() %>
					</div>
				</th>
			</tr>
			<%if(m!=null && m.getMemberGrade() == 1) {%>
			<tr class="tr-1">
				<th colspan="6">
					<a class="btn bc44" href="/noticeQuestionUpdateFrm.do?faqNo=<%=nq.getFaqNo() %>">수정</a>
					<button class="btn bc44" onclick="noticeQuestionDelete(<%=nq.getFaqNo()%>);">삭제</button>
				</th>
			</tr>
			<%}%>
		</table>
		<script>
			function noticeQuestionDelete(faqNo){
				if(confirm("게시글을 삭제하시겠습니까?")){
					location.href="/deleteNoticeQuestion.do?faqNo="+faqNo;
				}
			}
		</script>
	</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>