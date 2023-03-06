package sp.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.board.service.BoardService;
import sp.board.vo.Board;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet(name = "BoardDelete", urlPatterns = { "/boardDelete.do" })
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
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
		Board b = service.boardDelete(boardNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(b != null) {
			//게시글 삭제에 성공하면 첨부파일 있는지 확인후 있으면 삭제
			if(b.getFilePath() != null) {
				String root = getServletContext().getRealPath("/");
				String deleteFile = root+"upload/board/"+b.getFilePath();
				File delFile = new File(deleteFile);
				delFile.delete();
			}
			request.setAttribute("title", "삭제성공");
			request.setAttribute("msg", "게시글이 삭제되었습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/boardList.do?reqPage=1&npp=10");
		}else {
			request.setAttribute("title", "삭제실패");
			request.setAttribute("msg", "관리자에게 문의하세요.");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/boardView.do?boardNo="+boardNo);
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
