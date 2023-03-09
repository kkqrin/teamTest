<%@page import="sp.product.vo.Product"%>
<%@page import="sp.report.vo.Report"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/mypage.css"> 
        <style>
        body{
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
        .closebtn{
            all:unset;
            background-color: steelblue;
            color: white;
            padding: 5px 20px;
            border-radius: 10px;
            cursor: pointer;
            text-align:center;
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
            padding: 50px 100px;
            margin: 0 auto;
            position: relative;
            top: 0px;
            width: 400px;
            border-radius:10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
           text-align: center;
        }
        h3{
           text-align: center;
        }
        
        .hidden{
            display: none;
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
                       <!-- <li><a href="/deleteMember.do" id="open">회원탈퇴</a></li>-->
                       <li><a id="open">회원탈퇴</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mypage-content">
            <div class="mypage-user-wrap">
                <div class="mypage-user-profile">
                    <div class="mypage-user-image">
                        <div class="material-icons" style="font-size:80px;color:#4e4e4e;">face</div>
                    </div>
                    <div class="mypage-user-info">
                        <div>[<%=m.getMemberName() %>]님</div>
                    </div>
                    <div class="mypage-user-text">
                        <div>온도 <%=m.getMemberTemp()%>도</div>
                        <%if(m.getMemberGrade()==2){%>
                        <div class="fc-7">이메일 인증 회원입니다.</div>
                    <%}else{ %>
                    	<div class="fc-6">이메일 미인증 회원입니다.</div>
                    <%} %>
                    </div>
                </div>
            </div>
        </div>
        
            <div class="modal hidden"><!--모달창을 처음에 안보이게하다가
                                보여주는걸 하기 위해서 처음엔 히든 클래스를 넣어 히드을 해주기 위해-->
        <div class="modal_overlay"></div>
        <div class="modal_content">
            <img src="img/lion.png" width="50px" height="50px" text-align:center;>
            <h3>회원탈퇴 하기</h3>
            <div class="login-content-wrap"style="text-align: center;">
                   
                    <div class="login-content">
                        <div class="pw">
                            <label for="memberPw">비밀번호 입력</label>
                        </div>
                        <div>
                            <input type="password" name="memberPw" id="memberPw" class = "long-input">
                            <input type = "text" name="checkPw" id=checkPw style="display:none;" >
                        </div>
                    </div>
                   <button type="button" class="bc1" name="search">확인</button>
                   
                    <button name=retire ><a href="/deleteMember.do"name="retire" style="display:none;">탈퇴하기</a></button>
                <button name="closeBtn">닫기</button>
            </div>
        </div>
    </div>
        
        
        
        

    </div>
	 <script>
	 
	 $("[name=search]").on("click",function(){
		
			 
			 const memberPw = $("[name=memberPw]").val();
			$.ajax({
				  url :"/retire.do",
				  type : "post",
				  data : {memberPw:memberPw},
				  success : function(data){
						  if(data != null){
							  $("#checkPw").val(data);
					 		$("[name=retire]").css("display","block")
					  	}else if(data==null){
						  console.log("fail");
						}
					  
				  }
				  });	
				 
			});
	 
	 
	 
	 
	
	 
	 

	 
        $(".mypage-navi-title").on("click", function(){
            $(this).next().slideToggle();
        });
        
     
        
        
        const openButton=document.getElementById("open");
        const modal = document.querySelector(".modal");

        /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
        const overlay = modal.querySelector(".modal_overlay");
        const closeBtn = modal.querySelector("[name=closeBtn]");

        const openModal  = () => {
            modal.classList.remove("hidden");
        }

        const closeModal = () => {
            modal.classList.add("hidden");
        }
        overlay.addEventListener("click",closeModal);
        closeBtn.addEventListener("click",closeModal);
        openButton.addEventListener("click",openModal);
        
        
   
        
     </script>
     <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </body>
    </html>