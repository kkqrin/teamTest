<%@page import="sp.board.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	int start = (int)request.getAttribute("start");
    	int npp = (int)request.getAttribute("npp");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.board-content{
		width: 1000px;
		margin: 0 auto;
		overflow: hidden;
	}
	.countSpan{
	line-height : 51px;
		float: right;
	}
	.pageNavi{
		margin: 20px 0px;
	}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="page-content">
			<div class="board-content">
				<div class="board-top">
				<%if(m != null){ %>
				<button class="bc1 bs1 boardWrite">게시글작성</button>
				<%} %>
				<span class="countSpan">보기방식 <select name="listCount" id="listCount">
					<%if(npp == 10){ %>
					<option value="10" selected>10개</option>
					<option value="15">15개</option>
					<option value="20">20개</option>
					<%}else if(npp == 15){ %>
					<option value="10">10개</option>
					<option value="15" selected>15개</option>
					<option value="20">20개</option>
					<%}else if(npp == 20){ %>
					<option value="10">10개</option>
					<option value="15">15개</option>
					<option value="20" selected>20개</option>
					<%}else %>
				</select></span></div>
				<div class="board-main">
					<table class="tbl tbl-hover notice-tbl">
						<tr class="tr-2">
							<th style="width:10%">번호</th>
							<th style="width:45%">제목</th>
							<th style="width:15%">작성자</th>
							<th style="width:20%">작성일</th>
							<th style="width:10%">조회수</th>
						</tr>
						<%for (int i=0;i<list.size();i++) { %>
						<%Board b = list.get(i); %>
							<tr class="tr-2">
								<th><%=i+start %></th>
								<th><a href="/boardView.do?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle() %>
								<%if(b.getFileName()!=null){ %>
								<img src="/img/file.png" width="16px">
								<%} %>
								</a></th>
								<th><%=b.getBoardWriter() %></th>
								<th><%=b.getRefDate() %></th>
								<th><%=b.getReadCount() %></th>
							</tr>
						<%} %>
					</table>
					<div class="pageNavi"><%=pageNavi %></div>
					
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		<script>

			$('#listCount').on('change',function(){
				const reqPage = $('.active-page').text();
				const npp = $(this).val();
				location.href="/boardList.do?reqPage="+reqPage+"&npp="+npp;
			});
			
			$('.boardWrite').on('click',function(){
				location.href="/boardWriteFrm.do";
			});
		</script>
</body>
</html>