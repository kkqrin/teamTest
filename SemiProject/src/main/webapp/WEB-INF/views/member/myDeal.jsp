<%@page import="sp.report.vo.Report"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mypage.css">
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
                        <li><a href="/selectMyDeal.do?memberNo=<%=m.getMemberNo()%>" class="mypage-active">구매 내역</a></li>
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
        <div class="mypage-content" style="width: 1200px;">
            <div class="mypage-deal-wrap">
                <div class="mypage-deal-content">
                    <div>
                        <div class="mypage-deal-title">내 구매 내역</div>
                        <table class="tbl">
                            <tr class="tr-1">
                                <th>사진</th>
                                <th>상품제목</th>
                                <th>판매자</th>
                                <th>거래상태</th>
                                <th>예약날짜</th>
                                <th>거래완료날짜</th>
                            </tr>
                        <%for(Report r : list) {%>
                            <tr>
                                <td style="width:200px"><img src="/upload/product/<%=r.getFilepath() %>" style="width:30%;"></td>
                                <td><%=r.getProductTitle() %></td>
                                <td><%=r.getSellerId() %></td>
                                <%if(r.getProductStatus() == 1) {%>
                                <td>예약중</td>
                                <%}else if(r.getProductStatus() == 2) {%>
                                <td>거래완료</td>
                                <%} %>
                                <td><%=r.getReserveDate() %></td>
                                <%if(r.getCompleteDate() == null) {%>
                                <td>-<td>
                                <%} else {%>
                                <td><%=r.getCompleteDate() %></td>
                                <%} %>
                            </tr>
                        <%} %>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>







 <script>
   $(".sub-title").on("click", function(){
       $(this).next().slideToggle();
   });
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>