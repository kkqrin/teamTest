package sp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.ViewFactory;

import sp.member.service.MemberService;
import sp.member.vo.Member;

/**
 * Servlet implementation class AdminPageMemberServlet
 */
@WebServlet(name = "AdminPageGrade", urlPatterns = { "/adminPageGrade.do" })
public class AdminPageGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPageGradeServlet() {
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
//		HttpSession session = request.getSession(false);
//		Member m = (Member) session.getAttribute("m");
		//3. 비즈니스로직
		MemberService service = new MemberService();
		ArrayList<Member> list = service.selectAllMember();
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminPageGrade.jsp");
		request.setAttribute("list", list);
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
