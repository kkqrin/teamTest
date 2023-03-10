<%@page import="sp.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/admin.css"></link>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="/css/liondefault.css"></link>
    <script src="/js/jquery-3.6.3.min.js"></script>
    
   <div class="admin-menu">
        <p>관리자 페이지</p>
        <ul class="main-menu">
            <li>
			<a href="#" class="more">
           		 <span class="material-symbols-outlined person" style="color:#fff;">person</span>
           			 사용자 관리
           		 <span class="material-symbols-outlined chevron" style="color:#fff;">chevron_right</span>
       		</a>
                <ul class="sub-menu">
                    <li><a href="/adminPageGrade.do">회원등급 변경</a></li>
                    <li><a href="/dealList.do">전체 거래내역 조회</a></li>
                    <li><a href="/reportSelect.do">신고접수 리스트</a></li>
                </ul>
            </li>
            <li>
            <a href="#" class="more">
                <span class="material-symbols-outlined person" style="color:#fff;">tab_group</span>
                컨텐츠 관리
                <span class="material-symbols-outlined chevron" style="color:#fff;">chevron_right</span>
            </a>
            <ul class="sub-menu">
                <li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
                <li><a href="/boardList.do?reqPage=1&npp=10">커뮤니티</a></li>
                <li><a href="/noticeQuestionList.do?reqPage=1">자주묻는질문</a></li>
            </ul>
             </li>
        </ul>
    </div>
    <div>
        <div style="margin-left: 250px;">
			 <div class="site-logo">
                <a href="/">중고사자
                	<div class="site-img"><img src="/img/lion.png"></div>
                </a>
     </div>
		</div>
    </div>
    
<script>
    $(".more").on("click", function(){
        $(this).next().slideToggle();
    });

</script>
    