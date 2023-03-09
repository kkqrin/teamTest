<%@page import="sp.product.vo.Category"%>
<%@page import="sp.product.vo.ProductComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sp.product.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Product p = (Product)request.getAttribute("p");
    ArrayList<ProductComment> commentList = (ArrayList<ProductComment>)request.getAttribute("commentList");
    ArrayList<ProductComment> reCommentList = (ArrayList<ProductComment>)request.getAttribute("reCommentList");
    ArrayList<Product> wishList = (ArrayList<Product>)request.getAttribute("wishList");
    Category c = (Category)request.getAttribute("c");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getProductTitle() %> | 중 고 사 자</title>
    <!-- 상품 상세보기 css-->
    <link rel="stylesheet" href="/css/productView.css">
    <!-- 캐러셀 -->
    <link rel="stylesheet" href="/css/carousel.css">
    
<style>
	.inputCommentBox{
		margin : 50px;
	}
	.inputCommentBox>form>ul{
		list-style-type : none;
		display : flex;
	}
	.inputCommentBox>form>ul>li:first-child{
		width : 15%;
		display : flex;
		justify-content : center;
		align-items : center;
	}
	.inputCommentBox>form>ul>li:first-child>span{
		font-size : 80px;
		color : #4b4b4b;
	}
	.inputCommentBox>form>ul>li:nth-child(2){
		width : 75%;
	}
	.inputCommentBox>form>ul>li:nth-child(2)>textarea{
		height : 96px;
		min-height : 96px;
	}
	.inputCommentBox>form>ul>li:last-child{
		width: 10%;
	    text-align: center;
    	line-height: 96px;
    	margin: 0px 3px;
	}
	.commentBox{
		margin : 50px;
	}
	.inputRecommentBox{
		margin : 30px 0px;
		display : none;
	}
	.view-product-btn>a{
		display: inline;
	}
	.hiddenBox{
		display: none;
	}
	.hiddenBox>h3>span{
		color : red;
		font-size: 30px;
	}

	.w-100{
		height: 600px;
	}
	.view-content-text>div>p>img{
		width: 70% !important;
	}
.input-radio{
	overflow: hidden;
	margin-top : 15px;
	margin-left : 50px;
	
}
.modal-content{
}
.input-radio input[type=radio]{
    display: none;
}

