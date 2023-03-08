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
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">수정</div>
		<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data">
			<table class="tbl" id="noticeUpdateFrm">
				<tr class="tr-1">
					<th class="td-1">제목</th>
					<td>
						<input type="text" name="noticeTitle" class="input-form" value="<%=n.getNoticeTitle()%>">
						<input type="hidden" name="status" value="stay">
						<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>">
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-1">첨부파일</th>
					<td>
						<%if(n.getFilepath() != null) {%>
							<img src="/img/file.png" width="16px" class="delFile">
							<span class="delFile"><%=n.getFilename() %></span>
							<button type="button" class="btn bc1 delFile">삭제</button>
							<input type="file" name="upfile" style="display:none;">
							<input type="hidden" name="oldFilename" value="<%=n.getFilename() %>">
							<input type="hidden" name="oldFilepath" value="<%=n.getFilepath() %>">
						<%}else {%>
							<input type="file" name="upfile">
						<%} %>
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-1">내용</th>
					<td>
						<textarea class="input-form" name="noticeContent"><%=n.getNoticeContent() %></textarea>
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
	<script>
		$("button.delFile").on("click", function(){
			$(".delFile").hide();
			$(this).next().show();
			$("[name=status]").val("delete");
		});
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>