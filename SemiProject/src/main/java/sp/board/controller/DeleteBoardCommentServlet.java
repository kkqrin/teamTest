package sp.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.board.service.BoardService;

/**
 * Servlet implementation class DeleteBoardCommentServlet
 */
@WebServlet(name = "DeleteBoardComment", urlPatterns = { "/deleteBoardComment.do" })
public class DeleteBoardCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoardCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int bcNo = Integer.parseInt(request.getParameter("bcNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		BoardService service = new BoardService();
		int result = service.deleteBoardComment(bcNo);
		if(result == 0) {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "삭제를 실패했습니다.");
			request.setAttribute("icon", "error");
		}else {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "삭제를 성공했습니다.");
			request.setAttribute("icon", "success");
		}
		request.setAttribute("loc", "/boardView.do?boardNo="+boardNo);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
