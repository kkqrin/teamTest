<%@page import="sp.member.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/admin.jsp" %>
	<div class="member-grade title">
        <div class="grade-title"><h1>회원관리</h1></div>
        <table border="1" class="grad-table tbl">
            <tr>
                <th>선택</th>
                <th>회원번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>주소</th>
                <th>가입일</th>
                <th>회원등급</th>
                <th>등급변경</th>
            </tr>
            <%for (Member member : list){ %>
            <tr>
                <td><input type="checkbox"></td>
                <td><%=member.getMemberNo() %></td>
                <td><%=member.getMemberId() %></td>
                <td><%=member.getMemberName() %></td>
                <td><%=member.getMemberPhone() %></td>
                <td><%=member.getMemberAddr() %></td>
                <td><%=member.getEnrollDate() %></td>
                <td>
                    <select>
                        <option value="1">관리자</option>   
                        <option value="2">사기꾼</option>   
                        <option value="3">일반</option>   
                    </select>
                </td>
                <td>
                    <button>등급변경</button>
                </td>
            </tr>
            <%} %>
            <tr>
                <th colspan="9">
                    <button>회원등급변경</button>
                </th>
            </tr>
        </table>
    </div>   
</body>
</html>