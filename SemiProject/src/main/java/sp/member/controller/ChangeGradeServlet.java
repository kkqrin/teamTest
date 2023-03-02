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
 * Servlet implementation class ChangeGradeServlet
 */
@WebServlet(name = "ChangeGrade", urlPatterns = { "/changeGrade.do" })
public class ChangeGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeGradeServlet() {
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
		int memberGrade = Integer.parseInt(request.getParameter("memberGrade"));
		
		//3. 비즈니스로직
		MemberService service = new MemberService();
		int result = service.changeGrade(memberNo, memberGrade);
		//4. 결과처리
		RequestDispatcher view =request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "등급 변경 성공");
			request.setAttribute("msg", "등급 변경을 성공하였습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/adminPageGrade.do");
		}else {
			request.setAttribute("title", "등급 변경 실패");
			request.setAttribute("msg", "등급 변경 중 문제가 발생하였습니다.");
			request.setAttribute("icon", "warning");
			request.setAttribute("loc", "/adminPageGrade.do");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
