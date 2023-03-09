<%@page import="sp.board.vo.BoardComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sp.board.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Board b = (Board)request.getAttribute("b");
    	ArrayList<BoardComment>	commentList = (ArrayList<BoardComment>)request.getAttribute("commentList");
    	ArrayList<BoardComment>	reCommentList =	(ArrayList<BoardComment>)request.getAttribute("reCommentList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#boardView th,#boardView td{
	border: 1px solid #eee;
	}
	#boardContent{
		text-align: left;
		min-height: 300px
	}
	.inputCommentBox{
		magin:50px;
	}
	.inputCommentBox>form>ul{
		list-style-type: none;
		display : flex;
	}
	.inputCommentBox>form>ul>li:first-child{
		width: 15%;
		display : flex;
		justify-content: center;
		align-items: center;
	}
	.inputCommentBox>form>ul>li:first-child>span{
		font-size: 80px;
		color: #ccc;
	}
	.inputCommentBox>form>ul>li:nth-child(2){
		width: 75%;
	}
	.inputCommentBox>form>ul>li:nth-child(2)>textarea{
		height: 96px;
		min-height: 96px;
	}
	.inputCommentBox>form>ul>li:last-child{
		width: 10%;
	}
	.inputCommentBox{
		margin: 20px;
	}
	.commentBox{
		margin: 20px;
	}
	.inputReCommentBox{
		margin: 30px 0px;
		display: none;		
	}
	li>.bs4{
		width: 100%;
		height: 100%;
		margin-left: 10px; 
	}
