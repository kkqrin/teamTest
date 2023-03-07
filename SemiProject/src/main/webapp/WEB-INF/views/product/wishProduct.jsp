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
<title>관심 상품</title>
<style>
	header>.sub-navi {
		z-index: 1;
	}
    .posting-item{
        position: relative;
    }
    .hover-posting-item{
    	position: absolute;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
    }
    .posting-item:hover>.hover-posting-item{
        background-color: #eee;
        opacity: 0.5;
        display: block;
    }
    .wish-product-status{
        position: absolute;
        left: 100px;
        top: 200px;
	
    }
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title"><%=m.getMemberName() %>님의 관심 상품</div>
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
	                                <span class="heart-count">1</span>
	                            </div>
	                            <div class="comment-div">
	                                <span class="material-symbols-outlined">chat_bubble</span>
	                                <span class="comment-count">3</span>
	                            </div>
	                        </div>
	                        <div class="posting-info">
	                            <span class="posting-area">영등포동</span>
	                            <span class="posting-time">1시간전</span>
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
	<script>
	$(".wish-product-status").hide();
		$(".hover-posting-item").on("mouseenter", function(){
			$(".wish-product-status").show();
		});
		$(".wish-product-status").on("mouseenter", function(){
			$(".wish-product-status").show();
		});
		$(".hover-posting-item").on("mouseleave", function(){
			$(".wish-product-status").hide();
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>