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
<div class="page-content">
        <div class="mypage-navi-wrap">
            <div class="page-title">마이페이지</div>
            <div class="mypage-navi">
                <div class="mypage-navi-box more">
                    <div class="mypage-navi-title">거래 정보</div>
                    <ul class="mypage-subnavi">
                        <li><a href="/selectMyDeal.do?memberNo=<%=m.getMemberNo()%>">구매 내역</a></li>
                        <li><a href="/myStore.do?sellerId=<%=m.getMemberId()%>&loginId=<%=m.getMemberId()%>">판매 내역</a></li>
                    </ul>
                </div>
                <div class="mypage-navi-box more">
                    <div class="mypage-navi-title">내 정보</div>
                    <ul class="mypage-subnavi">
                        <li><a href="/profileUpdate.do">내 정보 수정</a></li>
                        <li><a href="/deleteMember.do">회원탈퇴</a></li>
                    </ul>
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
                                  <button type="button" class="bc1 dup-btn" id="sendBtn">메일변경</button>
                              </div>
                          </div>
                          <div class="join-input-wrap emailCheck">
                              <div>
                                  <label for="email" >이메일 인증하기</label>
                              </div>
                              <div>
                                  <input type="text" name="email" id="authCode" class="mid-input" placeholder="인증번호 입력">
                                  <button type="button" class="bc2 dup-btn"id="authBtn">인증하기</button>
                                  <input type="text" name="memberGrade" id=memberGrade value="<%=m.getMemberGrade() %>" style="display:none;">
                                  <br>
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
                                  <button type="button" class="bc1 dup-btn" onclick="searchAddr();">주소변경</button>
                              </div>
                          </div>
                          <div class="updateComplete">
                              <button type="submit" class="bc1" id="updateComplete">수정하기</button>
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
            
            const result = [true,true,true];
            $("[name = memberPw]").on("change",function(){
                const pwReg = /^[a-zA-Z0-9!@#$^]{8,16}$/;
                const inputPw = $(this).val();
                const check = pwReg.test(inputPw);
                $(this).next().next().empty();
                if(check){
                    $(this).next().next().text("안전한 비밀번호 입니다.");
                    $(this).next().next().css("color","#236CDA");
                    result[0]=true;
                }else{
                     $(this).next().next().text("비밀번호는 영어 소문자, 대문자, 숫자로 8~16글자 입니다.");
                    $(this).next().next().css("color","#EB3C4E");
                    result[0]=false;
                }
            });

            $("#memberName").on("change",function(){
            	const memberNameReg = /^[가-힣]{2,4}$/;
            	const memberName=$(this).val();
            	const memberNameCheck=memberNameReg.test(memberName);
            	$(this).next().next().empty();
            	if(!memberNameCheck){
            		$(this).next().next().text("아이디는 한글로 2글자이상 4글자이하입니다.");
            		$(this).next().next().css("color","#EB3C4E");
            		result[1]=false;
            	}else{
            		result[1]=true;
            	}
            	
            });
            
            $("#memberPhone").on("change",function(){
            	const memberPhoneReg = /^010-([0-9]{3,4})-([0-9]){4}$/;
            	const inputPhone = $(this).val();
            	const phoneCheck = memberPhoneReg.test(inputPhone);
            	$(this).next().next().empty();
            	if(!phoneCheck){
            		$(this).next().next().text("사용 불가능한 양식입니다.");
            		$(this).next().next().css("color","#EB3C4E");
            		result[2]=false;	
            	}else{
            		result[2]=true;
            	}
            	});
            
            $("#updateComplete").on("click",function(event){
            	if(!(result[0]&&result[1]&&result[2])){
            		event.preventDefault();
            		return false;
            	}
            });
            
            let mailCode;
    		$("#sendBtn").on("click",function(){
    			const email = $("#email").val();
    			$.ajax({
    				url:"/sendMail.do",
    				data:{email:email},
    				type:"post",
    				success:function(data){
    					if(data=="null"){
    						alert("이메일 주소를 똑바로 입력하세요");
    					}else{
    						mailCode=data;
    						$("#auth").slideDown();
    						authTime();
    					}
    				}/* ,
    				error:function(){
    					console.log("에러");
    				} */
    			});
    		});
    		$("#authBtn").on("click",function(){
    			if(mailCode==null){
    				$("#authMsg").text("인증 시간 만료");
    				$("#authMsg").css("color","#EB3C4E");
    				$("#memberGrade").val(3);
    			}else{
    			const authCode=$("#authCode").val();
    			if(authCode==mailCode){
    				$("#authMsg").prop("readonly",true);
    				$("#authMsg").text("인증완료");
    				$("#authMsg").css("color","#236CDA");
    				$("#memberGrade").val(2);
    				window.clearInterval(intervalId)
    				
    			}else{
    				$("#authMsg").text("인증실패");
    				$("#authMsg").css("color","#EB3C4E");
    				$("#memberGrade").val(3);
    			}
    			}
    		});
    		let intervalId;
    		function authTime(){
    			$("#timeZone").html("<span id='min'>03</span> : <span id='sec'>00</span>");
    			intervalId = window.setInterval(function(){
    				timeCount();
    			},1000);
    			
    		}
    		function timeCount() {
    			const min=$("#min").text();
    			const sec =$("#sec").text();
    			if(sec=="00"){
    				if(min!="0"){
    					const newMin=Number(min)-1;
    					$("#min").text(newMin);
    					$("#sec").text(59);		
    				}else{
    					window.clearInterval(intervalId);
    					mailCode = null;
    					$("#authMsg").text("인증 시간 만료");
    					$("#authMsg").css("color","#EB3C4E");
    				}
    			}else{
    				const newSec = Number(sec) - 1;
    				if(newSec<10){
    					$("#sec").text("0"+newSec);

    				}else{
    					$("#sec").text(newSec);

    				}
    			}
    		}
            
    		function searchAddr(){
    			new daum.Postcode({
    		        oncomplete: function(data) {
    		        	$("#postcode").val(data.zonecode);
    		        	$("#address").val(data.address);
    		        	$("#detailAddress").focus();
    		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
    		        }
    		    }).open();		
    		}
    		
    		
    		
        </script>
     
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </body>
    </html>