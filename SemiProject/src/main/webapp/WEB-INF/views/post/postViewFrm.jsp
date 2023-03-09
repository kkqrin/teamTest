<%@page import="sp.post.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 기본 css -->
    <link rel="stylesheet" href="/css/liondefault.css"></link>
    <link rel="stylesheet" href="/css/footer.css"></link>
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- 제이쿼리 -->
    <script src="js/jquery-3.6.3.min.js"></script>
    <%
    Post p = (Post)request.getAttribute("p");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	*{
    margin: 0;
    padding: 0;
    outline: 0;
}

    .bs1{
    	width: 50px;
    }
    #login-modal{
    display: block;
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
    .midbox{
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
    
    
    .areabox>textarea{
    	width: 470px;
    	height: 300px;
    	float : right;
    	resize: none;
    	overflow: auto;
    }
</style>
<title>받은메세지</title>
</head>
<body>
		<div id="login-modal" class="modal-bg">
			<div class="modal-wrap page-content">
				<div class="modal-head">
					<h2>받은쪽지</h2>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
					<div class="modal-content">
						<div class="input-box heightbox shortbox">
							<span>보낸 사람 : </span> <span class="senderId">아이디</span>
							<span class="time">보낸시간 <%=p.getRegDate() %></span>
						</div>
						<div class="input-box heightbox">
							<label for="title">제목</label> <input type="text"
								name="title" id="title" class="input-form midbox"
								value="title" readonly>
						</div>
						<div class="input-box heightbox areabox">
							<label for="content" readonly>내용</label> <textarea ></textarea>
						</div>

					</div>
					<div class="modal-foot">
						<button type="submit" class="btn bc11">답장하기</button>
						<button type="button" class="btn bc1 modal-close">취소</button>
					</div>
			</div>
				<div class="modal-wrap hide-content">
				<div class="modal-head">
					<h2>받은쪽지</h2>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
					<div class="modal-content">
						<div class="input-box heightbox shortbox">
							<span>받을 사람 : </span> <span class="senderId">아이디</span>
							<span class="time">보낸시간 2023-03-01 11:22:34</span>
						</div>
						<div class="input-box heightbox">
							<label for="title">제목</label> <input type="text"
								name="title" id="title" class="input-form midbox"
								value="title">
						</div>
						<div class="input-box heightbox areabox">
							<label for="content">내용</label> <textarea ></textarea>
						</div>

					</div>
					<div class="modal-foot">
						<button type="button" class="btn bc11">하잇</button>
						<button type="button" class="btn bc1 modal-close">취소</button>
					</div>
			</div>
		</div>
    <script>
    $('.modal-close').on('click',function(){
    	self.close();
    });
    
    $('.modal-foot>button').on('click',function(){
        const index = $('.modal-foot>button').index(this);
            $('.page-content').hide();
            $('.hide-content').show();
    });




    //받는사람 입력할때 input의 value 비워주는것
    $('.hide-content>div>#message-title').on('click',function(){
        $(this).val("");
    });
    </script>
</body>
</html>