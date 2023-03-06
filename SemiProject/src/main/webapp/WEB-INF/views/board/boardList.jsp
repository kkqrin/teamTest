<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.board-content{
		border: 1px solid black;
		box-sizing: border-box;
		height: 500px;
		width: 1000px;
		margin: 0 auto;
	}
	.countSpan{
		float: right;
	}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="page-content">
			<div class="board-content">
				<div class="board-top"><span class="countSpan">보기방식 <select name="listCount" id="listCount">
					<option value="10">10개</option>
					<option value="15">15개</option>
					<option value="20">20개</option>
				</select></span>
				</div>
				<div class="board-main">
					<table class="tbl tbl-hover notice-tbl">
						<tr class="tr-2">
							<th style="width: 10%">번호</th>
							<th style="width: 45%">제목</th>
							<th style="width: 15%">작성자</th>
							<th style="width: 20%">작성일</th>
							<th style="width: 10%">조회수</th>
						</tr>
						
					</table>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>