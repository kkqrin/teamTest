<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel = "stylesheet" href = "css/login.css">
    <script src = "js/jquery-3.6.3.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="login-wrap">
        <div class="login-top">
            <h1 class="f-exbold">중고사자</h1>
            <h2 class="f-exbold">secondhand Lion</h2>
        </div>
        <div class="login-content-wrap">
            <form action ="/login.do" method = "post">
                <div class="login-content">
                    <div class="id">
                        <label for="memberId" class="f-bold">아이디</label>
                    </div>
                    <div>
                        <input type="text" name="memberId" id = "memberId" class = "long-input">
                    </div>
                </div>
                <div class="login-content">
                    <div class="pw">
                        <label for="memberPw" class="f-bold">비밀번호</label>
                    </div>
                    <div>
                        <input type="password" name="memberPw" id="memberPw" class = "long-input">
                    </div>
                </div>
                <div class="submit-btn">
                    <button type="submit" class="bc3 f-regular">로그인</button>
                </div>
            </form>
            <div class="login-content-bottom">
                <div>
                    <a href="/joinFrm.do" class="f-regular">회원가입</a>
                </div>
                <div class="findId">
                    <a href="/serchId.do" class="f-regular">아이디 찾기</a>
                </div> 
                <div class="findPw">
                    <a href="#" class="f-regular">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
     <script src = "js/login.js"></script>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>