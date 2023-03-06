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
	#noticeWrite td, #noticeWrite th{
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
		<div class="page-title">공지사항 작성</div>
		<form action="/noticeWrite.do" method="post" enctype="multipart/form-data">
			<table class="tbl" id="noticeWrite">
				<tr class="tr-1">
					<th class="td-1">제목</th>
					<td colspan="3">
						<input type="text" name="noticeTitle" class="input-form">
					</td>
				</tr>
				<tr class="tr-0">
					<th class="td-1">작성자</th>
					<td>
						<input type="hidden" name="noticeWriter" value="1">
					</td>
					<th class="td-1">첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
				<tr class="tr-1">
					<td colspan="4" style="text-align:left;">
						<textarea id="noticeContent" name="noticeContent" class="input-form"></textarea>
					</td>
				</tr>
				<tr class="tr-1">
					<td colspan="4">
						<button type="submit" class="btn bc1 bs4">공지사항 작성</button>
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
		
		function uploadImage(file, editor){
			const form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "noticeUploadImage.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					$(editor).summernote("insertImage",data);					
				}
			});
			
		}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>