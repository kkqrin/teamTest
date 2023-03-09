package sp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.member.service.MemberService;

/**
 * Servlet implementation class UpdateMemberTempServlet
 */
@WebServlet(name = "UpdateMemberTemp", urlPatterns = { "/updateMemberTemp.do" })
public class UpdateMemberTempServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberTempServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		// 온도변경 (라디오 vlaue 0,1,2,3 / memberTemp랑 상관없음) 
		int memberTemp = Integer.parseInt(request.getParameter("memberTemp"));
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int hiddenMemberNo = Integer.parseInt(request.getParameter("hiddenMemberNo"));
		//3. 비즈니스로직
		MemberService service = new MemberService();
		int result = service.updateMemberTemp(memberNo, memberTemp);
		//4. 결과처리
		if(result>0) {
			// 구매확정 서블릿 이동
			response.sendRedirect("/complete.do?productNo="+productNo+"&memberNo="+hiddenMemberNo);		
		}else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
