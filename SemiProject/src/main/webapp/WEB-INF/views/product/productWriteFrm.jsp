<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중 고 사 자</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- 텍스트 에디터, 한글지원 -->
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	
	<div class="page-content">
		<div class="page-title">판매상품 등록하기</div>
		<form action="/productWrite.do" method="post" enctype="multipart/form-data">
			<table class="tbl" id="productWrite">
				<!-- 한 행에 4칸 -->
				<tr class="tr-1">
					<!--<td><img src="#"></td>-->
					<td><button type="button" class="btn bc1 bs2">사진등록</button></td>
				</tr>
				<tr class="tr-1">
					<td>
						<input type="text" name="productTitle" class="input-form" placeholder="제목">
					</td>
				</tr>
				<tr class="tr-1">
					<td><input type="text" class="input-form"></td>
				</tr>
				<tr class="tr-1">
					<td colspan="4"><input type="text" class="input-form" placeholder="가격"></td>
				</tr>
				<tr class="tr-1">
					<td colspan="4" style="text-align:left;">
						<textarea id="productContent" name="productContent" class="input-form"></textarea>
					</td>
				</tr>
				<tr class="tr-1">
					<td colspan="4">
						<button type="submit" class="btn bc1 bs4">상품등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		$("#productContent").summernote({
			height : 400,
			lang : "ko-KR",
			// 이미지 업로드시 ajax 처리 -> 글 올려서 새로고침 하면 사라짐
			callbacks : {
				onImageUpload : function(files){
					uploadImage(files[0], this);
				}
			}
		});
		
		function uploadImage(file, editor){
			// ajax를 통해 서버에 이미지를 업로드
			// 업로드된 이미지의 경로를 받아오는 역할
			// 받아온 이후 -> editor에 이미지 경로를 전달해서 화면에 표현
			
			// <form> 태그의 역할
			const form = new FormData();
			form.append("file", file);
			/*
			<form>
				<input type="file" name="file">
			</form>
			*/
			
			$.ajax({
				url : "/uploadImage.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					// DB에 insert
					$(editor).summernote("insertImage", data);
				}
			});
			/*
			processData : 전송하는 데이터를 기본적으로 문자열로 전송하게 세팅 (default)
			 -> 파일 전송을 위해서 기본값인 문자열 전송을 제거(false)
			contentType : enctype="application/x-www-form-urlencoded;charset=UTF-8" (default)
			 -> 파일 전송을 위해서 enctype 기본값을 제거 (false)
			*/
			
		}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>