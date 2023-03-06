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
		<form action="/noticeQuestionWrite.do" method="post" enctype="multipart/form-data">
			<table class="tbl" id="noticeQuestionWrite">
				<tr class="tr-1">
					<th class="td-3">제목</th>
					<td colspan="3">
						<input type="text" name="noticeQuestionTitle" class="input-form">
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-3">작성자</th>
					<td>
						<input type="hidden" name="noticeQuestionWriter" value="1">
					</td>
					<th class="td-3">유형</th>
					<td><input type="text" name="noticeQuestionCategory" class="input-form"></td>
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
		$("#noticeContent").summernote({
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