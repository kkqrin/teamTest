<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">관심 상품</div>
		<div class="posting-wrap">
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
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>