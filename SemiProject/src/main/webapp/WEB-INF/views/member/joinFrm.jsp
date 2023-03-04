<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
    <link rel = "stylesheet" href= "/css/join.css">
    <script src = "js/jquery-3.6.3.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
        <div class="join-wrap">
        <div class="join-header">
            <h1>회원가입</h1>
            <form name="checkIdFrm" action="/checkId.do"><%--id를 중복체크하는form태그로 새창을 띄우고 새창에서 중복체크를 할거임 --%>
				<input type="hidden" name="checkId">
			</form>
        </div>
        <div class="join-content">
            <form action="/join.do" method="post">
                <div class="join-input-wrap">
                    <div>
                        <label for="memberId">아이디 <sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="memberId" id="memberId" class = "mid-input" required="required">
                        <button type="button" class="bc1 dup-btn" id=idChkBtn>중복체크</button>
                    </div>
                </div>
                <div>
                    <div class="join-input-wrap">
                        <div>
                            <label for="memberPw">비밀번호<sup>*</sup></label>
                            <span class = "comment"></span>
                        </div>
                        <div>
                            <input type="password" name="memberPw" id="memberPw" class = "long-input" placeholder="영문,숫자,특수문자 조합 8-16자">
                            <span class = "comment"></span>
                        </div>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="memberPw2">비밀번호 확인<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="password" name="memberPw2" id = "memberPw2" class = "long-input">
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="memberName">이름<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="memberName" id="memberName" class = "long-input">
                    </div>
                </div>
                 <div class="join-input-wrap">
                    <div>
                        <label for="memberPhone">전화번호<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="memberPhone" id="memberPhone" class = "long-input">
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="email" >이메일<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="email" name="email" id="email" class="mid-input" placeholder="예) secondhandlion@lion.com">
                        <button type="button" class="bc1 dup-btn" id="sendBtn">메일전송</button>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="email" >이메일 인증하기<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="email" id="authCode" class="mid-input" placeholder="인증번호 입력">
                        <button type="button" class="bc1 dup-btn"id="authBtn">인증하기</button>
                         <span id="timeZone"></span>
                        <span id="authMsg"></span>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="post" >우편번호<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="postcode" id="postcode" class="long-input" readonly>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="addr" >주소<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="address" id="address" class="long-input" readonly>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="addr2" >상세주소<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="detailAddress" id="detailAddress" class="mid-input" >
                        <button type="button" class="bc1 dup-btn" onclick="searchAddr();">주소찾기</button>
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
                        <label for="sub-choicecheck2"></label>
                        <lable class="check-message">
                            이메일
                        </lable>
                    </div>
                </div>
                <div class = "join-btn-wrap">
                    <button type="submit b">회원가입</button>
                </div>
            </form>
        </div>
 			<script>
 			$("#memberId").on("keyup",function(){
 				const memberId =$(this).val();
 				//정규표현식으로 아이디 정규식 검사
 				//정규식 통과되면 ajax로 중복체크
 				$.ajax({
 					url : "/ajaxCheckId.do",
 					type : "get",
 					data : {memberId:memberId},
 					success : function(data){
 						if(data == "1"){
 							$("#ajaxCheckId").text("이미 사용중인 아이디 입니다.");
 							$("#ajaxCheckId").css("color","red");
 							$("#memberId").css("border","1px solid red");
 						}else if(data =="0"){
 							$("#ajaxCheckId").text("사용가능한 아이디 입니다.");
 							$("#ajaxCheckId").css("color","green");
 							$("#memberId").css("border","1px solid green");
 						}
 					}
 				});
 			});
 			
 			$("#idChkBtn").on("click",function(){
 				//중복체크 버튼을 눌렀을 때 id에 입력된 값을 받아와야 하므로 그 입력된 값을 받아옴
 				const memberId =$("#memberId").val();
 				if(memberId==""){//만약에 빈값일 경우 alert를 뜨게 함
 					alert("아이디를 입력하세요");
 					return;
 				}	
 				//아이디 중복체크를 위해서 숨겨놓은 form태그 내부의 인풋에 입력한 아이디값 세팅
 				$("[name=checkId]").val(memberId);
 				
 				//숨겨놓은 form을 바로 submit하면 화면이 새로 로드됨
 				//화면이 새로 로드되면 ->입력했던 정보가 사라짐
 				//->새창을 띄운 후 새창에서 숨겨둔 form을 submit진행
 				
 				//"checkId"는 새창의 이름을 의미함
 				window.open("","checkId","left=700px,top=300px,width=300px,height=200px,menubar=no,status=no,scrollbars=yes");
 				
 				//새창과 숨겨둔 form을 연결
 				$("[name=checkIdFrm]").attr("target","checkId");//숨겨둠 폼태그에 타겟 속성으로 checkId라는 값을 넣어줌
 																//그럼 중복체크를 위한 새창과 중복체크를 위한 아이디 입력칸이 서로 연결이되어
 																//새창을 열면 중복체크를 위한 아이디를 입력할 수 있는 칸이 나오게 됨
 				$("[name=checkIdFrm]").submit();
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
				},
				error:function(){
					console.log("에러");
				}
			});
		});
		$("#authBtn").on("click",function(){
			if(mailCode==null){
				$("#authMsg").text("인증 시간 만료");
				$("#authMsg").css("color","red");
			}else{
			const authCode=$("#authCode").val();
			if(authCode==mailCode){
				$("#authMsg").prop("readonly",true);
				$("#authMsg").text("인증완료");
				$("#authMsg").css("color","green");
				window.clearInterval(intervalId)
			}else{
				$("#authMsg").text("인증실패");
				$("#authMsg").css("color","red");
			}
			}
		});
		let intervalId;
		function authTime(){
			$("#timeZone").html("<span id='min'>0</span> : <span id='sec'>30</span>");
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
					$("#authMsg").css("color","red");
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
      <script src = "js/join.js"></script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body> 
</html>