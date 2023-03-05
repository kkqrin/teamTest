<%@page import="sp.product.vo.Category"%>
<%@page import="sp.product.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    String pageNavi = (String)request.getAttribute("pageNavi");
    int start = (int)request.getAttribute("start");
    int category = (int)request.getAttribute("category");
    String fCategoryName = (String)request.getAttribute("fCategoryName");
    ArrayList<Category> cList = (ArrayList<Category>)request.getAttribute("cList");
    ArrayList<Category> cSubList = (ArrayList<Category>)request.getAttribute("cSubList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=fCategoryName %>　|　중 고 사 자</title>

<style>
    li{
        list-style-type: none;
    }
    .list-container{
        display: flex;
    }
    .div-posting-wrap{
        width: 1200px;
    }
    .list-navi{
        width: 300px;
		height: 100%;
    }
    .list-navi li{
        padding: 25px 30px;
    }
    .list-subCategory>li{
    	padding: 10px 30px;
    }
    .list-subCategory>li>a{
    	font-size: 14px;
    }
    .naviHide {
	display: none;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="page-content" style="width: 1500px; margin: 30px auto;">
		<div class="list-container">
			<div class="div-list-navi">
			    <div class="list-navi">
					<div class="page-title">CATEGORY</div>
					<ul class="list-firstCategory">
						<%for(int i=0;i<cList.size();i++) {%>
						<%Category c = cList.get(i); %>
				           <li>
				               <a href="#"><%=c.getCategoryName() %></a>
				               <ul class="list-subCategory naviHide">
				               		<li><a href="/productList.do?category=<%=category%>&reqPage=1">전체</a></li>
				               		<%for(Category sc : cSubList) {%>
					               		<%if(sc.getCategoryRef() == c.getCategoryNo()) {%>
				                   <li><a href="/productSubList.do?category=<%=sc.getCategoryNo()%>&reqPage=1"><%=sc.getCategoryName() %></a></li>
				        	       		<%} %>
				               		<%} %>
				               </ul>
				           </li>
						<%} %>
			       </ul>
			    </div>
			</div>	
			
			<div class="div-posting-wrap">
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
				            <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
	                        <div class="posting-item">
	                <div class="posting-img">
	                    <img src="img/file.png" />
	                </div>
	                <div class="posting-content">
	                    <p class="posting-price">1,000,000원</p>
	                    <p class="posting-title">[미개봉/새상품] 아이폰 12 Pro 실버 256GB</p>
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
	            </div>
				</div>
			</div>
        </div>
	</div>
	
	<script>
		$(".list-firstCategory>li>a").on("click", function(){
			$(".list-subCategory").hide();			
			$(this).next().toggle();
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>