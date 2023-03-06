package sp.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.board.service.BoardService;
import sp.board.vo.BoardComment;

/**
 * Servlet implementation class InsertBoardCommentServlet
 */
@WebServlet(name = "InsertBoardComment", urlPatterns = { "/insertBoardComment.do" })
public class InsertBoardCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardComment bc = new BoardComment();
		bc.setBcContent(request.getParameter("bcContent"));
		bc.setBcWriter(request.getParameter("bcWriter"));
		bc.setBoardRef(Integer.parseInt(request.getParameter("boardRef")));
		bc.setBcRef(Integer.parseInt(request.getParameter("bcRef")));
		BoardService service = new BoardService();
		int result = service.insertboardComment(bc);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result==0) {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "댓글 작성 실패");
			request.setAttribute("icon", "error");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "댓글 작성 실패");
			request.setAttribute("icon", "error");
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "댓글 작성 완료");
			request.setAttribute("icon", "success");
		}
		request.setAttribute("loc", "/boardView.do?boardNo="+bc.getBoardRef());
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
