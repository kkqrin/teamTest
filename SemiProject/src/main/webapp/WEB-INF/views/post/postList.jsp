<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.naviHide{
		display: none;
	}
	body>.page-content{
		width: 1000px;
		overflow: hidden;
		background-color: #252a34;
    	color: #fff;
	}
	
	.content-tab{
		width: 150px;
		float: left;

	}
	.content-tab>div{
		height: 40px;
		font-size: 20px;
		line-height: 40px;
		text-align : right;
		border: 1px solid black;
		box-sizing: border-box;
		background-color: #252a34;
    	color: #fff;
    	padding-right: 10px;
    	border-top: 0;
	}
	.content-main{
		width: 850px;
		float: left;		
	}
	.content-main>*{
			box-sizing: border-box;
	
	}
	.bc1:hover {
	font-size : 1.3em;
	}
	.bc2:hover {
	font-size : 1.1em;
	cursor: pointer;
	}
	.bc3{
	width: 140px;
	}
	.bc3:hover{
	font-size : 1.1em;
	cursor: pointer;
	}
	.main-title{
		text-align: right;
		height: 40px;
		background-color: #252a34;
    	color: #fff;
    	line-height: 60px;
    	padding-right: 20px;
    	box-sizing: border-box;
    	border: 1px solid black;
    	border-left: 0;
    	
	}

	.th-btn,.th-img{
		width: 40px;
		height: 40px
	}
	.post-title{
		padding-left: 20px;
		width: 400px;
	}
	.post-id{
		padding-left: 20px;
	}
	
	table td,th{
		background-color: #252a34;
    	color: #fff;
    	font-size:10px;
		
	}
	table{
		border-spacing: 0;
		margin-top: 10px 10px;
	}
	span{
	color: #fff;
	}
	table th,.post-id,.post-content,.post-time{
		border-bottom: 1px solid black;
		box-sizing: border-box;
	}
	.post-btn{
		width: 70px;
		text-align: center;
		background-color: #252a34;
    	color: #fff;
    	
	}
	.post-time{
		width: 170px;
		height: 20px;
		text-align: right;
		padding-right : 20px;
	}
	.read{
	text-align: right;
	padding-right: 20px
	}
	.message{
	display: none;
	}
</style>
</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="content-tab">
            <div class="letterBox">쪽지함</div>
            <div class="letterBox bc1">받은 쪽지함</div>
            <div class="letterBox bc1">보낸 쪽지함</div>
            <div class="letterBox bc1">전체 보관함</div>
        </div>
        <div class="content-main">
            <div class="main-title"><span>알림</span>안읽은쪽지[ <span>0</span> ]통 | 전체 쪽지 [ <span>10</span> ] 통</div>
            <div class="message">
                <table>
                    <tr>
                        <th rowspan="2" class="th-btn"><input type="checkbox" name="check"></th>
                        <th rowspan="2" class="post-count">1</th>
                        <th rowspan="2" class="th-img">사진</th>
                        <td colspan="2" class="post-title">받은쪽지함</td>
                        <td class="read">안읽음</td>
                        <th rowspan="2" class="post-btn bc2">답장하기</th>
                        <th rowspan="2" class="post-btn bc2">삭제하기</th>
                    </tr>
                    <tr>
                        <td class="post-id">발신자</td>
                        <td class="post-content">아 언제하냐 힘들다</td>
                        <td class="post-time">2023-02-27 09:15:17</td>
                    </tr>
                       <tr>
                        <th rowspan="2" class="th-btn"><input type="checkbox" name="check"></th>
                        <th rowspan="2" class="post-count">2</th>
                        <th rowspan="2" class="th-img">사진</th>
                        <td colspan="2" class="post-title">받은쪽지함</td>
                        <td class="read">안읽음</td>
                        <th rowspan="2" class="post-btn bc2">답장하기</th>
                        <th rowspan="2" class="post-btn bc2">삭제하기</th>
                    </tr>
                    <tr>
                        <td class="post-id">발신자</td>
                        <td class="post-content">아 언제하냐 힘들다</td>
                        <td class="post-time">2023-02-27 09:15:17</td>
                    </tr>
                    <tr>
                        <th rowspan="2" class="th-btn"><input type="checkbox" name="check"></th>
                        <th rowspan="2" class="post-count">3</th>
                        <th rowspan="2" class="th-img">사진</th>
                        <td colspan="2" class="post-title">받은쪽지함</td>
                        <td class="read">안읽음</td>
                         <th rowspan="2" class="post-btn bc2">답장하기</th>
                        <th rowspan="2" class="post-btn bc2">삭제하기</th>
                    </tr>
                    <tr>
                        <td class="post-id">발신자</td>
                        <td class="post-content">아 언제하냐 힘들다</td>
                        <td class="post-time">2023-02-27 09:15:17</td>
                    </tr>
                </table>
            </div>
      
            </div>
            <script>
            	$('.letterBox').on('click',function(){
            		$('.message').hide();
            		$('.message').eq($('.letterBox').index(this)-1).show();
            	});
            	
            	$('.letterBox').eq(0).click();
            </script>
	</div>
	</div>
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>