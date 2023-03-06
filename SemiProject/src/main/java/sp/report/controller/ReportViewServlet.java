package sp.report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.report.service.ReportService;
import sp.report.vo.Report;

/**
 * Servlet implementation class ReportViewServlet
 */
@WebServlet(name = "ReportView", urlPatterns = { "/reportView.do" })
public class ReportViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportViewServlet() {
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
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		//3. 비즈니스로직
		ReportService service = new ReportService();
		Report r = service.selectOneReport(reportNo);
		//4. 결과처리
		if(r==null) {
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
			request.setAttribute("title", "조회실패");
			request.setAttribute("msg", "게시글이 존재하지 않습니다.");
			request.setAttribute("icon", "info");
			request.setAttribute("loc", "/reportSelect.do");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/report/reportView.jsp");
			request.setAttribute("r", r);
			view.forward(request, response);
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
