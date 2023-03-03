package sp.post.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.post.service.PostService;

/**
 * Servlet implementation class DropPostServlet
 */
@WebServlet(name = "DeletePost", urlPatterns = { "/deletePost.do" })
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		PostService service = new PostService();
		int result = service.deletePost(postNo);
		if(result == 0 ) {
			request.setAttribute("title", "메세지 삭제 실패");
			request.setAttribute("msg", "이미 삭제된 메세지 입니다");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("title", "메세지 삭제 성공");
			request.setAttribute("msg", "메세지를 삭제했습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/postListNotRead.do?reqPage=1&memberId=admin");
		}
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
