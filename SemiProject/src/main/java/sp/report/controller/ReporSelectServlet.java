package sp.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sp.member.vo.Member;
import sp.report.service.ReportService;
import sp.report.vo.Report;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet(name = "ReportSelect", urlPatterns = { "/reportSelect.do" })
public class ReporSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReporSelectServlet() {
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
//		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
//		세선에서 memberNo 데이터 추출
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("m");
		int memberNo  = m.getMemberNo();
		//3. 비즈니스로직
//		MemberService service = new MemberService();
//		Member m = service.selectMemberNo(memberNo);
		
		ReportService service = new ReportService();
//		Report r = service.selectAllReport(memberNo);
		ArrayList<Report> list = service.selectAllReport(memberNo);
		//4. 결과처리
//		if (m != null & m.getMemberGrade() == 1) {
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/report/report.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
//			request.setAttribute("r", r);
//			view.forward(request, response);
//			request.setAttribute("m", m);
//			view.forward(request, response);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
