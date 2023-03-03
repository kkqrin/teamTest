<%@page import="sp.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% Member m = (Member)request.getAttribute("m"); %>
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
	    <div class="report-list tabletitle">
        <div class="report-title"><h1>신고접수 리스트</h1></div>
        <table border="1" class="report-table table">
            <tr>
                <th>신고번호</th>
                <th>신고자</th>
                <th>신고유형</th>
                <th>상태</th>
            </tr>
            <tr>
                <td>ㄴㅁㅇ</td>
                <td></td>
                <td></td>
                <td>
                    <select>
                        <option value="0">확인중</option>
                        <option value="1">사기확인</option>
                        <option value="2">무죄</option>
                    </select>
                </td>
            </tr>
        </table>
    </div>  
</body>
</html>