/*라이오 타입 다음 라벨..*/
.input-radio input[type=radio]+label{
    width: 20%;
    text-align: center;
    padding: 10px;
    border: 2px solid #252a34ab;
    color: #252a34;
    font-family: nn-b;
    cursor: pointer;
    display: block; /*너비(크기)조정을 위해 인라인 요소에서 블록으로 변경*/
    float: left;
    box-sizing: border-box; /*합쳐서 250이 될 수 있게..너비가 부족해 옆으로 튕굼..*/
    margin-right :15px;
}
	.input-radio input[type=radio]:checked+label{
    background-color: #252a34;
    color: #fff;
}
[name=temp2]>label{
	z-index : 1000;
}

	.view-category>input[type=button]{
		float: right;
		display:flex;
		align-items: center;
	}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
        <div class="view-container">
            <div class="view-product">
            
            
        <div class="view-product-img">
            
            
            
            <!-- 캐러셀 -->            
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <%if(p.getFilepath2() != null) {%>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <%} %>
		    <%if(p.getFilepath3() != null) {%>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <%} %>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="/upload/product/<%=p.getFilepath()%>" class="d-block w-100" alt="...">
		    </div>
		    <%if(p.getFilepath2() != null) {%>
		    <div class="carousel-item">
		      <img src="/upload/product/<%=p.getFilepath2()%>" class="d-block w-100" alt="...">
		    </div>
		    <%} %>
		    <%if(p.getFilepath3() != null) {%>
		    <div class="carousel-item">
		      <img src="/upload/product/<%=p.getFilepath3()%>" class="d-block w-100" alt="...">
		    </div>
		    <%} %>
		  </div>
		  
		  
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true">
		  <%if(p.getFilepath2() != null ) {%>
		    	<span class="material-symbols-outlined">arrow_back_ios</span>
         <%} %>
		    </span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true">
		    <%if(p.getFilepath2() != null ) {%>
		    	<span class="material-symbols-outlined">arrow_forward_ios</span>
		    <%} %>
		    </span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>    
         
          </div>
         
            
               
                <div class="view-product-info">
	                    <div class="view-product-info-top">
	                        <div class="view-category">홈 > <%=c.getfCategoryName() %> > <%=c.getCategoryName() %>
	                        <%if(m.getMemberId().equals(p.getSellerId())){ %>
	                        <input type="button" class="btn bc1 bs1" value ="삭제">
	                        <%} %>
	                        </div>
	                        <div class="view-product-title"><%=p.getProductTitle() %></div>
	                        <div class="view-product-short" style="display:flex;">
	                            <div class="material-symbols-outlined view-icon">schedule</div>
	                            <div class="view-cnt" style="margin-top: 2px;margin-left: 7px;"><%=p.getEnrollDate() %></div>
	                        </div>
	                        <div class="view-product-price">
	                            <div id="view-product-price">
	                                <span><%=p.getProductPrice() %></span>
	                            </div>
	                            <div class="wish-box">
	                            
	                            	<%int chk = 0; %>
	                                <%if(m != null) {%>
	                                	<%if(chk == 0) {%>
		                                	<% chk = 1; %>
			                               	<%for(Product wp : wishList) {%>
			                                	<%if(wp.getMemberNo() == m.getMemberNo()) {%>
			                                		<!-- 현재 관심상품 -->
			                                		<a href="/deleteWishProduct.do?memberNo=<%=m.getMemberNo() %>&productNo=<%=p.getProductNo()%>">
			                                		<span class="material-symbols-outlined wish-btn fill-wish">favorite</span>
			                                		</a>
			                                		<% chk = 0; %>
		                                		<%} %>
			                               	<%} %>
		                            	<%}if(chk == 1) {%>
	                               			<a href="/insertWishProduct.do?memberNo=<%=m.getMemberNo() %>&productNo=<%=p.getProductNo()%>">
	                                		<span class="material-symbols-outlined wish-btn">favorite</span>
			                               </a> 
	                                	<%} %>
	                                <%} %>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="view-product-info-mid">
	                        <div>
	                        	<!-- 상품상태 / 0:거래중 1:예약중 2:거래완료 -->
	                        	<%if(p.getProductStatus() == 0) {%>
		                            <div class="view-product-status btn bs2 fc-8" style="border-radius: 42%;">판매중인 상품입니다.</div>                        	
	                        	<%}else if (p.getProductStatus() == 1) {%>
	                        		<div class="view-product-status btn bs2 fc-9" style="border-radius: 42%;">예약중인 상품입니다.</div>
	                        	<%}else if (p.getProductStatus() == 2) {%>
	                        		<div class="view-product-status btn bs2 fc-3" style="border-radius: 42%;">거래완료된 상품입니다.</div>
	                        	<%} %>
	                            <div class="view-product-detail">
	                                <div style="display: flex;justify-content: center;margin-bottom: 10px;">
	                                    <div class="material-symbols-outlined view-icon">location_on</div>
	                                    <div class="view-cnt" style="margin-top: 3px;margin-left: 7px;"><%=p.getProductArea() %></div>
	                                </div>
	                                <div class="view-product-icon" style="display:flex;justify-content: center;">
	                                    <div class="material-symbols-outlined view-icon">visibility</div>
	                                    <div class="view-cnt" style="margin-top: 1px; margin-left: 5px;"><%=p.getViewCount() %></div>
	                                    <div class="material-symbols-outlined view-icon" style="margin-left: 10px;">chat_bubble</div>
	                                    <div class="view-cnt" style="margin-left: 5px;">?</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <%if(m != null) {%>
	                    <div class="view-product-btn">
	                        <a class="btn bc1 bs3 modal-open-btn" target="#login-modal">사기 조회</a>
	                        <a href="#" class="btn bc1 bs3">판매자에게 쪽지보내기</a>
	                        <%if(p.getProductStatus()== 0) {%>
	                        <a href="/reserve.do?productNo=<%=p.getProductNo()%>&memberNo=<%=m.getMemberNo() %>" class="btn bc1 bs3 reserve-btn">예약하기</a>
	                        <%}else if(p.getProductStatus()== 1) {%>
	                        <a class="btn bc1 bs3 modal-open-btn" target="#complete-modal">구매확정</a>
	                        <%}%>
	                    </div>
	                    <%} %>
	                </div>
	        </div>
	    </div>
	    
	    
	    
	
	
	    <div class="view-container-bottom">
            <div class="view-product-content" style="width: 770px;">
                <div class="page-title">상품 내용</div>
                <div class="view-content-text">
                	<div><%=p.getProductContent() %></div>
                </div>
            </div>
            <div class="view-product-seller">
                <div class="page-title">판매자 정보</div>
                <div class="view-seller-info">
                    <span class="material-icons seller">face_1</span>
                    <div class="view-seller-desc">
                        <div class="view-seller-name"><%=p.getSellerId() %>님</div>
                        <!-- 1:관리자 2:이메일 인증회원 3:이메일 미인증회원 4:사기회원 -->
                        <div class="view-seller-grade">이메일 인증 회원</div>
                        <div class="view-seller-temper">온도 ??.? ℃</div>
                    </div>
                </div>
                <%if(m != null) {%>
                <div class="view-seller-box">
                    <a href="/myStore.do?sellerId=<%=p.getSellerId() %>&loginId=<%=m.getMemberId() %>" class="btn bc3 bs4" style="padding:20px; font-size:16px">판매자 상점 가기</a>
                </div>
                <%} %>
            </div>
        </div>
        
	    <!-- 댓글창 -->
	    <div class="commentBox">
	    	<%for(ProductComment pc : commentList) {%>
	    		<ul class="posting-comment">
		            <li>
		                <span class="material-icons">face</span>
		            </li>
		            <li>
		                <p class="comment-info">
		                	<span><%=pc.getPdWriter() %></span>
		                	<span><%=pc.getPdDate() %></span>
		                </p>
		                <p class="comment-content"><%=pc.getPdContent() %></p>
		                <!-- 수정용 textarea -->
		                <textarea name="pdContent" class="input-form" style="min-height:96px;display:none;"><%=pc.getPdContent() %></textarea>
		                <p class="comment-link">
		                	<!-- 로그인 상태일때 -->
		                	<%if(m != null) {%>
		                			<!-- 답글 버튼 -->
				                    <a href="javascript:void(0)" class="recShow">
				                        <span class="material-symbols-outlined comment-reply">reply</span> 
				                    </a>
		                		<!-- 로그인 회원과 작성자가 같을 때 -->
		                		<%if(m.getMemberId().equals(pc.getPdWriter())) {%>
				                    <!-- 더보기 -->
		                			<a class="comment-more">
				                        <span class="material-symbols-outlined more-btn">more_vert</span>
				                    </a>
		                		<%} %>
		                	<%} %>
		                </p>
		                <!-- 수정/삭제 버튼 -->
		                <div class="comment-update">
		                    <a href="javascript:void(0)" onclick="modifyComment(this,<%=pc.getPdNo()%>,<%=p.getProductNo()%>);">수정</a>
		                    <a href="javascript:void(0)" onclick="deleteComment(this,<%=pc.getPdNo()%>,<%=p.getProductNo()%>);">삭제</a>
		                </div>
	            	</li>
           		</ul>
	            <!-- 대댓글 출력 -->
	            <%for(ProductComment pcc : reCommentList) {%>
	            	<!-- 대댓글의 번호랑 참조하는 댓글의 번호가 같을 때 -->
	            	<%if(pcc.getPdRef() == pc.getPdNo()) {%>
	            		<ul class="posting-comment reply">
			                <li>
			                    <span class="material-icons">subdirectory_arrow_right</span>
			                    <span class="material-icons">face_6</span>
			                </li>
			                <li>
			                    <p class="comment-info">
			                    	<span><%=pcc.getPdWriter() %></span>
			                    	<span><%=pcc.getPdDate() %></span>
			                    </p>
			                    <p class="comment-content"><%=pcc.getPdContent() %></p>
			                    <!-- 수정용 textarea -->
								<textarea name="pdContent" class="input-form" style="min-height:96px;display:none;"><%=pcc.getPdContent() %></textarea>
			                    <p class="comment-link">
			                    	<!-- 로그인 & 로그인된 회원과 작성자 일치 -->
			                    	<%if(m != null && m.getMemberId().equals(pcc.getPdWriter())) {%>
			                    	 <!-- 수정/삭제 버튼 -->
		                			<a class="comment-more">
				                        <span class="material-symbols-outlined more-btn">more_vert</span>
				                    </a>
			                    	<%} %>
			                    </p>
			                    <div class="comment-update">
			                        <a href="javascript:void(0)" onclick="modifyComment(this,<%=pcc.getPdNo()%>,<%=p.getProductNo()%>);">수정</a>
			                        <a href="javascript:void(0)" onclick="deleteComment(this,<%=pcc.getPdNo()%>,<%=p.getProductNo()%>);">삭제</a>
			                    </div>
			                </li>
			            </ul>
	            	<%} // if문 %>
	            <%} //대댓글 출력 for문 %>
	            
            	<!-- 댓글에 대한 대댓글 입력 양식 -->		
				<%if(m != null) {%>
				<div class="inputCommentBox inputRecommentBox">
					<form action="/insertProductComment.do" method="post">
						<ul>
							<li>
								<span class="material-icons" style="font-size:40px;color:#6d6d6d;">subdirectory_arrow_right</span>
							</li>
							<li>
								<input type="hidden" name="pdWriter" value="<%=m.getMemberId() %>">
								<input type="hidden" name="productRef" value="<%=p.getProductNo() %>">
								<!-- 현재 출력되고 있는 댓글의 번호 -->
								<input type="hidden" name="pdRef" value="<%=pc.getPdNo() %>">
								<textarea name="pdContent" class="input-form"></textarea>
							</li>
							<li>
								<button type="submit" class="btn bc3 bs3">등록</button>
							</li>							
						</ul>
					</form>
				</div>
				<%} %>
				
	    	<%} //댓글 출력 for문 %>
	    </div>
	    
	    <!-- 댓글 입력창은 맨밑에 하나만 존재하므로 for문안에 있을 필요 x -->
		<!-- 로그인 된 경우에만 댓글 작성화면 띄움 -->
		<%if(m != null) {%>
		<div class="inputCommentBox">
			<form action="/insertProductComment.do" method="post">
				<ul>
					<li>
						<span class="material-icons">face</span>
					</li>
					<li>
						<!-- 입력받진 않지만 값 전달해야 하는 경우 hidden 이용해 전달 -->
						<input type="hidden" name="pdWriter" value="<%=m.getMemberId() %>">
						<input type="hidden" name="productRef" value="<%=p.getProductNo() %>">
						<!-- 댓글은 댓글참조 번호 null이므로 일단 0 주고 dao에서 0이면 null 대입 -->
						<input type="hidden" name="pdRef" value="0">
						<textarea name="pdContent" class="input-form"></textarea>
					</li>
					<li>
						<button type="submit" class="btn bc3 bs3">등록</button>
					</li>
				</ul>
			</form>
		</div>
		<%} %>
	</div>
			<div id="login-modal" class="modal-bg">
			<div class="modal-wrap">
				<div class="modal-head" style="text-align: center;">
					<h2>사기회원조회</h2>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<div class="input-box heightbox">
						<label for="title">조회할 회원</label> <input type="text" name="sellerId"
							id="sellerId" class="input-form midbox title-post" value="<%=p.getSellerId() %>"
							readonly>
					</div>
					<div class="input-box heightbox ">
						<label for="title">조회된 회원 전화번호</label> <input type="text" name="memberPhone"
							id="memberPhone" class="input-form midbox title-post"readonly>
					</div>
					<div class="input-box heightbox ">
						<label for="title">조회된 회원 이메일</label> <input type="text" name="memberEmail"
							id="memberEmail" class="input-form midbox title-post"readonly>
					</div>
					<div class="input-box heightbox hiddenBox" style="text-align: center;">
						<h2>결과</h2>
						<h3 style="margin-top: 10px">신고 누적 [ <span class="check"></span> ]회 사기이력 [ <span class="pact"></span> ]회</h3>
					</div>

				</div>
				<div class="modal-foot">
					<button type="button" class="btn bc11">조회하기</button>
					<button type="button" class="btn bc11 modal-close">취소</button>
				</div>
			</div>
			</div>
			
			<%--거래완료 모달창 --%>
			<div id="complete-modal" class="modal-bg">
			<div class="modal-wrap">
				<div class="modal-head">
					<h2>거래 내역 조회</h2>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<div class=modal-title>
						<h2>판매자님과의 거래는 어떠셨나요? 평가해주세요 ^ㅡ^</h2>
					</div>
					<div class="input-radio">
						<input type="radio" name="temp" id="temp1" value="0">
						<label for="temp1">별로</label>
						
						<input type="radio" name="temp" id="temp2" value="1">
						<label for="temp2">보통</label>
						
						<input type="radio" name="temp" id="temp3" value="2">
						<label for="temp3">좋아요</label>
						
						<input type="radio" name="temp" id="temp4" value="3">
						<label for="temp4">최고예요</label>
						
						<input type="hidden" name="input-productNo" value="<%=p.getProductNo() %>">
						<%--판매자 회원번호 --%>
						<input type="hidden" name="input-memberNo">
						<%--구매자 회원번호 --%>
						<input type="hidden" class="hidden-memberNo" value="<%=m.getMemberNo() %>">
					</div>
				</div>
				<div class="modal-foot">
					<button class="btn bc11 modalCheck">확인</button>
					<button class="btn bc1 modal-close">취소</button>
				</div>
			</div>
		</div>
	
	<script>

	
		$('.view-category>input[type=button]').on('click',function(){
			location.href = "/deleteProduct.do?productNo=<%=p.getProductNo()%>";
		})
	
		$('.modal-open-btn').on('click',function(){
			const memberId = $('#sellerId').val();
			$.ajax({
				url : "/findSelectUser.do",
				type : "POST",
				data : {memberId : memberId},
				dataType : "JSON",
				success(data){
					const phone = data.memberPhone;
					const email = data.memberEmail;
					$('#memberPhone').val(phone);
					$('#memberEmail').val(email);
					}
				
			});
		});
		
	
		$('.modal-foot>button').eq(0).on('click',function(){
			const memberId = $('#sellerId').val();
			console.log(memberId); 
			$.ajax({
				url : "/findReportUser.do",
				type : "POST",
				data : {memberId : memberId},
				dataType : "JSON",
				success(data){
					console.log(data);
					const check = data.check;
					$('.check').text(check);
					const pact = data.pact;
					$('.pact').text(pact);
					$('.hiddenBox').show();
					}
				
			});
		})
	
	
	/* 	$(document).ready(function(){
			$('.modal-bg').show();
		}); */
		<!------->	
		// 관심상품 하트 채우기
		$(".wish-btn").on("click", function(){
			$(this).toggleClass("fill-wish");
		});
		
		$(".recShow").on("click", function(){
			// 몇번째 답글달기 버튼을 클릭했는지 
			const idx = $(".recShow").index(this);
			
			if($(this).children().text() == "reply"){
				$(this).children().text("close");					
			}else if($(this).children().text() == "close"){
				$(this).children().text("reply");
			}
			
			$(".inputRecommentBox").eq(idx).toggle();
			$(".inputRecommentBox").eq(idx).find("textarea").focus();
		});
		
		function modifyComment(obj, pdNo, productNo){
			// 수정시 플로팅 버튼 삭제 (답글,더보기)
			$(obj).parent().prev().children().first().hide();
			//$(obj).parent().prev().children().last().children().hide();
			// 숨겨놓은 textarea를 화면에 보여줌
			$(obj).parent().prev().prev().show();
			// 화면에 있던 댓글내용(p태그)를 숨김
			$(obj).parent().prev().prev().prev().hide();
			
			// 수정 -> 수정완료
			const completeBtn = $("<a href='javascript:void(0)'>").append($("<span class='material-symbols-outlined'>check</span>")).append("</a>") 			
			$(obj).parent().prev().prepend(completeBtn);
			$(obj).parent().prev().children().first().attr("onclick", "modifyComplete(this,"+pdNo+","+productNo+")");
			
			// 삭제 -> 수정취소
			$(obj).parent().prev().children().next().children().text("close");
			$(obj).parent().prev().children().next().children().attr("style", "font-size: 22px; color: #4e4e4e; bottom: 5.5px;")
			$(obj).parent().prev().children().next().children().off("click");
			$(obj).parent().prev().children().next().children().attr("onclick", "modifyCancel(this,"+pdNo+","+productNo+")");
			
		}
		
		function modifyCancel(obj, pdNo, productNo){
			// 수정 취소
			$(obj).parent().parent().prev().hide(); // 수정용 textarea 숨김
			$(obj).parent().parent().prev().prev().show(); // 기존 댓글 다시 보여줌
			// 수정 완료 -> 답글
			$(obj).parent().parent().children().first().remove();
			$(obj).parent().parent().find(".recShow").show();
			$(obj).parent().parent().find(".recShow").children().text("reply");
			$(obj).removeAttr("onclick");
			$(obj).parent().parent().find(".recShow").children().removeAttr("onclick");
			//$(obj).prev().attr("onclick", "modifyComment(this,"+ncNo+","+noticeNo+")");
			
			// 수정 취소 -> 삭제
			$(obj).text("more_vert");
			$(obj).removeAttr("style");
			$(obj).on("click",moreFunc());
			//$(obj).attr("onclick", "deleteComment(this,"+ncNo+","+noticeNo+")");
		}
		
		function modifyComplete(obj, pdNo, productNo){
			// 방법 2개 : form, a(location.href)
			// [1] form태그를 생성해서 전송
			// 댓글내용, 댓글번호, 공지사항 번호
			
			// 1. form태그 생성
			const form = $("<form style='display:none;' action='updateProductComment.do' method='post'></form>");
		
			// 2. input 태그 2개 숨김
			const pdNoInput = $("<input type='text' name='pdNo'>");
			pdNoInput.val(pdNo);
			const productNoInput = $("<input type='text' name='productNo'>");
			productNoInput.val(productNo);
			
			// 3. textarea
			const pdContent = $(obj).parent().prev();
			
			// 4. form태그에 input, textarea를 모두 포함
			form.append(pdNoInput).append(productNoInput).append(pdContent);
			
			// 5. 생성된 form태그를 body태그에 추가
			$("body").append(form);
			
			// 6. form태그 전송
			form.submit();
		}
		
		function deleteComment(obj, pdNo, productNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteProductComment.do?pdNo="+pdNo+"&productNo="+productNo;
			}
		}
		
		
		$(document).ready(function(){
		// 화폐 표시
		const productMoney = $("#view-product-price>span");
		console.log(productMoney);
		const commaMoney = productMoney.text().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		productMoney.text(commaMoney+"원");
		console.log(commaMoney);
        });
		
	//거래완료 모달창
	//상품 회원번호 출력(판매자)
	$(".modal-open-btn").on("click",function(){
		$(".carousel-control-next").hide();		
		const productNo = $("[name=input-productNo]").val();
		$.ajax({
			url : "/productMemberSelect.do",
			type : "get",
			data : {productNo : productNo},
			dataType : "JSON",
			success(data){
				const no = data.memberNo;
				$("[name=input-memberNo]").val(no);
				}
		});
	});
	// 모달 값 전송 radio(val),memberNo(판매자)
	$(".modalCheck").on("click",function(){
		$(this).parents(".modal-wrap").parent().css("display", "none");
		//판매자 회원번호
		const memberNo = $("[name=input-memberNo]").val();
		const productNo = $("[name=input-productNo]").val();
		var memberTemp = $('input[name=temp]:checked').val();
		//구매자 회원번호
		const hiddenMemberNo = $(".hidden-memberNo").val();
		//평가완료 > 구매확정
		location.href="/updateMemberTemp.do?memberNo="+memberNo+"&memberTemp="+memberTemp+"&productNo="+productNo+"&hiddenMemberNo="+hiddenMemberNo;
		
	});	
		
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>