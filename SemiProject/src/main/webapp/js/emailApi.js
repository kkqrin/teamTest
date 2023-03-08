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
		