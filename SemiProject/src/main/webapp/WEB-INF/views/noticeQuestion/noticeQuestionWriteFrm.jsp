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
	#noticeQuestionWrite td, #noticeQuestionWrite th{
		border : 1px solid #ccc;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	
	<div class="page-content">
		<div class="page-title">자주묻는질문 작성</div>
		<form action="/noticeQuestionWrite.do" method="post">
			<table class="tbl" id="noticeQuestionWrite">
				<tr class="tr-1">
					<th class="td-1">제목</th>
					<td colspan="3">
						<input type="text" name="noticeQuestionTitle" class="input-form">
					</td>
				</tr>
				<tr class="tr-0">
					<th class="td-1">작성자</th>
					<td>
						<%=m.getMemberId() %>
						<input type="hidden" name="noticeQuestionWriter" value="<%=m.getMemberNo() %>">
					</td>
					<th class="td-1">유형</th>
					<td><select name="noticeQuestionCategory" id="noticeQuestionCategory" class="input-form">
						<option value="0">공통</option>
						<option value="1">이용정책</option>
						<option value="2">구매</option>
						<option value="3">판매</option>
					</select></td>
				</tr>
				<tr class="tr-1">
					<td colspan="4" style="text-align:left;">
						<textarea id="noticeQuestionContent" name="noticeQuestionContent" class="input-form"></textarea>
					</td>
				</tr>
				<tr class="tr-1">
					<td colspan="4">
						<button type="submit" class="btn bc1 bs4">자주묻는질문 작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		$("#noticeQuestionContent").summernote({
			height : 400,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		});
			
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>