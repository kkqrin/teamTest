<%@page import="sp.report.vo.Report"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.modal-bg>.modal-wrap{
	margin-top: 150px;
    width: 1000px;
    background: #fff;
    height: auto;
    padding: 20px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<%if (m != null) {%>
		<div class="page-title">신고접수</div>
		<%--사진 첨부시 post, multipart 항상 고정 --%>
		<form action="reportWrite.do" method="post" enctype="multipart/form-data">
			<table class="tbl reportWrite">
				<tr class="tr-1">
					<th class="td-2">신고유형</th>
					<td colspan="3" style="padding-left: 20px; font-size: 14px">
						<label for="report-type1">
						<input type="radio" id="report-type1" name="reportType" value="0">
						입금
						</label>
					 	<label for="report-type2"style="margin-left: 30px;">
					 	<input type="radio" id="report-type2" name="reportType" value="1">
					 	배송
					 	</label>
					 </td>
				</tr>
				</tr>
				<tr class="tr-1">
					<th class="td-2">거래 내역</th>
					<td colspan="3" class="td-hidden">
						<span class="modal-result" style="font-family:nn-b;">거래 내역을 선택해주세요▶</span>
						<%--내 거래내역 조회(모달출력), select * from deal where member_no=2; -- 상품번호 출력 --%>
						<input type="hidden" id="memberNo" name="memberNo" value="<%=m.getMemberNo()%>">
						<button type="button" class="btn bc11 modal-open-btn"id="modal-ajax" target="#test-modal" style="margin-left: 10px;">
						거래 내역 조회
						</button>
						<%-- 거래 내역 조회 --%>
						<input type="hidden" name="productNo">
						<input type="hidden" name="productTitle">
						<input type="hidden" name="sellerId">				
						
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">신고자</th>
					<td><%=m.getMemberId()%>
					 	<input type="hidden"name="reportMember" value="<%=m.getMemberId()%>">
					 </td>

					<th class="td-2">이미지</th>
					<td>
						<%--accept 허용 할 확장자 onchange : 미리보기(이미지)--%>
						 <input type="file" name="upfile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);">
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">이미지 미리보기</th>
					<td colspan="3">
						<div id="img-viewer">
							<img id="img-view" width="500px">
						</div>
					</td>
				</tr>

				<tr class="tr-1">
					<th class="td-2">내용</th>
					<td colspan="3">
						<textarea name="reportContent" class="input-form">
상세 내용 :
피해 금액 :
						</textarea>
					</td>
				</tr>
				<tr class="tr-1">
					<th colspan="4">
						<button type="submit" class="btn bc44">등록</button>
					</th>
				</tr>
			</table>
		</form>

	</div>
	<div id="test-modal" class="modal-bg">
		<div class="modal-wrap">
			<div class="modal-head">
				<h2>거래 내역 조회</h2>
				<span class="material-icons close-icon modal-close">close</span>
			</div>
			<div class="modal-content">

				<table class="tbl" id="result">
				</table>
			</div>
			<div class="modal-foot">
				<button class="btn bc11 modalCheck">확인</button>
				<button class="btn bc1 modal-close">취소</button>
			</div>
		</div>
	</div>
		<%}%>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		function loadImg(f) {
			//첨부파일이 여러개일 수 있어서 항상 배열처리
			console.log(f.files);
			//파일 갯수가 0개가 아니고 && 첫 번째 파일이 정상파일이면
			if (f.files.length != 0 && f.files[0] != 0) {
				const reader = new FileReader();//파일정보를 얻어올 수 있는 객체
				//선택한 파일 정보를 읽어옴
				reader.readAsDataURL(f.files[0]);
				//파일리더가 정보를 다 읽어오면 동작할 함수
				reader.onload = function(e) {
					//읽어오면 결과가 e에 매개변수에 들어와있음 attr을 통해 src적용
					$("#img-view").attr("src", e.target.result);
				}
			} else {
				//src 값 삭제
				$("#img-view").attr("src", "");
			}
		}
		//ajax 모달출력
		$("#modal-ajax").on("click", function() {
			const memberNo = $("#memberNo").val();
			const result = $("#result");
			//console.log(memberNo);
			result.empty();
			$.ajax({
				url : "/ajaxProductModal.do",
				type : "post",
				data : {
					memberNo : memberNo
				},
				dataType : "json",
				success : function(data) {
					const tr1 = $("<tr>");
					const th1 = $("<th>");
					const th2 = $("<th>");
					const th3 = $("<th>");
					const th4 = $("<th>");
					const th5 = $("<th>");
					const th6 = $("<th>");
					const th7 = $("<th>");
					tr1.addClass("tr-1");

					th1.append("선택");
					th2.append("상품번호");
					th3.append("상품제목");
					th4.append("판매자");
					th5.append("상태");
					th6.append("예약완료일");
					th7.append("거래완료일");
					tr1.append(th1);
					tr1.append(th2);
					tr1.append(th3);
					tr1.append(th4);
					tr1.append(th5);
					tr1.append(th6);
					tr1.append(th7);

					result.append(tr1);
					for (let i = 0; i < data.length; i++) {
						const p = data[i];

						const tr2 = $("<tr>");
						const td6 = $("<td>");
						const td7 = $("<td>");
						const td8 = $("<td>");
						const td9 = $("<td>");
						const td10 = $("<td>");
						const td11 = $("<td>");
						const td12 = $("<td>");

						tr2.addClass("tr-0");
						const input = $("<input>");
						input.attr("type", "radio");
						input.attr("name", "modalRadio");
						//input.val(p.productNo);
						input.addClass("chk");
						
						td6.append(input);
						td7.append(p.productNo);
						td8.append(p.productTitle);
						td9.append(p.sellerId);
						if(p.productStatus==1){
						td10.append("예약중");
						}else if(p.productStatus==2){
						td10.append("거래완료");							
						}else if(p.productStatus==0){
						}
						td11.append(p.reserveDate);
						td12.append(p.completeDate);
						tr2.append(td6);
						tr2.append(td7);
						tr2.append(td8);
						tr2.append(td9);
						tr2.append(td10);
						tr2.append(td11);
						tr2.append(td12);

						result.append(tr2);

					
					$("[name=modalRadio]").eq(i).on("click", function(){
						
						$("[name=productNo]").val(p.productNo);
						$("[name=productTitle]").val(p.productTitle);
						$("[name=sellerId]").val(p.sellerId);
					});
					}
					
					
					
				},
				error : function() {
					console.log("서버 호출 실패")
				}
			});
		});
		
		//modal 확인버튼
		$(".modalCheck").on("click",function(){
			 $(this).parents(".modal-wrap").parent().css("display", "none");
			 ////const check = $("[name=modalRadio]");
			 //const checkVal = check.val();
			// console.log(checkVal);
			 const productNo = $("[name=productNo]").val();
			 const productTitle = $("[name=productTitle]").val();
			 const sellerId = $("[name=sellerId]").val();
			 $(".modal-result").text("상품번호 : "+productNo+" / "+" 상품제목 : "+productTitle+" / "+" 판매자 : "+sellerId);
			 
			 //ajax 판매자 회원번호 출력
			 const result = $(".td-hidden");
			 $.ajax({
				url : "/ajaxProductMemberNo.do",
				type : "post",
				data : {productNo : productNo},
				dataType : "json",
				success : function(data){
					console.log(data)
					//const p = data;
					const input = $("<input>");
					input.attr("type","text");
					input.attr("name","memberNo");
					input.attr("value",data.memberNo);
					result.append(input);
				},
				error : function(){
						console.log("서버 호출 실패");
				}
			 });
			 
		});
		
		
		
	</script>

</body>
</html>