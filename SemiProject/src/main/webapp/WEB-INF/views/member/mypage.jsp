<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/mypage.css">
    <link rel="stylesheet" href="css/liondefault.css">
    <script src="/js/jquery-3.6.3.min.js"></script>
    <style>
    .mypage-home-title1{
    	padding-left:200px;
    }
    </style>   
</head>
    <body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
        <div class="myPage-wrap">
            <div class="myPage-menu">
                <div class="myPage-title">
                    <h2>마이페이지</h2>
                </div>
                <div class="mypage-content">
                    <div class="mypage-content-list more">
                        <div class="sub-title">쇼핑 정보</div>
                        <ul class="sub-menu">
                            <li><a href="#">거래 내역</a></li>
                            <li><a href="#">관심 상품</a></li>
                        </ul>
                    </div>
                    <div class="mypage-content-list more">
                        <div class="sub-title">내 정보</div>
                        <ul class="sub-menu">
                            <li><a href="#">프로필 정보</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="myPage-info">
                <div class="myPage-info-box">
                    <div class="myPage-info-image">
                        <img src="/img/user-100.png">
                    </div>
                    <div class="myPage-info-user">
                        <div><%=m.getMemberName() %></div>
                        <p><%=m.getMemberEmail() %></p>
                        <button><a href="/profileUpdate.do">프로필수정</a></button>
                    </div>
                </div>

                <div class="mypage-info-right">
                    <div class="myPage-info-grade">
                        <p><%=m.getMemberGrade()%></p>
                    </div>
                    <div class="bank">
                        <p>예치금 <span class="fc-6"><%=m.getMemberPoint() %></span>원</p>
                    </div>
                    <div class="temp">
                        <p>온도 <span class="fc-9"><%=m.getMemberTemp() %></span>도</p>
                    </div>  
                </div>
            </div>
            <div class="mypage-home-title mypage-home-title1">
                <h3>거래내역</h3>
            </div>
            <div class="mypage-home-content">
                <div class="deal">
                    <ul>
                        <li><a href="#">전체 <span>0</span></a></li>
                        <li><a href="#">판매중 <span>0</span></a></li>
                        <li><a href="#">예약중 <span>0</span></a></li>
                        <li><a href="#">거래완료 <span>0</span></a></li>
                    </ul>
                </div>
            </div>
            
            <div class="mypage-home-content mypage-home-content2">
                <div class="mypage-home-title mypage-home-title2">
                    <h3>판매내역</h3>
                </div>
                <div class="deal deal2">
                    <ul>
                        <li><a href="#">전체 <span>0</span></a></li>
                        <li><a href="#">판매중 <span>0</span></a></li>
                        <li><a href="#">예약중 <span>0</span></a></li>
                        <li><a href="#">거래완료 <span>0</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="mypage-home-content mypage-home-content2 wish">
                <div class="mypage-home-title mypage-home-title2">
                    <h3>관심상품</h3>
                </div>
                <div class=" deal3">
                  <p>추가하신 관심 상품이 없습니다</p>
                  <button type="button" class="bc3" style="border-radius:10px;">SHOP바로가기</button>
                </div>
            </div>
        </div>
        <script>
            $(".sub-title").on("click", function(){
                $(this).next().slideToggle();
            });
        </script>
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </body>
    </html>