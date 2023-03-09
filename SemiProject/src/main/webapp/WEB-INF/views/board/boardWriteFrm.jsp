<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file ="/WEB-INF/views/common/header.jsp" %>
		<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	<div class="page-content">
	<div class="page-title"></div>
			<form action="/boardWrite.do" method="post" enctype="multipart/form-data">
				<table class="tbl"id="boardWrite">
					<tr class="tr-1">
						<th class="td-1">제목</th>
						<td colspan="3">
							<input type="text" name="boardTitle" class="input-form">
						</td>
					</tr>
					<tr class="tr-1">
						<th class="td-1">작성자</th>
						<td><%=m.getMemberId()%>
						<input type="hidden" name="boardWriter" value="<%=m.getMemberId()%>">
						</td>
						<th class="td-1">첨부파일</th>
						<td><input type="file" name="upfile"></td>
					</tr>
					<tr class="tr-1">
						<td colspan="4" style="text-align : left;">
							<textarea id="boardContent" name="boardContent" class="input-form"></textarea>
						</td>
					</tr>
					<tr class="tr-1">
						<td colspan ="4">
							<button type="submit" class="btn bc1 bs4">등록</button>
						</td>
					</tr>
				</table>
			</form>
	</div>
	<script>
			$('#noticeContent').summernote({
				height : 300,
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files){
						uploadImage(files[0],this);
					}
				}
			});
			
			function uploadImage(file,editor){
				//ajax를 통해서 서버에 이미지 업로드
				//업로드된 이미지의 경로를 받아오는 역활
				//받아온이후 → editor에 이미지 경로를 전달해서 화면에 표현
				//form 태그의 역할
				const form = new FormData();
				/*
				<form>
					<input type="file" name="file">
				</form>
				*/
				form.append("file",file);
				$.ajax({
					url : "/boardUploadImage.do",
					type : "POST",
					data : form,
					processData : false,
					contentType : false,
					success : function(data){
						$(editor).summernote("insertImage",data);
					}
				});
				//processData : 전송하는 데이터를 기본적으로 문자열로 전송하게 세팅
				// → 파일전송을 위해서 기본값인 문자열전송을 제거
				//contentType : enctype="application/x-www-form-urlencoded;charset=UTf-8"
				// → 파일전송을 위해서 enctype 기본값을 제거
			}
		</script>
	<%@ include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>