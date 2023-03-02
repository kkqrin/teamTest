<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/admin.css"></link>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <script src="/js/jquery-3.6.3.min.js"></script>
    
   <div class="admin-menu">
        <p>관리자 페이지</p>
        <ul class="main-menu">
            <li>
                <a href="#" class="more">
                    <span class="material-symbols-outlined person">person</span>
                    사용자 관리
                    <span class="material-symbols-outlined chevron">chevron_right</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="#">회원등급 변경</a></li>
                    <li><a href="#">전체 거래내역 조회</a></li>
                    <li><a href="#">신고접수 리스트</a></li>
                </ul>
            </li>
            <li>
            <a href="#" class="more">
                <span class="material-symbols-outlined person">tab_group</span>
                컨텐츠 관리
                <span class="material-symbols-outlined chevron">chevron_right</span>
            </a>
            <ul class="sub-menu">
                <li><a href="#">공지사항</a></li>
                <li><a href="#">자유게시판</a></li>
                <li><a href="#">자주묻는질문</a></li>
            </ul>
             </li>
        </ul>
    </div>
    <div>
        <div style="margin-left: 250px;">내용</div>
    </div>
<script>
    $(".more").on("click", function(){
        $(this).next().slideToggle();
    });

</script>
    