package sp.report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.report.service.ReportService;

/**
 * Servlet implementation class ChangePactCheckServlet
 */
@WebServlet(name = "ChangePactCheck", urlPatterns = { "/changePactCheck.do" })
public class ChangePactCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePactCheckServlet() {
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
		int pactCheck = Integer.parseInt(request.getParameter("pactCheck"));
		//3. 비즈니스로직
		ReportService service = new ReportService();
		int result = service.changePactCheck(memberNo,pactCheck);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "정보 변경 성공");
			request.setAttribute("msg", "정보 변경을 성공하였습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "정보 변경 실패");
			request.setAttribute("msg", "정보 변경을 실페하였습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/reportSelect.do");
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
