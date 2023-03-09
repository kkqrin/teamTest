<%@page import="sp.post.vo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Post> list = (ArrayList<Post>) request.getAttribute("list");
String pageNavi = (String) request.getAttribute("pageNavi");
int start = (int) request.getAttribute("start");
int totalCount = (int) request.getAttribute("totalCount");
int notRead = (int) request.getAttribute("notRead");
int allCount = (int) request.getAttribute("allCount");
int index = (int) request.getAttribute("index");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.naviHide {
	display: none;
}

body>.page-modal {
	width: 1000px;
	overflow: hidden;
	background-color: #fff;
	color: #252a34;
}

.content-tab {
	width: 150px;
	float: left;
}

.content-tab>div {
	height: 40px;
	font-size: 20px;
	line-height: 40px;
	text-align: right;
	border: 1px solid #787f86;
	box-sizing: border-box;
	background-color: #fff;
	color: #252a34;
	padding-right: 10px;
	border-top: 0;
    border-right: 1px solid #787f86;
}

.content-main {
	width: 850px;
	float: left;
}

.content-main>* {
	box-sizing: border-box;
}

.bc1:hover {
	font-size: 1.3em;
}

.bc02:hover {
	font-size: 0.8em;
	cursor: pointer;
}

.bc3 {
	width: 140px;
}

.bc3:hover {
	font-size: 1.1em;
	cursor: pointer;
}

.main-title {
	text-align: right;
	height: 40px;
	background-color: #fff;
	color: #252a34;
	line-height: 60px;
	padding-right: 20px;
	box-sizing: border-box;
	border-bottom: 1px solid #787f86;
}

.th-btn, .th-img {
	width: 40px;
	height: 40px
}

.post-title {
	padding-left: 20px;
	width: 430px;
}

.post-id {
	padding-left: 20px;
}

table td, th {
	background-color: #fff;
	color: #252a34;
	font-size: 11px;
}

table {
	border-spacing: 0;
	margin-top: 10px 10px;
}

span {
	color: #252a34;
}

table th, .post-id, .post-content, .post-time {
	border-bottom: 1px solid #787f86;
	box-sizing: border-box;
}

.post-btn {
	width: 70px;
	text-align: center;
	background-color: #fff;
	color: #252a34;
}

.post-time {
	width: 170px;
	height: 20px;
	text-align: right;
	padding-right: 20px;
}

.read {
	text-align: right;
	padding-right: 20px
}

.hide-content {
	display: none;
}

.th-btn {
	border-left: 1px solid #787f86;
}

.post-content>div {
	width: 300px;
	height: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	line-height: 20px;
}
    .bs1{
    	width: 50px;
    }

    .shortbox{
    overflow: hidden;
    }
	.modal-content>.heightbox{
		height: 30px;
		padding: 10px;
		line-height: 30px;
		text-align: center;
	}
    
    .shortbox>*{
    	line-height : 40px;
    	float: left;
    }
    .time{
    float: right;
    }
    .senderId{
    	margin-left: 10px;
    }
   .heightbox>.midbox{
    	width: 470px;
    	height: 30px;
    	float: right;
    }
    .modal-content>.areabox{
    	height: 300px;
    	padding: 10px;
	    line-height: 30px;
	    text-align: center;

    }
    
    .notReadText{
    	width: 850px;
    	height: 30px;
    	text-align: center;
    	font-size: 25px;
    	border-bottom: 1px solid black;
    }
    
    .letterBox{
    	border-right: 1px solid black;
    }
   
    .areabox>textarea{
    	width: 470px;
    	height: 300px;
    	float : right;
    	resize: none;
    	overflow: auto;
    }
    


