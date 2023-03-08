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
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
    .emailCheck{
    	display:none;
    }
    </style>
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
                              <li><a href="/myPage.do">내 정보보기</a></li>
                             <li><a href="/deleteMember.do">회원탈퇴</a></li>
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
                        <div><%=m.getMemberName() %></div>
                        <p><%=m.getMemberEmail() %></p>
                        <button><a href="#">사진 변경</a></button>
                        <button><a href="#">사진 삭제</a></button>
                    </div>
                </div>

                <div class="mypage-info-right">
                    <div class="myPage-info-grade">
                    <%if(m.getMemberGrade()==2){%>
                        <p>이메일 인증회원</p>
                    <%}else{ %>
                    	<p>이메일 미인증회원</p>
                    <%} %>
                    </div>
                    <div class="bank">
                        <p>예치금 <span class="fc-6"><%=m.getMemberPoint() %></span>원</p>
                    </div>
                    <div class="temp">
                        <p>온도 <span class="fc-9"><%=m.getMemberTemp() %></span>도</p>
                    </div>    
                </div>
            </div>
            <form action="/updateInfo.do" method="post">
                <div class="login-info">
                          <div class="join-input-wrap">
                              <h3>로그인 정보</h3>
                              <br>
                              <div>
                                  <label for="memberId">아이디</label>
                              </div>
                              <div>
                                  <input type="text" name="memberId" id="memberId" class = "long-input" value="<%=m.getMemberId() %>" readonly>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="memberPw">비밀번호</label>
                                  <span class = "comment"></span>
                              </div>
                              <div>
                                  <input type="password" name="memberPw" id="memberPw" class = "long-input" placeholder="영문,숫자,특수문자 조합 8-16자" value="<%=m.getMemberPw() %>" required>
                                  <br>
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
                                  <input type="text" name="memberName" id="memberName" class = "long-input" value="<%=m.getMemberName() %>" required>
                              	  <br>
                              	  <span class="comment"></span>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="memberPhone">전화번호</label>
                              </div>
                              <div>
                                  <input type="text" name="memberPhone" id="memberPhone" class = "long-input" value="<%=m.getMemberPhone() %>">
								  <br>
                                  <span class = "comment"></span>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="email" >이메일</label>
                              </div>
                              <div>
                                  <input type="text" name="email" id="email" class="mid-input" placeholder="예) secondhandlion@lion.com" value="<%=m.getMemberEmail()%>">
                                  <button type="button" class="bc2 dup-btn" id="sendBtn">메일변경</button>
                              </div>
                          </div>
                          <div class="join-input-wrap emailCheck">
                              <div>
                                  <label for="email" >이메일 인증하기</label>
                              </div>
                              <div>
                                  <input type="text" name="email" id="authCode" class="mid-input" placeholder="인증번호 입력">
                                  <button type="button" class="bc2 dup-btn"id="authBtn">인증하기</button>
                                  <span id="timeZone"></span>
                                  <span id="authMsg"></span>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="post" >우편번호</label>
                              </div>
                              <div>
                                  <input type="text" name="postcode" id="postcode" class="long-input" value="<%=m.getPostNumber() %>" readonly>
                              </div>
                          </div>
                          <div class="join-input-wrap">
                              <div>
                                  <label for="addr" >주소</label>
                              </div>
                              <div>
                                  <input type="text" name="address" id="address" class="long-input" value="<%=m.getMemberAddr()%>"readonly>
                              </div>
                          </div>
                          <div class="join-input-wrap bottomAddr">
                              <div>
                                  <label for="addr2" >상세주소</label>
                              </div>
                              <div>
                                  <input type="text" name="detailAddress" id="detailAddress" class="mid-input" value="<%=m.getMemberAddr2()%>">
                                  <button type="button" class="bc2 dup-btn" onclick="searchAddr();">주소변경</button>
                              </div>
                          </div>
                          <div class="updateComplete">
                              <button type="submit" class="bc2">수정하기</button>
                          </div>
                  </form>
        </div>
        <script>
        	$("#sendBtn").on("click",function(){
        		$(".emailCheck").css("display","block");
        	});
        	
            $(".sub-title").on("click", function(){
                $(this).next().slideToggle();
            });
                    
            $(".long-input").on("focusin",function(event){
                $(this).css("border-bottom", "2px solid black");
            });
            $(".long-input").on("focusout",function(event){
                $(this).css("border-bottom", "1px solid #ccc");
            });
            
            const result = [false,false,false];
            $("[name = memberPw]").on("change",function(){
                const pwReg = /^[a-zA-Z0-9!@#$^]{8,16}$/;
                const inputPw = $(this).val();
                const check = pwReg.test(inputPw);
                if(check){
                    $(this).next().next().text("안전한 비밀번호 입니다.");
                    $(this).next().next().css("color","green");
                    result[0]=true;
                }else{
                     $(this).next().next().text("비밀번호는 영어 소문자, 대문자, 숫자로 8~16글자 입니다.");
                    $(this).next().next().css("color","red");
                    result[0]=false;
                }
            });

            $("#memberName").on("change",function(){
            	const memberNameReg = /^[가-힣]{2,4}$/;
            	const memberName=$(this).val();
            	const memberNameCheck=memberNameReg.test(memberName);
            	if(!memberNameCheck){
            		$(this).next().next().text("아이디는 한글로 2글자이상 4글자이하입니다.");
            		$(this).next().next().css("color","red");
            		result[1]=true;
            	}else{
            		result[1]=false;
            	}
            	
            });
            
            $("#memberPhone").on("change",function(){
            	const memberPhoneReg = /^010-([0-9]{3,4})-([0-9]){4}$/;
            	const inputPhone = $(this).val();
            	const phoneCheck = memberPhoneReg.test(inputPhone);
            	$(this).next().next().empty();
            	if(!phoneCheck){
            		$(this).next().next().text("사용 불가능한 양식입니다.");
            		$(this).next().next().css("color","red");
            		result[2]=false;	
            	}else{
            		result[2]=true;
            	}
            	});
            
        </script>
        <script src = "js/emailApi.js"></script>
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </body>
    </html>