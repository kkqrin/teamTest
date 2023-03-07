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
 * Servlet implementation class NoticeQuestionWriteServlet
 */
@WebServlet(name = "NoticeQuestionWrite", urlPatterns = { "/noticeQuestionWrite.do" })
public class NoticeQuestionWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeQuestionWriteServlet() {
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
		String noticeQuestionTitle = request.getParameter("noticeQuestionTitle");
		int memberNo = Integer.parseInt(request.getParameter("noticeQuestionWriter"));
		int noticeQuestionCategory = Integer.parseInt(request.getParameter("noticeQuestionCategory"));
		String noticeQuestionContent = request.getParameter("noticeQuestionContent");
		
		NoticeQuestion nq = new NoticeQuestion();
		nq.setFaqTitle(noticeQuestionTitle);
		nq.setMemberNo(memberNo);
		nq.setFaqCategory(noticeQuestionCategory);
		nq.setFaqContent(noticeQuestionContent);
		//3. 비지니스로직
		NoticeQuestionService service = new NoticeQuestionService();
		int result = service.insertNoticeQuestion(nq);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "자주묻는질문 작성 성공!!");
			request.setAttribute("msg", "자주묻는질문 작성되었습니다.!!");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "자주묻는질문 작성 실패!!");
			request.setAttribute("msg", "오류가 발생하였습니다.!!");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/noticeQuestionList.do?reqPage=1");
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
