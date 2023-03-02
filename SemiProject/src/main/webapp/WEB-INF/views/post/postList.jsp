<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.naviHide{
	display: none;
	}
</style>
</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="content-tab">
            <div class="letterBox">쪽지함</div>
            <div class="letterBox">받은 쪽지함</div>
            <div class="letterBox">보낸 쪽지함</div>
            <div class="letterBox">전체 보관함</div>
        </div>
        <div class="content-main">
            <div class="main-title"><span>알림</span>안읽은쪽지[ <span>0</span> ]통 | 전체 쪽지 [ <span>10</span> ] 통</div>
            <div class="message">
                <table>
                    <tr>
                        <th rowspan="2" class="th-btn"><input type="checkbox" name="check"></th>
                        <th rowspan="2" class="th-img">사진</th>
                        <td colspan="2">받은쪽지함</td>
                        <td>안읽음</td>
                    </tr>
                    <tr id="tr-bottom">
                        <td>발신자</td>
                        <td>아 언제하냐 힘들다</td>
                        <td>2023-02-27</td>
                    </tr>

                    <tr>
                        <th rowspan="2" class="th-btn"><input type="checkbox" name="check"></th>
                        <th rowspan="2" class="th-img">사진</th>
                        <td colspan="2">작성하신 게시글이 이동되었습니다</td>
                        <td>안읽음</td>
                    </tr>
                    <tr class="tr">
                        <td>발신자</td>
                        <td>아 언제하냐 힘들다</td>
                        <td>2023-02-27</td>
                    </tr>
                    <tr>
                        <th rowspan="2" class="th-btn"><input type="checkbox" name="check"></th>
                        <th rowspan="2" class="th-img">사진</th>
                        <td colspan="2">작성하신 게시글이 이동되었습니다</td>
                        <td>안읽음</td>
                    </tr>
                    <tr class="tr">
                        <td>발신자</td>
                        <td>아 언제하냐 힘들다</td>
                        <td>2023-02-27</td>
                    </tr>
                </table>
            </div>
	</div>
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
	
</body>
</html>