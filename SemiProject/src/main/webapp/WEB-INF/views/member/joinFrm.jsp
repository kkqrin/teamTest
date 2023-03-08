<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href= "/css/join.css">
    <script src="js/jquery-3.6.3.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <style>
            .modalCloseImg{
            top: 5px;
            right: 0;
            position: absolute;
            padding: 5px 20px; 
            cursor: pointer;
           
        }
        .modal{
           
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
                              
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
            padding: 50px 50px;
            text-align: center;
           position: relative;
            top: 0px;
            width: 500px;
            border-radius:10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
   
        .hidden{
            display: none;
        }
.modal-content-wrap{
    
   height:400px;
   overflow: scroll;
}
.modal-content{
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
}

.modal_in_title{
padding:10px 0;
}
       .modalCloseImg2{
            top: 5px;
            right: 0;
            position: absolute;
            padding: 5px 20px; 
            cursor: pointer;
           
        }
        
        .modal2{
          
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
                               
        }
        .modal_overlay2{
         
            background-color: rgba(0,0,0,0.6);
            width: 100%;
            height: 100%;
            position: absolute;

        }
        .modal_content2{
            background-color: white;
            padding: 50px 50px;
            text-align: center;
            position: relative;
            top: 0px;
            width: 500px;
            border-radius:10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
   
        .hidden2{
            display: none;
        }
.modal-content-wrap2{
    
   height:400px;
   overflow: scroll;
}
.modal-content2{
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
}

.join-input-wrap input{
	padding-top: 20px;
}
    </style>
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
                        <button type="button" class="bc1 dup-btn" id=idChkBtn disabled>중복체크</button>
                        <span class = "comment" id="ajaxCheckId"></span>
                    </div>
                </div>
                <div>
                    <div class="join-input-wrap">
                        <div>
                            <label for="memberPw">비밀번호<sup>*</sup></label>
                            <span class = "comment"></span>
                        </div>
                        <div>
                            <input type="password" name="memberPw" id="memberPw" class = "long-input" placeholder="영문,숫자,특수문자 조합 8-16자" required="required">
                            <span class = "comment"></span>
                        </div>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="memberPw2">비밀번호 확인<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="password" name="memberPw2" id ="memberPw2" class = "long-input" required="required">
                        <span class = "comment"></span>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="memberName">이름<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="memberName" id="memberName" class = "long-input" required="required">
                    	 <span class = "comment"></span>
                    </div>
                </div>
                 <div class="join-input-wrap">
                    <div>
                        <label for="memberPhone">전화번호<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="memberPhone" id="memberPhone" class = "long-input" placeholder="전화번호는 010으로 시작 - 포함 예) 010-1234-5678" required="required";>
                        <span class = "comment"></span>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="email" >이메일</label>
                    </div>
                    <div>
                        <input type="email" name="email" id="email" class="mid-input" placeholder="예) secondhandlion@lion.com">
                        <button type="button" class="bc1 dup-btn" id="sendBtn">메일전송</button>
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="email" >이메일 인증하기</label>
                    </div>
                    <div>
                        <input type="text" name="email" id="authCode" class="mid-input" placeholder="인증번호 입력">
                        <button type="button" class="bc1 dup-btn"id="authBtn">인증하기</button>
                         <span id="timeZone"></span>
                        <span id="authMsg"></span>
                        <input type="text" name="memberGrade" id=memberGrade value=3 style="display:none;">
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="post" >우편번호<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="postcode" id="postcode" class="long-input" readonly required="required">
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="addr" >주소<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="address" id="address" class="long-input" readonly required="required">
                    </div>
                </div>
                <div class="join-input-wrap">
                    <div>
                        <label for="addr2" >상세주소<sup>*</sup></label>
                    </div>
                    <div>
                        <input type="text" name="detailAddress" id="detailAddress" class="mid-input" required="required">
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
                            이용약관 동의 <a href="#" id="open">전체보기</a>
					    <!--overlay는 배경색이 될 어두운 부분-->
					    <div class="modal hidden"><!--모달창을 처음에 안보이게하다가
					                                보여주는걸 하기 위해서 처음엔 히든 클래스를 넣어 히드을 해주기 위해-->
					        <div class="modal_overlay"></div>
					        <div class="modal_content">
					            <img src="img/lion.png" width="50px" height="50px">
					           <img class="modalCloseImg" src="img/close-window-26.png">
					            <h3 class="modal_in_title">이용약관</h3>
					            
					                <div class="modal-content-wrap" style="margin:10px 0;">
					              <p>
					                중고사자 서비스 이용약관은 다음과 같은 내용을 담고 있습니다.
									여러분을 환영합니다.
									다양한 중고사자 서비스를 즐겨보세요.
									회원으로 가입하시면 중고사자 서비스를 보다 편리하게 이용할 수 있습니다.
									여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
									여러분의 개인정보를 소중히 보호합니다.
									타인의 권리를 존중해 주세요.
									중고사자 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.
									중고사자에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.
									부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.
									중고사자의 잘못은 중고사자가 책임집니다.
									일부 중고사자 서비스에는 광고가 포함되어 있습니다.
									언제든지 중고사자 서비스 이용계약을 해지하실 수 있습니다.
									서비스 중단 또는 변경 시 꼭 알려드리겠습니다.
									주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.
									여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.
									여러분을 환영합니다.
									중고사자 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 중고사자 서비스의 이용과 관련하여 중고사자 서비스를 제공하는 중고사자 주식회사(이하 ‘중고사자’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
									
									중고사자 서비스를 이용하시거나 중고사자 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다
									
									다양한 중고사자 서비스를 즐겨보세요.
									중고사자는 www.secondhandlion.com을 비롯한 중고사자 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.
									
									중고사자는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만,'청소년보호법'등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
									
									중고사자 서비스에는 기본적으로 본 약관이 적용됩니다만 중고사자가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.
									
									회원으로 가입하시면 중고사자 서비스를 보다 편리하게 이용할 수 있습니다.
									여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 중고사자는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.
									
									회원은 자신의 계정을 통해 좀더 다양한 중고사자 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 중고사자 회원가입 방법 등에서 확인해 주세요.
									
									중고사자는 단체에 속한 여러 구성원들이 공동의 계정으로 중고사자 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다. 따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
									
									단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.
					              </p>
					                </div>
					        </div>
					    </div>
                        </lable>
                    </div>
                    <div class="sub-agree-check">
                        <input type="checkbox" name="subcheck" id="subcheck2">
                        <label for="subcheck2" class="subchecksel"></label>
                        <lable class = "check-message">
                            개인정보 수집 및 이용 동의  <a href="#" id="open2">전체보기</a>
							    <div class="modal2 hidden2">
							        <div class="modal_overlay2"></div>
							        <div class="modal_content2">
							            <img src="img/lion.png" width="50px" height="50px">
							           <img class="modalCloseImg2" src="img/close-window-26.png">
							            <h3 class="modal_in_title">개인정보 수집 및 이용동의</h3>
							                <div class="modal-content-wrap2">
							              <p>
							                중고사자 서비스 이용약관은 다음과 같은 내용을 담고 있습니다.
											여러분을 환영합니다.
											다양한 중고사자 서비스를 즐겨보세요.
											회원으로 가입하시면 중고사자 서비스를 보다 편리하게 이용할 수 있습니다.
											여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
											여러분의 개인정보를 소중히 보호합니다.
											타인의 권리를 존중해 주세요.
											중고사자 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.
											중고사자에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.
											부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.
											중고사자의 잘못은 중고사자가 책임집니다.
											일부 중고사자 서비스에는 광고가 포함되어 있습니다.
											언제든지 중고사자 서비스 이용계약을 해지하실 수 있습니다.
											서비스 중단 또는 변경 시 꼭 알려드리겠습니다.
											주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.
											여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.
											여러분을 환영합니다.
											중고사자 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 중고사자 서비스의 이용과 관련하여 중고사자 서비스를 제공하는 중고사자 주식회사(이하 ‘중고사자’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
											
											중고사자 서비스를 이용하시거나 중고사자 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다
											
											다양한 중고사자 서비스를 즐겨보세요.
											중고사자는 www.secondhandlion.com을 비롯한 중고사자 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.
											
											중고사자는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만,'청소년보호법'등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
											
											중고사자 서비스에는 기본적으로 본 약관이 적용됩니다만 중고사자가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.
											
											회원으로 가입하시면 중고사자 서비스를 보다 편리하게 이용할 수 있습니다.
											여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 중고사자는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.
											
											회원은 자신의 계정을 통해 좀더 다양한 중고사자 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 중고사자 회원가입 방법 등에서 확인해 주세요.
											
											중고사자는 단체에 속한 여러 구성원들이 공동의 계정으로 중고사자 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다. 따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
											
											단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.
										</p>
							         </div>
							        </div>
							    </div>
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
                    <button class="bc1" type="submit" id="joinComplete">회원가입</button>
                </div>
            </form>
        </div>
        </div>
 			<script>
 		
 			
 			
 			const result = [false,false,false,false,false,false,false];
 			
			$("#memberId").on("keyup",function(){
 				const idReg = /^[a-z0-9]{4,8}$/;
 				const memberIdVal=$(this).val();
 				const memberIdCheck=idReg.test(memberIdVal);
 				$(this).next().next().empty();
 				$("#idChkBtn").prop("disabled",true);
 				if(!memberIdCheck){
 					$(this).next().next().text("아이디는 영어 소문자, 숫자 4~8글자 입니다.");
 					$(this).next().next().css("color","red");
 					result[0]=false;
 				}else{
 					$("#idChkBtn").prop("disabled",false);
 					result[0]=true;
 				}
 				
 			});
 			
 			$("[name = memberPw]").on("change",function(){
 			    const pwReg = /^[a-zA-Z0-9!@#$^]{8,16}$/;
 			    const inputPw = $(this).val();
 			    const check = pwReg.test(inputPw);
 			    if(check){
 			        $(this).next().text("안전한 비밀번호 입니다.");
 			        $(this).next().css("color","green");
 			        result[1]=true;
 			    }else{
 			         $(this).next().text("비밀번호는 영어 소문자, 대문자, 숫자로 8~16글자 입니다.");
 			        $(this).next().css("color","red");
 			        result[1]=false;
 			    }
 			});
 			
 			$("#memberPw2").on("change",function(){
 				const inputPw =$("#memberPw").val();
 				const memberPw2Val=$(this).val();
 				$(this).next().empty();
 				if(inputPw == memberPw2Val){
 					$(this).next().text("비밀번호가 일치합니다.");
 					$(this).next().css("color","green");
 					result[2]=true;
 				} else{
 					$(this).next().text("비밀번호가 일치하지 않습니다.");
 					$(this).next().css("color","red");
 					result[2]=false;
 				}
 			});
 			
 			$("[name=memberName]").on("change",function(){
			     const memberNameReg = /^[가-힣]{2,4}$/;
			     const memberName=$(this).val();
			     const memberNameCheck=memberNameReg.test(memberName);
			     	$(this).next().empty();
			         if(!memberNameCheck){
			          	$(this).next().text("아이디는 한글로 2글자이상 4글자이하입니다.");
			            $(this).next().css("color","red");
			           result[3]=false;
			         }else{
			        	 result[3]=true;
			         }
			            	
			});
 			
 			$("#memberPhone").on("change",function(){
 				const memberPhoneReg = /^010-([0-9]{3,4})-([0-9]){4}$/;
 				const inputPhone = $(this).val();
 				const phoneCheck = memberPhoneReg.test(inputPhone);
 				$(this).next().empty();
 				if(!phoneCheck){
 					$(this).next().text("사용 불가능한 양식입니다.");
 					$(this).next().css("color","red");
 					result[4]=false;	
 				}else{
 					result[4]=true;
 					}
 				});
 				
 			$()
 			
 			$("#necessarycheck").on("click",function(){
 				const check = $(this).is(":checked");
 				if(check==true){
 					result[5]=true;
 				}else{
 					result[5]=false;
 				}
 			});
 			
 			$("#subcheck1").on("click",function(){
 				const subchecked1 = $(this).is(":checked");
 				if(subchecked1==true){
 					result[6]=true;
 				}else{
 					result[6]=false;
 				}
 			});
 			
 			$("#subcheck2").on("click",function(){
 				const subchecked2 = $(this).is(":checked");
 				console.log(subchecked2);
 				if(subchecked2==true){
 					result[7]=true;
 				}else{
 					result[7]=false;
 				}
 			});
 			
 			
 			$("#joinComplete").on("click",function(event){
 				if(!(result[0]&&result[1]&&result[2]&&result[3]&&result[4]&&(result[5]||result[6]&&result[7]))){
 					event.preventDefault();
 					return false;
 				}
 			});

 			$("#idChkBtn").on("click",function(){
 				const memberId =$("#memberId").val();
 				if(memberId==""){
 					alert("아이디를 입력하세요");
 					return;
 				}	
 				
 				$("[name=checkId]").val(memberId);
 				
 		
 				window.open("","checkId","left=700px,top=300px,width=300px,height=200px,menubar=no,status=no,scrollbars=yes");
 				
 				
 				$("[name=checkIdFrm]").attr("target","checkId");
 																
 				$("[name=checkIdFrm]").submit();
 			});
		
 		//mail Api위한것
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
				$("#memberGrade").val(3);
			}else{
			const authCode=$("#authCode").val();
			if(authCode==mailCode){
				$("#authMsg").prop("readonly",true);
				$("#authMsg").text("인증완료");
				$("#authMsg").css("color","green");
				$("#memberGrade").val(2);
				window.clearInterval(intervalId)
			}else{
				$("#authMsg").text("인증실패");
				$("#authMsg").css("color","red");
				$("#memberGrade").val(3);
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
		
		//addressApi위한것
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
		
		  const openButton=document.getElementById("open");
	        const modal = document.querySelector(".modal");

	        /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
	        const overlay = modal.querySelector(".modal_overlay");
	        const modalCloseImg = modal.querySelector(".modalCloseImg");

	        const openModal  = () => {
	            modal.classList.remove("hidden");
	        }

	        const closeModal = () => {
	            modal.classList.add("hidden");
	        }
	        overlay.addEventListener("click",closeModal);
	        modalCloseImg.addEventListener("click",closeModal);
	        openButton.addEventListener("click",openModal);

	        
	        
	        const opentag=document.getElementById("open2");
	        const modal2 = document.querySelector(".modal2");

	        /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
	        const overlay2 = modal2.querySelector(".modal_overlay2");
	        const modalCloseImg2 = modal2.querySelector(".modalCloseImg2");

	        const openModal2  = () => {
	            modal2.classList.remove("hidden2");
	        }

	        const closeModal2 = () => {
	            modal2.classList.add("hidden2");
	        }
	        overlay2.addEventListener("click",closeModal2);
	        modalCloseImg2.addEventListener("click",closeModal2);
	        opentag.addEventListener("click",openModal2);

			

		</script>
      <script src = "/js/join.js"></script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body> 
</html>