package sp.noticeQuestion.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.noticeQuestion.service.NoticeQuestionService;
import sp.noticeQuestion.vo.NoticeQuestion;

/**
 * Servlet implementation class NoticeQuestionUpdateFrmServlet
 */
@WebServlet(name = "NoticeQuestionUpdateFrm", urlPatterns = { "/noticeQuestionUpdateFrm.do" })
public class NoticeQuestionUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeQuestionUpdateFrmServlet() {
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
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		//3. 비지니스로직
		NoticeQuestionService service = new NoticeQuestionService();
		NoticeQuestion nq = service.getNoticeQuestion(faqNo);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/noticeQuestion/noticeQuestionUpdateFrm.jsp");
		request.setAttribute("nq", nq);
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
