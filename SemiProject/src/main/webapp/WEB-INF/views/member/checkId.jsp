<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int result = (int)request.getAttribute("result");
    String memberId=(String)request.getAttribute("memberId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/default.css">
<script src="/js/jquery-3.6.3.min.js"></script>
<style>
	#check-container{
		text-align: center;
		padding-top: 50px;
		width:250px;
		margin: 0 auto;
	}
	.id-wrap{
		display: flex;
	}
	.id-wrap>input{
		width: 70%;
	}
	id-wrap>button{
	width: 30%;
	}
</style>

</head>
<body>
	<div id="check-container">
		<%if(result==0){%>
			<div>
			[<span class="fc-4 f-exbold"><%=memberId %></span>]는 사용 가능합니다.
			</div>
			<br>
			<button type="button" class="btn bc1" id="closeBtn">닫기</button>
			<script>
				$("#closeBtn").on("click",function(){
					const id = $(".fc-4").text();
					
					const inputId =$("#memberId",opener.document);
					inputId.val(id);
					self.close();
				});
			</script>
		<%}else if(result==1){ //result가 1인경우는 중복된 아이디임 checkIdservlet에서 그렇게 정했음%>
			[<span class="fc-6 f-bold" ><%=memberId %></span>]는 이미 사용중 입니다.
			<br><br>

			<form action="/checkId.do">
				<div class="id-wrap">
					<input type="text" name="checkId" class="input-form">
					<button type="submit" class="btn bc2">조회</button>
				</div>
			</form>
		<%} %>
	</div>
	
</body>
</html>