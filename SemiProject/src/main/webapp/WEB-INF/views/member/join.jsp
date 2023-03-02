<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
    <link rel = "stylesheet" href= "css/join.css">
    <script src = "js/jquery-3.6.3.min.js"></script>
</head>
<body>
    <div class="join-wrap">
        <div class="join-header">
            <h1>회원가입</h1>
        </div>
        <div class="join-content">
            <form action="#" method="post">
                <div class="join-input-wrap">
                    <div>
                        <label for="memberId">아이디 <sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="memberId" id="memberId" class = "mid-input" required>
                        <button type="button" class="dup-btn">중복체크</button>
                    </div>
                </div>
                <div>
                    <div class="join-input-wrap">
                        <div>
                            <label for="memberPw">비밀번호<sup>*</sup></label>
                        </div>
                        <div>
                            <input type="password" name="memberPw" id="memberPw" class = "long-input" placeholder="영문,숫자,특수문자 조합 8-16자" required>
                        </div>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="memberPw2">비밀번호 확인<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="password" name="memberPw" id = "memberPw2" class = "long-input" required>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="memberName">이름<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="memberName" id="memberName" class = "long-input" required>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                    <label for="email" >이메일<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="email" id="email" class="long-input" placeholder="예) secondhandlion@lion.com">
                    </div>
                </div>
                <div class="agree-check">
                    <input type="checkbox" name="check" id="necessarycheck">
                    <label for="necessarycheck" name="necessarycheck"></label>
                    <lable class = "check-message">
                        [필수]만 14세 이상이며 모두 동의합니다.
                    </lable>
                    
                    <div class="plusImg">
                        <img src="img/plus-math-24.png" class="plus">
                    </div>
                    <div class="minusImg">
                        <img src="img/subtract-25.png" class="minus">
                    </div>
                    <div class="sub-agree-check">
                        <input type="checkbox" name="subcheck" id="subcheck1">
                        <label for="subcheck1" class="subchecksel"></label>
                        <lable class = "check-message">
                            이용약관 동의<a href="#">전체보기</a>
                        </lable>
                    </div>
                    <div class="sub-agree-check">
                        <input type="checkbox" name="subcheck" id="subcheck2">
                        <label for="subcheck2" class="subchecksel"></label>
                        <lable class = "check-message">
                            개인정보 수집 및 이용 동의<a href="#">전체보기</a>
                        </lable>
                    </div>
                </div>
                <div class="agree-check">
                    <input type="checkbox" name="check" id="choicecheck">
                    <label for="choicecheck"></label>
                    <lable class = "check-message">
                        [선택]광고성 정보수신에 모두 동의합니다.
                    </lable>
                    <div class="plusImg">
                        <img src="img/plus-math-24.png" class="plus2">
                    </div>
                    <div class="minusImg">
                        <img src="img/subtract-25.png" class="minus">
                    </div>
                    <div class="sub-agree-check2">
                        <input type="checkbox" name="subcheck2" id="sub-choicecheck1">
                        <label for="sub-choicecheck1"></label>
                        <lable class = "check-message">
                            문자메시지
                        </lable>
                    </div>
                    <div class="sub-agree-check2">
                        <input type="checkbox" name="subcheck2" id="sub-choicecheck2">
                        <label for="sub-choicecheck"></label>
                        <lable class = "check-message">
                            이메일
                        </lable>
                    </div>
                </div>
                <div class = "join-btn-wrap">
                    <button type = "submit">회원가입</button>
                </div>
            </form>
        </div>
         <script src = "js/join.js"></script>
</body> 
</html>