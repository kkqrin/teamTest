<%@page import="sp.product.vo.Category"%>
<%@page import="sp.product.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    String pageNavi = (String)request.getAttribute("pageNavi");
    int start = (int)request.getAttribute("start");
    int categoryNo = (int)request.getAttribute("categoryNo");
    ArrayList<Category> cList = (ArrayList<Category>)request.getAttribute("cList");
    ArrayList<Category> cSubList = (ArrayList<Category>)request.getAttribute("cSubList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    li{
        list-style-type: none;
    }
    .page-content{
        position: relative;
    }
    .list-navi{
        background-color: hotpink;
        width: 300px;
        /*position: fixed;*/
        left: 80px;
        top: 150px;
    }
    .list-navi li{
        padding: 25px 30px;
    }
    .naviHide {
	display: none;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	
    <div class="list-navi">
       <ul class="list-firstCategory">
		<%for(int i=0;i<cList.size();i++) {%>
			<%Category c = cList.get(i); %>
           <li>
               <a href="#"><%=c.getCategoryName() %></a>
               <ul class="list-subCategory naviHide">
               		<%for(Category sc : cSubList) {%>
	               		<%if(sc.getCategoryRef() == c.getCategoryNo()) {%>
	               			<li><a href="#">전체</a></li>
		                   <li><a href="#"><%=sc.getCategoryName() %></a></li>
        	       		<%} %>
               		<%} %>
               </ul>
           </li>
		<%} %>
       </ul>
    </div>
	
	
	
	
	
	<div class="page-content">
		<div class="page-title">상품 리스트</div>
	        <div class="posting-wrap">
			<%for(int i=0; i<list.size();i++) {%>
				<%Product p = list.get(i); %>
			            <div class="posting-item">
			                <div class="posting-img">
			                <img src="upload/product/<%=p.getFilepath()%>">
			                </div>
			                <div class="posting-content">
			                    <p class="posting-price"><%=p.getProductPrice() %>원</p>
			                    <p class="posting-title"><%=p.getProductTitle() %></p>
			                    <div class="posting-detail">
			                       <!--<div class="posting-icon">
			                            <div class="heart-div">
			                                <span class="material-symbols-outlined">favorite</span>
			                                <span class="heart-count">0</span>
			                            </div>
			                            <div class="comment-div">
			                                <span class="material-symbols-outlined">chat_bubble</span>
			                                <span class="comment-count">댓글수 그냥조회수로할까</span>
			                            </div>
			                        </div> --> 
			                        <div class="posting-info">
			                            <span class="posting-area"><%=p.getProductArea() %></span>
			                            <span class="posting-time"><%=p.getEnrollDate() %></span>
			                        </div>
			                    </div>
			                </div>
			            </div>
			<%} %>
	        </div>
		</div>
		
		
	<script>
		$(".list-firstCategory>li>a").on("click", function(){
			console.log($(this).text());
			$(this).next().toggle();
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>