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
                <td><input type="checkbox" class="chk"></td>
                <td><%=member.getMemberNo() %></td>
                <td><%=member.getMemberId() %></td>
                <td><%=member.getMemberName() %></td>
                <td><%=member.getMemberPhone() %></td>
                <td><%=member.getMemberAddr() %></td>
                <td><%=member.getEnrollDate() %></td>
                <td>
                	<%if(member.getMemberGrade() ==1) {%>
                    <select>
                        <option value="1" selected>관리자</option>   
                        <option value="2">이메일 인증 회원</option>   
                        <option value="3">이메일 미인증 회원</option>   
                        <option value="4">사기회원</option> 
                    </select>
                    <%}else if(member.getMemberGrade() == 2){ %>
                    <select>
                        <option value="1">관리자</option>   
                        <option value="2" selected>이메일 인증 회원</option>   
                        <option value="3">이메일 미인증 회원</option>   
                        <option value="4">사기회원</option> 
                    </select>
                    <%}else if(member.getMemberGrade() == 3){%>
                    <select>
                        <option value="1">관리자</option>   
                        <option value="2">이메일 인증 회원</option>   
                        <option value="3" selected>이메일 미인증 회원</option>   
                        <option value="4">사기회원</option> 
                    </select>
                    <%}else if(member.getMemberGrade() == 4){ %>
                    <select>
                        <option value="1">관리자</option>   
                        <option value="2">이메일 인증 회원</option>   
                        <option value="3">이메일 미인증 회원</option>   
                        <option value="4" selected>사기회원</option> 
                    </select>
                    <%} %>
                    
                </td>
                <td>
                    <button class="changeGrade">등급변경</button>
                </td>
            </tr>
            <%} %>
            <tr>
                <th colspan="9">
                    <button class="checkedChangeGrade">회원등급변경</button>
                </th>
            </tr>
        </table>
    </div>   
        <script>
        //등급변경
    	$(".changeGrade").on("click", function(){
    		// 등급에 필요한 정보(회원번호, 등급)
    		const memberNo = $(this).parent().parent().children().eq(1).text();
    		const memberGrade = $(this).parent().prev().children().val();
    		location.href="/changeGrade.do?memberNo="+memberNo+"&memberGrade="+memberGrade;
    	});
        $(".checkedChangeGrade").on("click",function(){
        	const check = $(".chk:checked");
        	if(check.length == 0){
        		alert("선택된 회원이 없습니다.");
        		return;
        	}
        	const no = new Array();
        	const grade = new Array();
        	check.each(function(index,item){
        		const memberNo = $(item).parent().next().text();
        		no.push(memberNo);
        		const memberGrade = $(item).parent().parent().find("select").val();
        		grade.push(memberGrade);
        	});
        	location.href="/checkedChangeGrade.do?no="+no.join("/")+"&grade="+grade.join("/");
        });
    </script>
</body>
</html>