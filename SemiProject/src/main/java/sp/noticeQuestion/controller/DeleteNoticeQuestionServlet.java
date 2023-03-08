package sp.noticeQuestion.controller;

import java.io.File;
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
 * Servlet implementation class DeleteNoticeQuestionServlet
 */
@WebServlet(name = "DeleteNoticeQuestion", urlPatterns = { "/deleteNoticeQuestion.do" })
public class DeleteNoticeQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNoticeQuestionServlet() {
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
		NoticeQuestion n = service.deleteNoticeQuestion(faqNo);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(n != null) {
			request.setAttribute("title", "삭제성공!!!");
			request.setAttribute("msg", "게시글이 삭제되었습니다!!");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/noticeQuestionList.do?reqPage=1");
		}else {
			request.setAttribute("title", "삭제실퐤!!!!");
			request.setAttribute("msg", "오류가 발생하였습니다!!");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/noticeQuestionView.do?noticeNo="+faqNo);
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
