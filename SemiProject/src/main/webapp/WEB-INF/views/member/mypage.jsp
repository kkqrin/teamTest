<%@page import="sp.product.vo.Product"%>
<%@page import="sp.report.vo.Report"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/mypage.css">
    <style>
    .mypage-home-title1{
    	padding-left:200px;
    }
    </style>   
</head>
    <body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
        <div class="page-content">
        <div class="mypage-navi-wrap">
            <div class="page-title">마이페이지</div>
            <div class="mypage-navi">
                <div class="mypage-navi-box more">
                    <div class="mypage-navi-title">거래 정보</div>
                    <ul class="mypage-subnavi">
                        <li><a href="/selectMyDeal.do?memberNo=<%=m.getMemberNo()%>">구매 내역</a></li>
                        <li><a href="/myStore.do?sellerId=<%=m.getMemberId()%>&loginId=<%=m.getMemberId()%>">판매 내역</a></li>
                    </ul>
                </div>
                <div class="mypage-navi-box more">
                    <div class="mypage-navi-title">내 정보</div>
                    <ul class="mypage-subnavi">
                        <li><a href="/profileUpdate.do">내 정보 수정</a></li>
                        <li><a href="/deleteMember.do">회원탈퇴</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mypage-content">
            <div class="mypage-user-wrap">
                <div class="mypage-user-profile">
                    <div class="mypage-user-image">
                        <div class="material-icons" style="font-size:80px;color:#4e4e4e;">face</div>
                    </div>
                    <div class="mypage-user-info">
                        <div>[<%=m.getMemberName() %>]님</div>
                    </div>
                    <div class="mypage-user-text">
                        <div>온도 <%=m.getMemberTemp()%>도</div>
                        <%if(m.getMemberGrade()==2){%>
                        <div class="fc-7">이메일 인증 회원입니다.</div>
                    <%}else{ %>
                    	<div class="fc-6">이메일 미인증 회원입니다.</div>
                    <%} %>
                    </div>
                </div>
            </div>
        </div>

    </div>
	 <script>
        $(".mypage-navi-title").on("click", function(){
            $(this).next().slideToggle();
        });
     </script>
     <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </body>
    </html>