</style>
</head>
<body>
		<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class='page-content'>
			<div class='page-title'></div>
			<table class="tbl" id="BoardView">
				<tr class="tr-3">
					<th colspan='6'><%=b.getBoardTitle() %></th>
				</tr>
				<tr class="tr-1">
					<th class="td-3">작성자</th>
					<td><%=b.getBoardWriter() %></td>
					<th class="td-3">작성일</th>
					<td><%=b.getRefDate() %></td>
					<th class="td-3">조회수</th>
					<td><%=b.getReadCount() %></td>
				</tr>
				<tr class="tr-1">
					<th class="td-3">첨부파일</th>
					<td colspan="5">
						<%if(b.getFileName() !=null){ %>
						<a href="/boardFileDown.do?boardNo=<%=b.getBoardNo()%>">
						<img src="/img/file.png" width="16px">
						<%=b.getFileName() %>
						</a>
						<%} %>
					</td>
				</tr>
				<tr class="tr-1">
					<td colspan="6">
						<div id="boardContent">
							<%=b.getBoardContentBr() %>
						</div>
					</td>
				</tr>
				<%if(m!=null && m.getMemberId().equals(b.getBoardWriter())){ %>
				<tr class="tr-1">
					<th colspan="6">
						<a class="btn bc44" href="/boardUpdateFrm.do?boardNo=<%=b.getBoardNo()%>">수정</a>
						<button class="btn bc44 boardDelete">삭제</button>
					</th>
				</tr>
				<%} %>
				</table>
	
				<%if(m != null){ %>			
				<div class="inputCommentBox">
					<form action="/insertBoardComment.do" method="post">
						<ul>
							<li>
								<span class="material-icons">account_box</span>
							</li> 
							<li>
								<input type="hidden" name="bcWriter" value="<%=m.getMemberId()%>">
								<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>">
								<input type="hidden" name="bcRef" value="0">
								<textarea name="bcContent" class="input-form"></textarea> 
							</li>
							<li>
								<button type="submit" class="btn bc1 bs4">등록</button>
							</li>					 		
						</ul>
					</form>
				</div>
			<%} %>
				<div class="commentBox">
				<%for(BoardComment bc : commentList){ %>
					<ul class="posting-comment">
						<li>
							<span class="material-icons">account_box</span>
						</li>
						<li>
							<p class="comment-info">
								<span><%=bc.getBcWriter()%></span>
								<span><%=bc.getBcDate()%></span>
							</p> 
							<p class="comment-content"><%=bc.getBcContent()%></p>
							<textarea name="bcContent" class="input-form" style="min-height: 96px;display: none"><%=bc.getBcContent() %></textarea>
							<p class="comment-link">
								<%if( m != null){ %>
									<%if(m.getMemberId().equals(bc.getBcWriter())){ %>
										<a href="javascript:void(0)" onclick="modifyComment(this,<%=bc.getBcNo()%>,<%=b.getBoardNo()%>);">수정</a>
										<a href="javascript:void(0)" onclick="deleteComment(this,<%=bc.getBcNo()%>,<%=b.getBoardNo()%>);">삭제</a>
									<%}//해당 댓글 수정조건 (댓글작성자가 로그인한 유저일때) %>
									<a href="javascript:void(0)" class="recShow">답글달기</a>
								<%} %>
							</p>							
						</li>
					</ul>
					<%for(BoardComment bcc : reCommentList){ %>
						<%if(bcc.getBcRef() == bc.getBcNo()){ %>
						<ul class='posting-comment reply'>
							<li>
								<span class="material-icons">subdirectory_arrow_right</span>
								<span class="material-icons">account_box</span>
							</li>
							<li>
								<p class='comment-info'>
									<span><%=bcc.getBcWriter() %></span>
									<span><%=bcc.getBcDate() %></span>
								</p>
								<p class="comment-content"><%=bcc.getBcContent() %></p>
								<textarea name="bcContent" class="input-form" style="min-height: 96px;display: none"><%=bcc.getBcContent() %></textarea>
								<p class="comment-link">
									<%if(m!=null && m.getMemberId().equals(bcc.getBcWriter())){ %>
										<a href="javascript:void(0)" onclick="modifyComment(this,<%=bcc.getBcNo()%>,<%=b.getBoardNo()%>);">수정</a>
										<a href="javascript:void(0)" onclick="deleteComment(this,<%=bcc.getBcNo()%>,<%=b.getBoardNo()%>);">삭제</a>
									<%} %>
								</p>
							</li>
						</ul>
						<%}//댓글번호체크 if문 %>
					<%} %>
					<%-- 댓글에 대한 대댓글 출력위치 --%>
						<%if(m != null){ %>
							<div class="inputCommentBox inputReCommentBox">
								<form action="/insertBoardComment.do" method="post">
									<ul>
										<li>
											<span class="material-icons">subdirectory_arrow_right</span>
										</li>
										<li>
											<input type="hidden" name="bcWriter" value="<%=m.getMemberId()%>">
											<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>">
											<input type="hidden" name="bcRef" value="<%=bc.getBcNo()%>">
											<textarea name="bcContent" class="input-form"></textarea> 
										</li>
										<li>
										<button type="submit" class="btn bc1 bs4">등록</button>
										</li>
									</ul>
								</form>
							</div>
						<%} %>
				<%}//댓글 출력 for문 끝나는 위치 %>
					</div>
				</div>
				<%@include file="/WEB-INF/views/common/footer.jsp" %>
				<script>
				$('.boardDelete').on('click',function(){
					if(confirm("게시글을 삭제하시겠습니까?")){
						location.href="/boardDelete.do?boardNo="+<%=b.getBoardNo()%>;
					}
				});

				
				$(".recShow").on("click",function(){
					const index = $(".recShow").index(this);
					if($(this).text() == '답글달기'){
						$(this).text('취소');
					}else{
						$(this).text('답글달기');
					}
					$(".inputReCommentBox").eq(index).toggle();
					$(".inputReCommentBox").eq(index).find("textarea").focus();
				});	
				
				function modifyComment(obj, bcNo, boardNo){
					//숨겨놓은 textarea 화면에 보여주기
					$(obj).parent().prev().show();
					$(obj).parent().prev().focus();
					//화면에 있던 댓글내용 (p태그)를 숨김
					$(obj).parent().prev().prev().hide();
					//수정 → 수정완료
					$(obj).text("수정완료");
					$(obj).attr("onclick","modifyComplete(this,"+bcNo+","+boardNo+")");
					//삭제 → 수정취소
					$(obj).next().text("수정취소");
					$(obj).next().attr("onclick","modifyCancel(this,"+bcNo+","+boardNo+")");
					//답글달기버튼 삭제
					$(obj).next().next().hide();
				}
				function modifyCancel(obj,bcNo,boardNo){
					$(obj).parent().prev().hide();//textarea 숨김
					$(obj).parent().prev().prev().show();
					$(obj).prev().text("수정");
					$(obj).text("삭제");
					$(obj).next().show();
					$(obj).prev().attr("onclick","modifyComment(this,"+bcNo+","+boardNo+")");
					$(obj).attr("onclick","deleteComment(this,"+bcNo+","+boardNo+")");

				}
				function modifyComplete(obj,bcNo,boardNo){
					//form태그를 생성해서 전송
					//댓글내용,댓글번호,공지사항번호
					//1.form태그 생성
					const form = $("<form style='display:none;' action='/updateBoardComment.do' method='post'></form>");
					//2.input태그 2개 숨김
					const bcNoInput = $("<input type='text' name='bcNo'>");
					bcNoInput.val(bcNo);
					const boardNoInput = $("<input type='text' name='boardNo'>");
					boardNoInput.val(boardNo);
					//3.textarea 
					const bcContent = $(obj).parent().prev().clone();
					//4. form태그에 input2개 textarea 모두 포함시키기
					form.append(bcNoInput).append(boardNoInput).append(bcContent);

					//5.생성된 form태그를 body태그에 추가
					$('body').append(form);
					//6.form태그 전송
					form.submit();
				}
				function deleteComment(obj,bcNo,boardNo){
					if(confirm("댓글을 삭제하시겠습니까?")){
						location.href="/deleteBoardComment.do?bcNo="+bcNo+"&boardNo="+boardNo;
					}
				}
				
				</script>
				
</body>
</html>