<%@page import="sp.product.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    String search = (String)request.getAttribute("search");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=search %></title>
<style>
	.wish-product-status{
		text-align: center;
	}
	.page-content>.page-title{
		text-align: center;
    	margin: 50px auto;
    	margin-top: 0px;
    	padding: 30px;
	}
	.posting-title{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-break: break-all;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">[ <%=search%> ]</div>
		<div class="posting-wrap">
			<%for(Product p : list) {%>
            <div class="posting-item">
			<a href="/productView.do?productNo=<%=p.getProductNo()%>">
	            	<div class="posting-img">
	                    <img src="/upload/product/<%=p.getFilepath()%>">
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price"><%=p.getProductPrice() %></p>
	                    <p class="posting-title"><%=p.getProductTitle() %></p>
	                    <div class="posting-detail">
	                        <div class="posting-icon">
	                            <div class="comment-div">
	                                <span class="material-symbols-outlined" style="color:#4e4e4e;">visibility</span>
	                                <span class="heart-count"><%=p.getViewCount() %></span>
	                            </div>
	                        </div>
	                        <div class="posting-info">
	                            <span class="posting-area"></span>
	                            <span class="posting-time"><%=p.getEnrollMonth() %>월 <%=p.getEnrollDay() %>일</span>
	                        </div>
	                    </div>
	                </div>
	          	
	          		

          </a>
          </div>
			<%} %>
        </div>
	</div>
	<script>
	//화폐 표시						
	for(let i=0; i<100 ; i++){				
		const productMoney = $(".posting-price").eq(i);
		let commaMoney = $(".posting-price").eq(i).text().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		$(".posting-price").eq(i).text(commaMoney+"원");
	}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>