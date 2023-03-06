package sp.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.board.service.BoardService;
import sp.board.vo.Board;
import sp.board.vo.BoardViewData;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet(name = "BoardView", urlPatterns = { "/boardView.do" })
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		BoardService service = new BoardService();
		BoardViewData bvd = service.selectOneBoard(boardNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/board/boardView.jsp");
		request.setAttribute("b", bvd.getB());
		request.setAttribute("commentList", bvd.getCommentList());
		request.setAttribute("reCommentList", bvd.getReCommentList());
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
