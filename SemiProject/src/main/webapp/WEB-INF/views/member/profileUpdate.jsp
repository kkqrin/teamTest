<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/liondefault.css">
    <link rel="stylesheet" href="css/profileUpdate.css">
    <script src="/js/jquery-3.6.3.min.js"></script>   
</head>
    <body>
     <%@include file="/WEB-INF/views/common/header.jsp" %>
        <div class="myPage-wrap">     
            <div class="myPage-menu">
                <div class="myPage-title">
                    <h2>마이 페이지</h2>
                </div>
                <div class="mypage-content">
                    <div class="mypage-content-list more">
                        <div class="sub-title">쇼핑 정보</div>
                        <ul class="sub-menu">
                            <li><a href="#">거래 내역</a></li>
                            <li><a href="#">관심 상품</a></li>
                        </ul>
                    </div>
                    <div class="mypage-content-list more">
                        <div class="sub-title">내 정보</div>
                        <ul class="sub-menu">
                            <li><a href="#">프로필 정보</a></li>
                             <li><a href="#">회원탈퇴</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="myPage-info">
                <div class="myPage-info-box">
                    <div class="myPage-info-image">
                        <img src="/img/user-100.png">
                    </div>
                    <div class="myPage-info-user">
                        <div>sadaasd</div>
                        <p>asdasdas@naver.com</p>
                        <button><a href="#">사진 변경</a></button>
                        <button><a href="#">사진 삭제</a></button>
                    </div>
                </div>

                <div class="mypage-info-right">
                    <div class="myPage-info-grade">
                        <p>일반 회원</p>
                    </div>
                    <div class="bank">
                        <p>예치금 0원</p>
                    </div>   
                </div>
            </div>
            <form action="#" method="post">
                <div class="login-info">
                          <div class="join-input-wrap">
                              <h3>로그인 정보</h3>
                              <br>
                              <div>
                                  <label for="memberId">아이디</label>
                              </div>
                              <div>
                                  <input type="text" name="memberId" id="memberId" class = "long-input" readonly>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="memberPw">비밀번호</label>
                                  <span class = "comment"></span>
                              </div>
                              <div>
                                  <input type="password" name="memberPw" id="memberPw" class = "long-input" placeholder="영문,숫자,특수문자 조합 8-16자" required>
                                  <button type="button" class="bc1 dup-btn">변경하기</button>
                                  <span class = "comment"></span>
                              </div>
                          </div>
                      </div>       
                      <div class="login-info2">
                          <div class="join-input-wrap">
                              <h3>개인정보</h3>
                              <br>
                              <div>
                                  <label for="memberName">이름</label>
                              </div>
                              <div>
                                  <input type="text" name="memberName" id="memberName" class = "long-input" required>
                                  <button type="button" class="bc1 dup-btn">변경하기</button>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="memberPhone">전화번호</label>
                              </div>
                              <div>
                                  <input type="text" name="memberPhone" id="memberPhone" class = "long-input">
                                  <button type="button" class="bc1 dup-btn">변경하기</button>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="email" >이메일</label>
                              </div>
                              <div>
                                  <input type="text" name="email" id="email" class="long-input" placeholder="예) secondhandlion@lion.com">
                                  <button class="bc1 dup-btn" id="sendBtn">메일전송</button>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="email" >이메일 인증하기</label>
                              </div>
                              <div>
                                  <input type="text" name="email" id="authCode" class="long-input" placeholder="인증번호 입력">
                                  <button class="bc1 dup-btn"id="authBtn">인증하기</button>
                                  <span id="timeZone"></span>
                                  <span id="authMsg"></span>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="post" >우편번호</label>
                              </div>
                              <div>
                                  <input type="text" name="postcode" id="postcode" class="long-input" readonly>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="addr" >주소</label>
                              </div>
                              <div>
                                  <input type="text" name="address" id="address" class="long-input" readonly>
                              </div>
                          </div>
                          <div class="join-input-wrap bottomAddr">
                              <div>
                                  <label for="addr2" >상세주소</label>
                              </div>
                              <div>
                                  <input type="text" name="detailAddress" id="detailAddress" class="long-input">
                                  <button class="bc1 dup-btn" onclick="searchAddr();">주소변경</button>
                              </div>
                          </div>
                  </form>
        </div>
        <script>
        	
        	
            $(".sub-title").on("click", function(){
                $(this).next().slideToggle();
            });
                    
            $(".long-input").on("focusin",function(event){
                $(this).css("border-bottom", "2px solid black");
            });
            $(".long-input").on("focusout",function(event){
                $(this).css("border-bottom", "1px solid #ccc");
            });

        </script>
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </body>
    </html>