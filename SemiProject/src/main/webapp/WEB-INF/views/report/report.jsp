<%@page import="java.util.ArrayList"%>
<%@page import="sp.report.vo.Report"%>
<%@page import="sp.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Member m = (Member)request.getAttribute("m");
    Report r = (Report)request.getAttribute("r");	
    ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="css/report.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body>
	<%@include file="/WEB-INF/views/common/admin.jsp" %>
	    <div class="report-list table-title">
        <div class="report-title"><h1>신고접수 리스트</h1></div>
        <table class="report-table tbl tbl-hover" style="width:90%;">
            <tr class="tr-2" >
                <th>신고번호</th>
                <th>신고자</th>
                <th>신고유형</th>
                <th>사기꾼NO</th>
                <th>사기꾼ID</th>
                <th>상태</th>
                <th>정보변경</th>
            </tr>
            <%for(Report report : list){ %>
            <tr>
            	
                <td><%=report.getReportNo() %></td>
                <td><%=report.getReportMember() %></td>
                <%if(report.getReportType() ==0) {%>
                <td>입금</td>
                <%}else if(report.getReportType() ==1){ %>
                <td>배송</td>
                <%} %>
                <td><%=report.getMemberNo() %></td>
                <td><%=report.getMemberId() %></td>
                <td>
                <%if(report.getPactCheck() == 0) {%>
                    <select class="btn bc0 bs1">
                        <option value="0" selected>확인중</option>
                        <option value="1">사기확인</option>
                        <option value="2">무죄</option>
                    </select>
                    <%}else if(report.getPactCheck() == 1) {%>
                     <select class="btn bc0 bs1">
                        <option value="0">확인중</option>
                        <option value="1" selected>사기확인</option>
                        <option value="2">무죄</option>
                    </select>
                    <%}else if(report.getPactCheck() == 2){ %>
                     <select class="btn bc0 bs1">
                        <option value="0">확인중</option>
                        <option value="1">사기확인</option>
                        <option value="2" selected>무죄</option>
                    </select>
                    <%} %>
                </td>
                <td>
                    <button class="changePactCheck btn bc11 bs1">정보변경</button>
                </td>
            </tr>
            <%} %>
        </table>
    </div>  
    <script>
     	$(".changePactCheck").on("click", function(){
     	//  memberNo , pact번호 정보 추출     		
    		const memberNo = $(this).parent().parent().children().eq(3).text();
    		const pactCheck = $(this).parent().prev().children().val();
    		location.href="/changePactCheck.do?memberNo="+memberNo+"&pactCheck="+pactCheck;
    	});
    </script>
</body>
</html>