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
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page-content">
			<div class="page-title">수정</div>
			<form action="/noticeQuestionUpdate.do" method="post">
				<table class="tbl" id="noticeQuestionUpdateFrm">
					<tr class="tr-1">
						<th class="td-1">제목</th>
						<td>
							<input type="text" name="faqTitle" class="input-form" value="<%=nq.getFaqTitle()%>">
							<input type="hidden" name="status" value="stay">
							<input type="hidden" name="faqNo" value="<%=nq.getFaqNo() %>">
						</td>
					</tr>
					<tr class="tr-1">
						<th class="td-1">유형</th>
						<td><select name="faqCategory" id="faqCategory" class="input-form">
							<option value="0">공통</option>
							<option value="1">이용정책</option>
							<option value="2">구매</option>
							<option value="3">판매</option>
						</select></td>
					</tr>
					<tr class="tr-1">
						<th class="td-1">내용</th>
						<td>
							<textarea class="input-form" name="faqContent"><%=nq.getFaqContent() %></textarea>
						</td>
					</tr>
					<tr class="tr-1">
						<th colspan="2">
							<button type="submit" class="btn bc4 bs4">수정하기</button>						
						</th>
					</tr>
				</table>
			</form>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>