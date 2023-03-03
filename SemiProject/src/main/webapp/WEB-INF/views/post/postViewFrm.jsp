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


.page-content{
    width: 500px;
    height: 500px;
    border: 1px solid black;
    margin: 0 auto;
}

.page-title{
    font-size: 30px;
}

.page-content>div{
    border: 1px solid black;
    box-sizing: border-box;
}

#message-content{
    margin: 10px 10px;
    resize: none;
    overflow: auto;
}
.hide-content{
    display: none;
}

.content-mid>p{
    font-size: 13px;
    float: right;
}

.content-mid{
    overflow: hidden;
}
	.btnDiv{
		width: 500px;
	}
	.btnDiv2>div,.btnDiv>div{
		width: 50%;
	}
	.page-title{
		padding-left: 10px;
	}

	.content-mid>p{
		margin: 0px 10px;
		line-height: 20px;
	}
	.content-mid>span{
		margin: 0px 10px;
		width: 60px;
	}
	.message-title>span{
		margin: 0px 10px;
		width: 60px;
		display: inline-block;
	}
	
	.input{
	width : 150px;
	height: 20px;
    padding: 0.8rem;
    background-color: #fff;
    outline: none;
    border: 1px solid #ccc;
    box-sizing: border-box;
    }
    
    .bs1{
    	width: 50px;
    }
</style>
<title>받은메세지</title>
<style>
	body{
		width: 500px;
		height: 500px;
	}
</style>
</head>
<body>
	<div class="page-content">
        <div class="page-title">받은 쪽지</div>
        <div class="content-mid"><span>보낸사람</span><input class="input"type="text" name="sender" id="sender" value="<%=p.getPostSender() %>" readonly><p class="time"><%=p.getRegDate() %></p><p>보낸 시간</p></div>
        <div class="message-title"><span>제목</span><input class="input" type="text" name="message-title" id="message-title" readonly value="<%=p.getPostTitle()%>"></div>
        <div class="message-content"><textarea name="message-content" id="message-content" readonly style="width: 478px; height: 206px; overflow: auto;"><%=p.getPostContent() %></textarea></div>
        <div class="btnDiv"><div class="btn bc1 bs1">답장</div><div class="btn bc1 bs1">취소</div></div>
    </div>
    <div class="hide-content">
        <div class="page-title">답장</div>
        <div class="content-mid"><span>보낸사람</span><input class="input" type="text" name="sender" id="sender" value="kh@naver.com" readonly></div>
        <div class="message-title"><span>제목</span><input class="input" type="text" name="message-title" id="message-title" value="메세지 제목"></div>
        <div class="message-content"><textarea name="message-content" id="message-content" style="width: 478px; height: 206px;"></textarea></div>
        <div class="btnDiv2"><div class="btn bc1 bs1">답장</div><div class="btn bc1 bs1">취소</div></div>
    </div>
    <script>
    $('.btnDiv>div').on('click',function(){
        const index = $('.btnDiv>div').index(this);
        if(index == 0){
            $('.page-content').hide();
            $('.hide-content').show();
        }else if(index == 1){
            self.close();
        }
    });


    $('.btnDiv2>div').on('click',function(){
        const index = $('.btnDiv2>div').index(this);
        if(index == 0){
        }else if(index == 1){
            self.close();
        }
    });

    //받는사람 입력할때 input의 value 비워주는것
    $('.hide-content>div>#message-title').on('click',function(){
        $(this).val("");
    });
    </script>
</body>
</html>