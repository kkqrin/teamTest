<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nq{
		margin-top : 10px;
		margin-bottom : 10px;
	}
	.nq-tab>ul{
    	list-style-type: none;
    	overflow: hidden;
	}
	.nq-tab>ul>li{
		width: calc(100%/3);
    	float: left;
    	height: 50px;
    	line-height: 30px;
    	border: 1px solid #ccc;
    	box-sizing: border-box;
    	text-align: center;
    	cursor: pointer;
	}
	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">자주묻는질문</div>
		<hr>
		<input id="nq" type="text" class="input-form bs5" placeholder="검색">
		<div class="nq-tab">
			<ul>
				<li class="btn bc22"><a href="#">전체</a></li>
				<li class="btn bc22"><a href="#">이용정책</a></li>
				<li class="btn bc22"><a href="#">공통</a></li>
				<li class="btn bc22"><a href="#">구매</a></li>
				<li class="btn bc22"><a href="#">판매</a></li>
				<li class="btn bc22"></li>
			</ul>
		</div>		
 	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>