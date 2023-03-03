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
				<li id="all" class="btn bc22">전체</li>
				<li class="btn bc22">이용정책</li>
				<li class="btn bc22">공통</li>
				<li class="btn bc22">구매</li>
				<li class="btn bc22">판매</li>
				<li class="btn bc22"></li>
			</ul>
		</div>		
 	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	$("#all").on("click",function(){
		$.ajax({
			url : ""
		});
	});
	</script>
</body>
</html>