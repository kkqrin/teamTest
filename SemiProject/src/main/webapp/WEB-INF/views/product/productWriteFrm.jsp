<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중 고 사 자</title>
<style>
    .img-box>td{
        width: calc(100%/6);
        height: 200px;
        border: 1px solid black;
    }
    select{
        width: 400px;
    }
    #priceInput{
        width: 700px;
        display: inline-block;
    }
    .price>td>span{
        width: 30px;
        padding: 10px;
        font-family: nn-b;
        color: #4b4b4b;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- 텍스트 에디터, 한글지원 -->
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	
		<div class="page-content">
		<div class="page-title">판매상품 등록하기</div>
		<form action="/productWrite.do" method="post" enctype="multipart/form-data">
		<!-- 세션의 작성자도 submit -->
		<input type="hidden" name="productWriter" value="<%=m.getMemberId()%>">
		<input type="hidden" name="memberAddr" value="<%=m.getMemberAddr()%>">
		<input type="text" name="productPrice">
		<input type="file" name="upfile">
			<table class="tbl" id="productWrite">
				<!-- 한 행에 6칸 -->
                <tr class="tr-1 img-box">
                    <td colspan="2"><img src="#"></td>
                    <td colspan="2"><img src="#"></td>
                    <td colspan="2"><img src="#"></td>
                </tr>
				<tr class="tr-0">
					<td colspan="6"><button type="button" class="btn bc2 bs1">사진등록</button></td>
				</tr>
				<tr class="tr-1">
					<td colspan="6">
						<input type="text" name="productTitle" class="input-form" placeholder="제목">
					</td>
				</tr>
				<tr class="tr-1">
					<td colspan="2">
						<select class="input-form first-category">
						<option value="0" selected>카테고리</option>
						<option value="1">수입명품</option>	
						<option value="2">패션의류</option>
						<option value="3">패션잡화</option>
						<option value="4">뷰티</option>
						<option value="5">출산/유아동</option>
						<option value="6">모바일/태블릿</option>
						<option value="7">가전제품</option>
						<option value="8">노트북/PC</option>
						<option value="9">카메라/캠코더</option>
						<option value="10">가구/인테리어</option>
						<option value="11">리빙/생활</option>
						<option value="12">게임</option>
						<option value="13">반려동물/취미</option>
						<option value="14">도서/음반/문구</option>
						<option value="15">티켓/쿠폰</option>
						<option value="16">스포츠</option>
						<option value="17">레저/여행</option>
						<option value="18">공구/산업용품</option>
					</select>
					</td>
					<td colspan="4">
						<select class="input-form sub-category" name="categoryNo">
						<option value="0" selected>하위 카테고리</option>	
						</select>
					</td>
				</tr>
				<tr class="tr-1 price">
					<td colspan="6"><span>\ </span><input id="priceInput" type="text" class="input-form" placeholder="가격"><span> 원</span></td>
				</tr>
				<tr class="tr-1">
					<td colspan="6" style="text-align:left;">
						<textarea id="productContent" name="productContent" class="input-form"></textarea>
					</td>
				</tr>
				<tr class="tr-0">
					<td colspan="6">
						<button type="submit" class="btn bc2 bs4">상품등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
	
	<script>
	
	
	
	
		$("#productContent").summernote({
			height : 400,
			lang : "ko-KR",
			// 이미지 업로드시 ajax 처리 -> 글 올려서 새로고침 하면 사라짐
			callbacks : {
				onImageUpload : function(files){
					uploadImage(files[0], this);
				}
			}
		});
		
		function uploadImage(file, editor){
			// ajax를 통해 서버에 이미지를 업로드
			// 업로드된 이미지의 경로를 받아오는 역할
			// 받아온 이후 -> editor에 이미지 경로를 전달해서 화면에 표현
			
			// <form> 태그의 역할
			const form = new FormData();
			form.append("file", file);
			/*
			<form>
				<input type="file" name="file">
			</form>
			*/
			
			$.ajax({
				url : "/uploadImage.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					// DB에 insert
					$(editor).summernote("insertImage", data);
				}
			});
			/*
			processData : 전송하는 데이터를 기본적으로 문자열로 전송하게 세팅 (default)
			 -> 파일 전송을 위해서 기본값인 문자열 전송을 제거(false)
			contentType : enctype="application/x-www-form-urlencoded;charset=UTF-8" (default)
			 -> 파일 전송을 위해서 enctype 기본값을 제거 (false)
			*/
		}
		
		// 하위 카테고리 선택 ajax
		$(".first-category").on("change", function(){
			const subCategory = $(".sub-category");
			subCategory.empty();
			const optionVal = $(this).val();
			
			$.ajax({
				url : "/subCategorySelected.do",
				type : "post",
				data : {categoryRef : optionVal},
				dataType : "json",
				success : function(data){

					if(optionVal == 0){
						const option0Selected = $("<option value='0' selected>하위카테고리</option>");
						subCategory.append(option0Selected);
					}else{
						const option0Selected = $("<option value='none' selected>선택해주세요</option>");
						subCategory.append(option0Selected);
					}
					
					for(let i=0;i<data.length;i++){
						const option = $("<option></option>");
						option.val(data[i].categoryNo);
						option.text(data[i].categoryName);
						
						subCategory.append(option);
					}
					console.log("optionVal : "+optionVal);
				}
			})
		});
		
		
		// 화폐 단위 설정 ////////////////////////////////////////////////이상함!!!!!!!!!!!!!!!!!
		$("#priceInput").on("focus", function(){
			$(this).val("");
		});
		$("#priceInput").on("change", function(){
			let priceInputVal = $(this).val();
			
			// 화폐 단위 표시전 정수형은 따로 input에 담아서 submit
			$("[name=productPrice]").val(priceInputVal);
			
			// 12,345원
			// 1,234,567원
			const bakman = Math.floor(priceInputVal / 1000000); // 1
			priceInputVal = priceInputVal - bakman*1000000; 
			const chun = Math.floor(priceInputVal / 1000); // 234
			const ilsipbak = priceInputVal % 1000; // 567
			
			if(bakman == 0){
				$(this).val(chun+","+ilsipbak);				
			}else{
				$(this).val(bakman+","+chun+","+ilsipbak);				
			}
			

		});
		
		///////////////// 하위카테고리 첫번째거는 val 못가져옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		// 콘솔용
		$(".sub-category").on("change", function(){
			console.log($(".sub-category").val());
		});
		
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>