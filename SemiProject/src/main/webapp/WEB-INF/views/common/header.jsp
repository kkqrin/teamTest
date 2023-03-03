<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>중고사자</title>
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- 제이쿼리 -->
    <script src="/js/jquery-3.6.3.min.js"></script>
    <!-- 기본 css -->
    <link rel="stylesheet" href="/css/liondefault.css"></link>
    <link rel="stylesheet" href="/css/footer.css"></link>
    <!-- 기본 js -->
    <script src="/js/default.js"></script>
    <script src="/js/sweetalert.min.js"></script>
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- 제이쿼리 -->
    <script src="js/jquery-3.6.3.min.js"></script>


    <header>
        <div class="header-link">
            <a href="/postListNotRead.do?reqPage=1&memberId=admin" class="btn bc0">쪽지함</a>
            <a class="btn bc0">로그인</a>
            <a href="/WEB-INF/views/member/join.jsp" class="btn bc0">회원가입</a>
            <a href="/custmoService.do" class="btn bc0">고객센터</a>
        </div>
        <div class="header-top">
            <div class="site-logo">
                <a href="/">중고사자</a>
                <div class="site-img">
                    <img src="/img/lion (1).png">
                </div>
            </div>
            <div class="search-box">
                <input type="text" class="input-form" placeholder="검색어를 입력하세요.">
                <button type="submit" class="search-icon">
                    <span class="material-symbols-outlined">
                        search
                    </span>
                </button>
            </div>
            <div class="member-link">
                <a href="#" class="btn">
                    <span class="material-symbols-outlined">account_circle</span>
                    <p>마이페이지</p>
                </a>
                <a href="#" class="btn">
                    <span class="material-symbols-outlined">favorite</span>
                    <p>관심상품</p>
                </a>
                <a href="/insertProduct.do" class="btn">
	                <span class="material-symbols-outlined">edit</span>
                    <p>판매하기</p>
                </a>
            </div>
        </div>
        <nav>
            <ul class="navi naviHide">
                <li><a href="#">메뉴-1</a></li>
                <li class="category">
                    <a href="#">카테고리</a>
                </li>
                <li><a href="#">메뉴-3</a></li>
                <li><a href="#">메뉴-4</a></li>
                <li><a href="#">메뉴-5</a></li>
            </ul>
        </nav>
        <ul class="sub-navi naviHide">
            <div>
                <p>CATEGORY</p>
                <li><a href="#">수입명품</a></li>
                <li><a href="#">패션의류</a></li>
                <li><a href="#">모바일/태블릿</a></li>
                <li><a href="#">가구/인테리어</a></li>
                <li><a href="#">도서/음반/문구</a></li>
                
                <li><a href="#">패션잡화</a></li>
                <li><a href="#">가전제품</a></li>
                <li><a href="#">노트북/PC</a></li>
                <li><a href="#">카메라/캠코더</a></li>
                
                <li><a href="#">뷰티</a></li>
                <li><a href="#">리빙/생활</a></li>
                <li><a href="#">게임</a></li>
                <li><a href="#">반려동물/취미</a></li>
                
                <li><a href="#">출산/유아동</a></li>
                <li><a href="#">티켓/쿠폰</a></li>
                <li><a href="#">스포츠</a></li>
                <li><a href="#">레저/여행</a></li>
            </div>
        </ul>
    </header>
