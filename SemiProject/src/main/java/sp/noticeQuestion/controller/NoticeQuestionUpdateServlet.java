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
 * Servlet implementation class NoticeQuestionUpdateServlet
 */
@WebServlet(name = "NoticeQuestionUpdate", urlPatterns = { "/noticeQuestionUpdate.do" })
public class NoticeQuestionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeQuestionUpdateServlet() {
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
		String faqTitle = request.getParameter("faqTitle");
		String faqContent = request.getParameter("faqContent");
		int faqCategory = Integer.parseInt(request.getParameter("faqCategory"));
		NoticeQuestion nq = new NoticeQuestion();
		nq.setFaqNo(faqNo);
		nq.setFaqTitle(faqTitle);
		nq.setFaqContent(faqContent);
		nq.setFaqCategory(faqCategory);
		
		//3. 비지니스로직
		NoticeQuestionService service = new NoticeQuestionService();
		int result = service.updateNoticeQuestion(nq);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "변경완료!!!");
			request.setAttribute("msg", "공지사항이 수정되었습니다.!!");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "변경실퐤!!!!");
			request.setAttribute("msg", "오류가 발생하였습니다!!");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/noticeQuestionView.do?faqNo="+nq.getFaqNo());
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
