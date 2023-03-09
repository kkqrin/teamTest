<%@page import="sp.product.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상점</title>
<style>
	.page-content>.page-title{
		text-align: center;
    	margin: 50px auto;
    	margin-top: 0px;
    	padding: 30px;
	}
</style>
<link rel="stylesheet" href="css/mypage.css">
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
                        <li><a href="/myStore.do?sellerId=<%=m.getMemberId()%>&loginId=<%=m.getMemberId()%>" class="mypage-active">판매 내역</a></li>
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
		<div class="posting-wrap" style="margin-top: 50px;padding-left: 50px;">
		
		<%if(list.size() == 0) {%>
			<div class="posting-title" style="width:800px;margin-top: 50px;padding-left: 50px;text-align: center;font-family: nn-b;">판매중인 상품이 없습니다.</div>
		<%} else {%>
			<%for(Product p : list) {%>
            <div class="posting-item" style="width:300px;">
            	<div class="hover-posting-item"></div>
			<a href="/productView.do?productNo=<%=p.getProductNo()%>">

	            	<div class="posting-img">
	                    <img src="/upload/product/<%=p.getFilepath()%>">
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price"><%=p.getProductPrice() %></p>
	                    <p class="posting-title"><%=p.getProductTitle() %></p>
	                    <div class="posting-detail">
	                        <div class="posting-icon">
	                            <div class="heart-div">
	                                <span class="material-symbols-outlined" style="color:#4e4e4e;">visibility</span>
	                                <span class="heart-count"><%=p.getViewCount() %></span>
	                            </div>
	                            <!--<div class="comment-div">
	                                <span class="material-symbols-outlined">chat_bubble</span>
	                                <span class="comment-count">?</span>
	                            </div>-->
	                        </div>
	                        <div class="posting-info">
	                            <!--<span class="posting-area"><%--p.getProductArea() --%></span>-->
	                            <span class="posting-time"><%=p.getEnrollDate() %></span>
	                        </div>
	                    </div>
	                </div>
		       </a>
          </div>
			<%} %>
		  <%} %>
        </div>
	</div>
	<script>
	//화폐 표시						
	for(let i=0; i<100 ; i++){				
		const productMoney = $(".posting-price").eq(i);
		console.log(productMoney.text());
		let commaMoney = $(".posting-price").eq(i).text().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		$(".posting-price").eq(i).text(commaMoney+"원");
		console.log(commaMoney);				
	}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>