<%@page import="sp.post.vo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	int start = (int)request.getAttribute("start");
    	int totalCount = (int)request.getAttribute("totalCount");
    	int notRead = (int)request.getAttribute("notRead");
    %>
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
		background-color: #fff;
    	color: #252a34;
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
		border: 1px solid #787f86;
		box-sizing: border-box;
		background-color: #fff;
    	color: #252a34;
    	padding-right: 10px;
    	border-top: 0;
    	border-right: 0;
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
	.bc02:hover {
	font-size : 0.8em;
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
		background-color: #fff;
    	color: #252a34;
    	line-height: 60px;
    	padding-right: 20px;
    	box-sizing: border-box;
    	border-bottom: 1px solid #787f86;    	
	}

	.th-btn,.th-img{
		width: 40px;
		height: 40px
	}
	.post-title{
		padding-left: 20px;
		width: 430px;
	}
	.post-id{
		padding-left: 20px;
	}
	
	table td,th{
		background-color: #fff;
    	color: #252a34;
    	font-size: 11px;
		
	}
	table{
		border-spacing: 0;
		margin-top: 10px 10px;
	}
	span{
	color: #252a34;
	}
	table th,.post-id,.post-content,.post-time{
		border-bottom: 1px solid #787f86;
		box-sizing: border-box;
	}
	.post-btn{
		width: 70px;
		text-align: center;
		background-color: #fff;
    	color: #252a34;
    	
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
	.th-btn{
		border-left: 1px solid #787f86;
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
            <div class="main-title"><span>알림</span>안읽은쪽지[ <span><%=notRead %></span> ]통 | 전체 쪽지 [ <span><%=totalCount %></span> ] 통</div>
            <div class="message">
                <table>
                <%for(int i=0;i<list.size();i++) {%>
                <% Post p = list.get(i); %>
                    <tr>
                        <th rowspan="2" class="th-btn"><input type="checkbox" name="check"></th>
                        <th rowspan="2" class="post-count"><%=p.getPostNo()  %></th>
                        <th rowspan="2" class="th-img">사진</th>
                        <td colspan="2" class="post-title"><%=p.getPostTitle() %></td>
                        <%if(p.getIdentify() == 1){ %>
                        <td class="read">안읽음</td>
                        <%}else{ %>
                        <td class="read">읽음</td>
                        <%} %>
                        <th rowspan="2" class="post-btn bc02">답장하기</th>
                        <th rowspan="2" class="post-btn bc02">삭제하기</th>
                    </tr>
              
                    <tr>
                        <td class="post-id"><%=p.getPostSender() %></td>
                        <td class="post-content"><%=p.getPostContent() %></td>
                        <td class="post-time"><%=p.getRegDate() %></td>
                    </tr>
                <%} %>
                </table>
                <div id="pageNavi"><%=pageNavi %></div>
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

	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>