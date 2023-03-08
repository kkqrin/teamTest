<%@page import="sp.deal.vo.Deal"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Deal> list = (ArrayList<Deal>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/admin.jsp" %>
	<div class="member-grade table-title">
        <div class="title"><h1>예약/거래완료 내역 조회</h1></div>
        <table class="grad-table tbl tbl-hover" style="width:90%;">
            <tr class="tr-1">
                <th>거래번호</th>
                <th>상품번호</th>
                <th>상품제목</th>
                <th>판매자</th>
                <th>상품금액</th>
                <th>구매자</th>
                <th>거래상태</th>
                <th>예약완료일</th>
                <th>거래완료일</th>
            </tr>
            <%for (Deal d : list){ %>
            <tr class="tr-0">
                <td><%=d.getDealNo() %></td>
                <td><%=d.getProductNo()%></td>
                <td><%=d.getProductTitle() %></td>
                <td><%=d.getSellerId() %></td>
                <td><%=d.getProductPrice() %></td>
                <td><%=d.getMemberId() %></td>
                
                <%if(d.getProductStatus()== 0) {%>
                <td>판매중</td>
                <%}else if(d.getProductStatus()== 1) {%>
                <td>예약중</td>   
                <%}else if(d.getProductStatus() == 2){ %>
                <td>거래완료</td>   										
                <%} %>
                
                <%if(d.getReserveDate()==null){ %>
                <td>-</td>
                <%}else{ %>
                <td><%=d.getReserveDate() %></td>
                <%} %>
                   <%if(d.getCompleteDate()==null){ %>
                <td>-</td>
                <%}else{ %>
                <td><%=d.getCompleteDate() %></td>
                <%} %>
            </tr>
            <%} %>
        </table>
    </div>   
</body>
</html>