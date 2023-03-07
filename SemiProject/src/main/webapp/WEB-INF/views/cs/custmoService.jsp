<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.btn{
		margin-bottom : 10px;
		font-size : 30px;
		border : 1px solid #fff;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
	
	<h1>고객센터</h1>
	<a href="/noticeList.do?reqPage=1" class="btn bc11">공지사항</a><br>
	<a href="/noticeQuestionList.do?reqPage=1" class="btn bc11">자주묻는질문</a><br>
	<a href="#" class="btn bc11">신고접수</a>
	<a href="/noticeQuestion.do" class="btn bc11">자주묻는질문</a><br>
	<a href="#" class="btn bc11">신고접수</a>

	
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>