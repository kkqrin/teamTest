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
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script src = "js/jquery-3.6.3.min.js"></script>
      <style>
        body{
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
       button{
       	    border-radius:10px;
            border:none;
            cursor: pointer;
        }
        .modal{
            /*position을 absolute에서 fixed로 변경
            왜냐? fixed를 하면 스크롤을 내려도 그 자리에 고정되어 있기때문에*/
            /*box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
            여기에 있던 이것을 modal_content로 이동*/
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;/*justfy-content는 가로축을 중심축으로 함*/
            align-items: center;/*align-items는 세로축을 중심축으로 함
                                즉, center를 넣으면 세로축의 중앙으로 정렬하게 됨*/
        }
        .modal_overlay{
            /*모달 전체 배경색 설정*/
            background-color: rgba(0,0,0,0.6);
            width: 100%;
            height: 100%;
            position: absolute;

        }
        .modal_content{
            background-color: white;
            padding:10px 10px;
            text-align: center;
            position: relative;
            top: 0px;
            width: 400px;
            border-radius:10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
        h1{
            margin: 0;
        }
        .hidden{
            display: none;
        }
        .find-content-wrap{
    margin-top: 20px;
   
}
.find-content{
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
}
.find-input>input{
    border: none;
    border-bottom: 1px solid black;
    width: 100%;
}
.find-id{
    margin: 10px 0;
    font-size: 18px;
    font-weight: bold;
}






      button{
       	    border-radius:10px;
            border:none;
            cursor: pointer;
        }
        .modal2{
            /*position을 absolute에서 fixed로 변경
            왜냐? fixed를 하면 스크롤을 내려도 그 자리에 고정되어 있기때문에*/
            /*box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
            여기에 있던 이것을 modal_content로 이동*/
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;/*justfy-content는 가로축을 중심축으로 함*/
            align-items: center;/*align-items는 세로축을 중심축으로 함
                                즉, center를 넣으면 세로축의 중앙으로 정렬하게 됨*/
        }
        .modal_overlay2{
            /*모달 전체 배경색 설정*/
            background-color: rgba(0,0,0,0.6);
            width: 100%;
            height: 100%;
            position: absolute;

        }
        .modal_content2{
            background-color: white;
            padding:10px 10px;
            text-align: center;
            position: relative;
            top: 0px;
            width: 400px;
            border-radius:10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
        h1{
            margin: 0;
        }
        .hidden2{
            display: none;
        }
        .find-content-wrap2{
        margin-top: 20px;
   
}
.find-content2{
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
}
.find-input2>input{
    border: none;
    width: 100%;
    text-align: center;
    border: none;
    border-bottom: 1px solid black;

}
.find-pw{
    margin: 10px 0;
    font-size: 18px;
    font-weight: bold;
}




    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%
	Member member=(Member)request.getAttribute("member");
	%>
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
                    <button type="submit" class="bc1 f-regular">로그인</button>
                </div>
            </form>
            <div class="login-content-bottom">
                <div>
                    <a href="/joinFrm.do" class="f-regular">회원가입</a>
                </div>
                <div class="findId">
                    <!--  <a href="/searchIdFrm.do" id="open" class="f-regular">아이디 찾기</a>-->
             
					 <a class="f-regular"id="open" style="cursor: pointer;">아이디 찾기</a>
				    <div class="modal hidden">
				        <div class="modal_overlay"></div>
				        <div class="modal_content">
				       
				            <img src="img/lion.png" width="50px" height="50px">
				            <h3>아이디 찾기</h3>
				                <div class="find-content-wrap">
				                    <div class="find-content">
				                        <label for="memberPhone">전화번호 입력</label>
				                    </div>
				                    <div class="find-input">
				                        <input type="text" name="memberPhone">
				                        <button type="submit"class=".bc4" name="search" style="margin-top:10px; width:100%; height:30px;">찾기</button>
				                    </div>
				                    <div class="find-id">
				                   		<p></p>
				                   		<p></p>
				                   		<p></p>
				                    </div>
				                </div>
				                <button type="button" class=".bc4"id="close1" style="width:100%; height:30px;">닫기</button>
				            </div>
				    </div>
                </div> 
                   <div class="findPw">
                    <!--  <a href="/searchIdFrm.do" id="open" class="f-regular">아이디 찾기</a>-->
             
					 <a class="f-regular"id="open2" style="cursor: pointer;">비밀번호 찾기</a>
				    <div class="modal2 hidden2">
				        <div class="modal_overlay2"></div>
				        <div class="modal_content2">
				       
				              <img src="img/lion.png" width="50px" height="50px">
                <h3>비밀번호 찾기</h3>
                    <div class="find-content-wrap2">
                        <div class="find-content2">
                            <label for="memberId">아이디 입력</label>
                        </div>
                        <div class="find-input2">
                            <input type="text" name="memberId" placeholder="아이디 입력">
                        </div>
                            <div class="find-content2" style="margin-top: 20px; ">
                                <label for="email" >이메일</label>
                            </div>
                            <div class="find-input2">
                                <input type="email" name="email" id="email" placeholder="예) secondhandlion@lion.com">
                                <button type="button" class="bc1 dup-btn" id="sendBtn" style="width:100%; height:30px;">메일전송</button>
                            </div>
                            <div class="find-content2" style="margin-top: 20px;">
                                <label for="email">이메일 인증하기</label>
                            </div>
                            <div class="find-input2">
                                <input type="text" name="emailCheck" id="authCode"  placeholder="인증번호 입력">
                                <button type="button" class="bc1 dup-btn"id="authBtn" style="width:100%; height:30px; ">인증하기</button>
                                 <span id="timeZone"></span>
                                <span id="authMsg"></span>
                            </div>
                            <div class="find-input2">
                                <button type="button" name="searchPwBtn" class="bc1"  style="width:100%; height:30px; margin-top:20px;">비밀번호 찾기</button>
                            </div>
                        <div class="find-pw">
                               <p>비밀번호는</p>
                               <p>.........</p>
                               <p>입니다.</p>
                        </div>
                    </div>
                    <button type="button" class="bc1"id="close2" style="width:100%; height:30px;">닫기</button>
				            </div>
				    </div>
                </div> 
            </div>
        </div>
    </div>
 
    <script src = "js/login.js"></script>
   <script>
   /////////아이디 찾기 값 받아오는것/////////////////////
   $("[name=search]").on("click",function(){
	   const memberPhone = $("[name=memberPhone]").val();
	   $.ajax({
		  url :"/searchId.do",
		  type : "post",
		  data : {memberPhone:memberPhone},
		  success : function(data){
				  const findId= $(".find-id");
			  findId.children().first().next().empty();
			  findId.children().first().next().next().empty();
			  findId.children().first().empty();
			  if(data != null){
				  console.log(data);
				  const p = $("<p></p>");
				  const p2 = $("<p></p>");
				  const p3 = $("<p></p>");
				  p.text(data);
				  p2.text("아이디는");
				  p3.text("입니다");
				  findId.children().first().next().append(p);
				  findId.children().first().append(p2);
				  findId.children().first().next().next().append(p3);
			  }else if(data==0){
				 
			  }
		  }
	   });
   });	

/////////////////아이디 찾기/////////////////////////
   const openButton=document.getElementById("open");
   const modal = document.querySelector(".modal");

   /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
   const overlay = modal.querySelector(".modal_overlay");
   const closeBtn = modal.querySelector("#close1");
   const openModal  = () => {
       modal.classList.remove("hidden");
   }

   const closeModal = () => {
       modal.classList.add("hidden");
   }
   overlay.addEventListener("click",closeModal);
   closeBtn.addEventListener("click",closeModal);
   openButton.addEventListener("click",openModal);
   
   
//////////////////////비밀번호찾기//////////////////////
   const openButton2=document.getElementById("open2");
   const modal2 = document.querySelector(".modal2");

   /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
   const overlay2 = modal2.querySelector(".modal_overlay2");
   const closeBtn2 = modal2.querySelector("#close2");
   const openModal2  = () => {
       modal2.classList.remove("hidden2");
   }

   const closeModal2 = () => {
       modal2.classList.add("hidden2");
   }
   overlay2.addEventListener("click",closeModal2);
   closeBtn2.addEventListener("click",closeModal2);
   openButton2.addEventListener("click",openModal2);
   
   ///////////////////비밀번호찾기 값 받아오기//////////////////
   $("[name=searchPwBtn]").on("click",function(){
	   const memberId = $("[name=memberId]").val();
	   const email = $("[name=email]").val();
	   const emailCheck = $("[name=emailCheck]").val();
	   
   });
   
   
   
   
   
   
   
   </script>
   <script src = "js/emailApi.js"></script>
 <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>