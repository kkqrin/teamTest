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
<title>인기상품</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">인기 상품</div>
		<div class="posting-wrap">
			<%for(Product p : list) {%>
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
	                                <span class="material-symbols-outlined">chat_bubble</span>
	                                <span class="comment-count">?</span>
	                            </div>
	                        </div>
	                        <div class="posting-info">
	                            <span class="posting-area"><%=p.getProductArea() %></span>
	                            <span class="posting-time"><%=p.getEnrollDate() %></span>
	                        </div>
	                    </div>
	                </div>
	          	
	          		
                    <!-- 0:거래중 1:예약중 2:거래완료 -->
                    <div class="wish-product-status">
                    <%if(p.getProductStatus() == 0) {%>
	                    <div class="btn bs2 fc-8" style="border-radius: 42%;">판매중</div>
                    <%}else if(p.getProductStatus() == 1) {%>
                    	<div class="btn bc5 bs6 fc-8" style="border-radius: 10px;">예약중</div>
                    <%}else if(p.getProductStatus() == 2) {%>
                    	<div>거래완료</div>
                    <%} %>
                    </div>
          </a>
          </div>
			<%} %>
        </div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>