</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="content-tab">
			<div class="letterBox">쪽지함</div>
			<div class="letterBox bc1">안읽은 쪽지함</div>
			<div class="letterBox bc1">보낸 쪽지함</div>
			<div class="letterBox bc1">전체 보관함</div>
		</div>
		<div class="content-main">
			<div class="main-title">
				<input type="hidden" class="index" value="<%=index%>">
				<span>알림</span>안읽은쪽지[ <span><%=notRead%></span> ]통 | 전체 쪽지 [ <span><%=allCount%></span>
				] 통
			</div>
			<div class="message">
				<%if(list.size() == 0){ %>
				<table>
					<tr>
						<td colspan="8" class="notReadText">안읽은 쪽지가 없습니다.</td>
					</tr>
					</table>
				<%} %>
				<table>
					<%
					for (int i = 0; i < list.size(); i++) {
					%>
					<%
					Post p = list.get(i);
					%>
					<tr>
						<th rowspan="2" class="th-btn"><input type="checkbox"
							name="check"></th>
						<th rowspan="2" class="post-count"><%=i + start%></th>
						<th rowspan="2" class="th-img">사진</th>
						<td colspan="2" class="post-title"><%=p.getPostTitle()%></td>
						<%
						if (p.getIdentify() == 1) {
						%>
						<td class="read">안읽음</td>
						<%
						} else {
						%>
						<td class="read">읽음</td>
						<%
						}
						%>
						<th rowspan="2" class="post-btn bc02 modal-open-btn modalOpen"
							target="#login-modal">읽기<input type="hidden" value="<%=p.getPostNo()%>">
						</th>
						<th rowspan="2" class="post-btn bc02 dropPost">삭제하기</th>
					</tr>

					<tr>
						<td class="post-id"><%=p.getPostSender()%></td>
						<td class="post-content"><div><%=p.getPostContent()%></div></td>
						<td class="post-time"><%=p.getRegDate()%></td>
					</tr>
					<%
					}
					%>
				</table>
				<div id="pageNavi"><%=pageNavi%></div>
			</div>
		</div>
	</div>
		<div id="login-modal" class="modal-bg">
			<div class="modal-wrap page-modal">
				<div class="modal-head">
					<h2>받은쪽지</h2>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<div class="input-box heightbox shortbox">
						<span>보낸 사람 : </span> <span class="senderId"></span> <span
							class="time">보낸시간 <span></span></span>
					</div>
					<div class="input-box heightbox">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="input-form midbox title-post" value="title"
							readonly>
					</div>
					<div class="input-box heightbox areabox">
						<label for="content">내용</label>
						<textarea class='content-post' readonly></textarea>
					</div>
				</div>
				<div class="modal-foot">
					<button type="button" class="btn bc11">답장하기</button>
					<button type="button" class="btn bc11 modal-close">취소</button>
				</div>
			</div>
			<div class="modal-wrap hide-content">
			<div class="modal-head">
				<h2>받은쪽지</h2>
				<span class="material-icons close-icon modal-close">close</span>
			</div>
			<form action="/postSend.do" method="post">
			<div class="modal-content">
				<div class="input-box heightbox shortbox">
					<span>받을 사람 : </span> <span class="senderId">아이디</span> <span
						class="time">보낸시간 <span></span></span>
						<input type="hidden" id="postReseiver" name="postReseiver" >
						<input type="hidden" id="memberId" name="memberId" value="<%=m.getMemberId()%>">
				</div>
				<div class="input-box heightbox">
					<label for="title">제목</label> <input type="text" name="post-title"
						id="post-title" class="input-form midbox">
				</div>
				<div class="input-box heightbox areabox">
					<label for="content">내용</label>
					<textarea id="post-content" name="post-content"></textarea>
				</div>
			</div>
			<div class="modal-foot">
				<button type="submit" class="btn bc11">보내기</button>
				<button type="button" class="btn bc11 modal-close">취소</button>
			</div>
			</form>
		</div>
		</div>

	<script>
		$('.modalOpen').on('click',function() {
				const postNo = $('.modalOpen').eq($('.modalOpen').index(this)).children().val();
				const index = $('.index').val();
				$.ajax({
					url : "/postViewFrm.do",
					type : "post",
					data : {postNo : postNo,index : index},
					success : function(data){
						if(data != 0){
						const title = $('.post-title').eq(
						$('.modalOpen').index(this)).text();
						$('.title-post').val(title);
						const senderId = $('.post-id').eq($('.modalOpen').index(this)).text();
						$('.senderId').text(senderId);
						const content = $('.post-content').eq(
						$('.modalOpen').index(this)).text();
						$('.content-post').text(content);
						const time = $('.post-time').eq($('.modalOpen').index(this)).text();
						$('.time>span').text(time);
						$('#postReseiver').val(senderId);
						
						}
					}
				});
				});
		
		
		$('.dropPost').on('click',function(){
			const index =$('.dropPost').index(this); 
			const postNo = $('.dropPost').eq(index).prev().children().val();
			if(confirm("쪽지를 삭제하시겠습니까?")){
				location.href = "/deletePost.do?postNo="+postNo;
			}
		});
		
		$('.letterBox').on('click', function() {
			$('.message').hide();
			$('.message').eq($('.letterBox').index(this) - 1).show();
			if (($('.letterBox').index(this) - 1) == 0) {
				location.href = "/postListNotRead.do?reqPage=1&memberId=<%=m.getMemberId()%>&index=1"
			} else if (($('.letterBox').index(this) - 1) == 1) {
				location.href = "/postSendList.do?reqPage=1&memberId=<%=m.getMemberId()%>&index=2"
			} else if (($('.letterBox').index(this) - 1) == 2){
				location.href = "/postList.do?reqPage=1&memberId=<%=m.getMemberId()%>&index=3"
			}
		});

		$('.page-modal>.modal-foot>button').on('click',function(){
			if($('.page-modal>.modal-foot>button').index(this) == 0){
				$('#login-modal>.page-modal').hide();
				$('.hide-content').show();
			}
			
		});


	</script>
	

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>