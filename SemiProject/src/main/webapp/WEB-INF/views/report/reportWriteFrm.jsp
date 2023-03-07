<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="page-title">신고게시판 작성</div>
		<%--사진 첨부시 post, multipart 항상 고정 --%>
		<form action="/photoWrite.do" method="post" enctype="multipart/form-data">
			<table class="tbl reportWrite">
				<tr class="tr-1">
					<th class="td-2">신고유형</th>
					<td colspan="3" style="padding-left:20px; font-size:14px">
						<label for="report-type1"><input type="radio" id="report-type1" name="report" values="0">입금</label>
						<label for="report-type2" style="margin-left: 30px;"><input type="radio" id="report-type2" name="report" values="1">배송</label>
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">거래 내역</th>
					<td colspan="3">
						<strong>거래 내역을 선택해주세요▶<button type="button" class="btn bc11 modal-open-btn" target="#test-modal" style="margin-left:10px;" >거래 내역 조회</button></strong>
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">신고자</th>
					<td>
						<%=m.getMemberId() %>
						<input type="hidden" name="reportMember" value="<%=m.getMemberId() %>">
					</td>
					
					<th class="td-2">이미지</th>
					<td>
						<%--accept 허용 할 확장자 onchange : 미리보기(이미지)--%>
						<input type="file" name="imageFile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);">
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
						<textarea name="reportContent" class="input-form"></textarea>
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
	
	<script>
		function loadImg(f){
			//첨부파일이 여러개일 수 있어서 항상 배열처리
			console.log(f.files);
			//파일 갯수가 0개가 아니고 && 첫 번째 파일이 정상파일이면
			if(f.files.length != 0 && f.files[0] !=0){
				const reader = new FileReader();//파일정보를 얻어올 수 있는 객체
				//선택한 파일 정보를 읽어옴
				reader.readAsDataURL(f.files[0]);
				//파일리더가 정보를 다 읽어오면 동작할 함수
				reader.onload = function(e){
					//읽어오면 결과가 e에 매개변수에 들어와있음 attr을 통해 src적용
					$("#img-view").attr("src",e.target.result);
				}
			}else{
				//src 값 삭제
				$("#img-view").attr("src","");
			}
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<div id="test-modal" class="modal-bg">
       <div class="modal-wrap">
           <div class="modal-head">
           <h2>전체 거래 내역 조회</h2>
           <span class="material-icons close-icon modal-close">close</span>
           </div>
           <div class="modal-content">
           <p>모달내용</p>
           <p>모달내용</p>
           <p>모달내용</p>
           <p>모달내용</p>
           </div>
           <div class="modal-foot">
           <button class="btn bc11">확인</button>
           <button class="btn bc1 modal-close">취소</button>
           </div>
       </div>
       </div>	
	
</body>
</html>