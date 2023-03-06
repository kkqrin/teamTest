<%@page import="sp.product.vo.ProductComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sp.product.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Product p = (Product)request.getAttribute("p");
    ArrayList<ProductComment> commentList = (ArrayList<ProductComment>)request.getAttribute("commentList");
    ArrayList<ProductComment> reCommentList = (ArrayList<ProductComment>)request.getAttribute("reCommentList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 상품 상세보기 css-->
    <link rel="stylesheet" href="/css/productView.css">
    
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
        <div class="view-container">
            <div class="view-product">
                <div class="view-product-img">
                    <img src="/upload/product/<%=p.getFilepath()%>">
                </div>
                <div class="view-product-info">
	                    <div class="view-product-info-top">
	                        <div class="view-category">홈 > 수입명품 > 여성신발</div>
	                        <div class="view-product-title"><%=p.getProductTitle() %></div>
	                        <div class="view-product-short">
	                            <div class="material-symbols-outlined view-icon">schedule</div>
	                            <span class="view-cnt">1시간전</span>
	                        </div>
	                        <div class="view-product-price">
	                            <div id="view-product-price">
	                                <span><%=p.getProductPrice() %>원</span>
	                            </div>
	                            <div class="wish-box">
	                                <span class="material-symbols-outlined wish-btn">favorite</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="view-product-info-mid">
	                        <div>
	                            <div class="view-product-status btn bs2 fc-8" style="border-radius: 42%;">판매중인 상품입니다.</div>
	                            <div class="view-product-detail">
	                                <div>
	                                    <span class="material-symbols-outlined view-icon">location_on</span>
	                                    <span class="view-cnt"><%=p.getProductArea() %></span>
	                                </div>
	                                <div class="view-product-icon">
	                                    <span class="material-symbols-outlined view-icon">visibility</span>
	                                    <span class="view-cnt"><%=p.getViewCount() %></span>
	                                    <span class="material-symbols-outlined view-icon">chat_bubble</span>
	                                    <span class="view-cnt">3</span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="view-product-btn">
	                        <button class="btn bc1 bs3">사기 조회</button>
	                        <button class="btn bc1 bs3">판매자에게 쪽지보내기</button>
	                    </div>
	                </div>
	        </div>
	    </div>
	    <div class="view-container-bottom">
            <div class="view-product-content">
                <div class="page-title">상품 내용</div>
                <div class="view-content-text">
                	<li><%=p.getProductContent() %></li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                    <li>어쩌고 저쩌고</li>
                </div>
            </div>
            <div class="view-product-seller">
                <div class="page-title">판매자 정보</div>
                <div class="view-seller-info">
                    <span class="material-icons seller">face_1</span>
                    <div class="view-seller-desc">
                        <div class="view-seller-name"><%=p.getSellerId() %>님</div>
                        <div class="view-seller-grade">이메일인증회원</div>
                        <div class="view-seller-temper">온도 36.5 ℃</div>
                    </div>
                </div>
                <div class="view-seller-box">
                    <button class="btn bc3 bs4" style="padding:20px; font-size:16px">판매자 상점 가기</button>
                </div>
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
	
	<script>
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
		
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>