<%@page import="sp.noticeQuestion.vo.NoticeQuestion"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<NoticeQuestion> list = (ArrayList<NoticeQuestion>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	int start = (int)request.getAttribute("start");
    %>
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
	.tab>ul{
    	list-style-type: none;
    	overflow: hidden;
	}
	.tab>ul>li{
		width: calc(100%/3);
    	float: left;
    	height: 50px;
    	line-height: 30px;
    	border: 1px solid #ccc;
    	box-sizing: border-box;
    	text-align: center;
    	cursor: pointer;
	}
	.tab>ul>li.active-tab{
    	border-top: 3px solid black;
    	color: #000;
    	font-weight: bold;
    	border-bottom: none;
	}
	.tab-content>div{
    	padding: 50px 30px;
    	box-sizing: border-box;
    	display: none;
	}
	.tab-content>div.active-content{
    	display: block;
	}
	.nq-detail{
    	height: 100%;
    	overflow: hidden;
    	position: relative;
	}
	.page-title{
		font-size : 40px;
		font-weight : bold;
	}
	.tr-0{
		border-bottom : 1px solid black;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">자주묻는질문</div>
		<hr>
		<input id="nq" type="text" class="input-form bs5" placeholder="검색">
		<div class="tab">
			<ul>
				<li class="btn bc22 active tab">전체</li>
				<li class="btn bc22">공통</li>
				<li class="btn bc22">이용정책</li>
				<li class="btn bc22">구매</li>
				<li class="btn bc22">판매</li>
				<li class="btn bc22"></li>
			</ul>
		</div>
		<div class="tab-content">
			<div class="nq-detail">
			<%-- for --%>
			<%if(m!=null && m.getMemberNo() == 1) {%>
			<a class="btn bc1 bs1" href="/noticeQuestionWriteFrm.do">글쓰기</a>
			<%} %>
			<table class="tbl tbl-hover notice-tbl">
			<tr class="tr-1">
				<th style="width:15%">번호</th>
				<th style="width:35%">질문제목</th>
				<th style="width:20%">유형</th>
				<th style="width:20%">작성자</th>
				<th style="width:10%">조회수</th>
			</tr>
			<%for(int i=0;i<list.size();i++) {%>
				<%NoticeQuestion nq = list.get(i); %>
			<tr class="tr-1">
				<th><%=i+start %></th>
				<th>
					<a href="/noticeQuestionView.do?faqNo=<%=nq.getFaqNo() %>">
					<%=nq.getFaqTitle() %></a>
				</th>
				<%if(nq.getFaqCategory() == 0){ %>
				<th>공통</th>
				<%}else if(nq.getFaqCategory() == 1){ %>
				<th>이용정책</th>
				<%}else if(nq.getFaqCategory() == 2){ %>
				<th>구매</th>
				<%}else if(nq.getFaqCategory() == 3){ %>
				<th>판매</th>
				<%} %>
				<% if(nq.getMemberNo() == 1) {%>
				<th>중고사자 관리자</th>
				<%} %>
				<th><%=nq.getFaqCount()  %></th>
			</tr>
			<%} %>
			</table>
				<p>전체</p>
				<p>전체</p>
				<p>전체</p>
				<p>전체</p>
				<p>전체</p>
				<p>전체</p>
				<p>전체</p>
				<p>전체</p>
				<p>전체</p>
			</div>
			<div>
			<%-- for
					if() --%>
				<p>공통</p>
				<p>공통</p>
				<p>공통</p>
				<p>공통</p>
				<p>공통</p>
				<p>공통</p>
				<p>공통</p>
				<p>공통</p>
				<p>공통</p>
			</div>
			<div>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
				<p>이용정책</p>
			</div>
			<div>
				<p>구매</p>				
				<p>구매</p>
				<p>구매</p>
				<p>구매</p>
				<p>구매</p>
				<p>구매</p>
				<p>구매</p>
				<p>구매</p>
				<p>구매</p>
			</div>
			<div>
				<p>판매</p>
				<p>판매</p>
				<p>판매</p>
				<p>판매</p>
				<p>판매</p>
				<p>판매</p>
				<p>판매</p>
				<p>판매</p>
			</div>
		</div>		
 	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	const tabs = document.querySelectorAll(".tab>ul>li");
	tabs.forEach(function(tab,index){
		tab.addEventListener("click",function(){
			tabs.forEach(function(removeTab){
				removeTab.classList.remove("active-tab");
			})
			tab.classList.add("active-tab");
			const contents = document.querySelectorAll(".tab-content>div");
			contents.forEach(function(content){
				content.classList.remove("active-content");
			});
			contents[index].classList.add("active-content");
		});
	});
	
	window.onload = function(){
		const activeLi = document.querySelector(".tab>ul>li:first-child");
		const activeContent = document.querySelector(".tab-content>div:first-child");
		activeLi.classList.add("active-tab");
		activeContent.classList.add("active-content");
	}
	</script>
</body>
</html>