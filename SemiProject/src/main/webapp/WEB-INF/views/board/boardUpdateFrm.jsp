<%@page import="sp.board.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Board b = (Board)request.getAttribute("b");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
			<div class="page-content">
				<div class="page-title"></div>
				<form action ="/boardUpdate.do" method="post" enctype="multipart/form-data">
					<table class="tbl" id="boardUpdateFrm">
						<tr class='tr-1'>
							<th class='td-3'>제목</th>
							<td>
								<input type="text" name="boardTitle" class="input-form" value="<%=b.getBoardTitle()%>">
								<input type="hidden" name = "status" value="stay">
								<input type="hidden" name = "boardNo" value="<%=b.getBoardNo()%>">
							</td>
						</tr>
						<tr class="tr-1">
							<th class="td-3">첨부파일</th>
							<td>
								<%if(b.getFilePath() != null){ %>
									<img src="/img/file.png" width="16px" class='delFile'>
									<span class="delFile"><%=b.getFileName() %></span>
									<button type="button" class="btn bc1 delFile">삭제하기</button>
									<input type="file" name="upfile" style="display:none;">		
									<input type="hidden" name = "oldFilename" value=<%=b.getFileName()%>>
									<input type="hidden" name = "oldFilepath" value=<%=b.getFilePath()%>>						
								<%}else{ %>
								<input type="file" name="upfile" value="<%=b.getFilePath() %>">
								<%} %>
							</td>
						</tr>
						<tr class="tr-1">
							<th class="td-3">내용</th>
							<td>
								<textarea class="input-form" name="boardContent"><%=b.getBoardContentBr() %></textarea>
							</td>
						</tr>
						<tr class="tr-1">
							<th colspan="2">
								<button type="submit" class="btn bc4 bs4">수정</button>
							</th>
						</tr>
					</table>
				</form>
			</div>
			<script>
				$("button.delFile").on("click",function(){
					$(".delFile").hide();
					$(this).next().show();
					$("[name=status]").val("delete");
				});
				
				$('[name=boardContent]').summernote({
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
		<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>