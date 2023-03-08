<%@page import="sp.product.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Product> popularList = (ArrayList<Product>)request.getAttribute("popularList");
    ArrayList<Product> newList = (ArrayList<Product>)request.getAttribute("newList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중 고 사 자</title>
<style>
.page-content>div>.carousel-inner{
    width: 60%;
    margin: 0 auto;
}
.posting-wrap{
	margin-bottom: 200px;
}
</style>
<link rel="stylesheet" href="/css/carousel.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<!-- 캐러셀 -->
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="2000">
                    <img src="/img/flower1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="/img/flower2.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="/img/flower3.png" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true">
                    <span class="material-symbols-outlined">arrow_back_ios</span>
                </span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true">
                    <span class="material-symbols-outlined">arrow_forward_ios</span>
                </span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>



		<div class="page-title">최신 등록 상품</div>
		<div class="posting-wrap new-wrap">
			<%for(Product p : newList) {%>
            <div class="posting-item">
            	<div class="hover-posting-item"></div>
			<a href="/productView.do?productNo=<%=p.getProductNo()%>">

	            	<div class="posting-img">
	                    <img src="/upload/product/<%=p.getFilepath()%>">
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price"><%=p.getProductPrice() %>원</p>
	                    <p class="posting-title"><%=p.getProductTitle() %></p>
	                    <div class="posting-detail">
	                        <div class="posting-icon">
	                            <div class="heart-div">
	                                <span class="material-symbols-outlined">favorite</span>
	                                <span class="heart-count"><%=p.getWishCount()%></span>
	                            </div>
	                            <div class="comment-div">
	                                 <span class="material-symbols-outlined" style="color:#4e4e4e;">visibility</span>
	                                <span class="heart-count"><%=p.getViewCount() %></span>
	                            </div>
	                        </div>
	                        <div class="posting-info">
	                            <!-- <span class="posting-area"><%--p.getProductArea() --%></span> -->
	                            <span class="posting-time"><%=p.getEnrollDate() %></span>
	                        </div>
	                    </div>
	                </div>
          </a>
          </div>
			<%} %>
        </div>







		<div class="page-title">인기 상품</div>
		<div class="posting-wrap popular-wrap">
			<%for(Product p : popularList) {%>
	            <div class="posting-item">
	            	<div class="hover-posting-item"></div>
				<a href="/productView.do?productNo=<%=p.getProductNo()%>">
	
		            	<div class="posting-img">
		                    <img src="/upload/product/<%=p.getFilepath()%>">
		                </div>
		                <div class="posting-content">
		                    <p class="posting-price"><%=p.getProductPrice() %>원</p>
		                    <p class="posting-title"><%=p.getProductTitle() %></p>
		                    <div class="posting-detail">
		                        <div class="posting-icon">
		                            <div class="heart-div">
		                                <span class="material-symbols-outlined">favorite</span>
		                                <span class="heart-count"><%=p.getWishCount() %></span>
		                            </div>
		                            <div class="comment-div">
		                                <span class="material-symbols-outlined" style="color:#4e4e4e;">visibility</span>
	                                <span class="heart-count"><%=p.getViewCount() %></span>
		                            </div>
		                        </div>
		                        <div class="posting-info">
		                            <!-- <span class="posting-area"><%--p.getProductArea() --%></span> -->
		                            <span class="posting-time"><%=p.getEnrollMonth() %>월 <%=p.getEnrollDay() %>일</span>
		                        </div>
		                    </div>
		                </div>
	         	 </a>
	          	</div>
			<%} %>
        </div>

		
       





    </div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>