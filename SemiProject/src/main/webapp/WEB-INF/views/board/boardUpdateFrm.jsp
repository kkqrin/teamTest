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
			<div class="page-content">
				<div class="page-title">공지사항 수정</div>
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
			</script>
		<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>