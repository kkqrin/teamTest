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
 * Servlet implementation class PostSendServlet
 */
@WebServlet(name = "PostSend", urlPatterns = { "/postSend.do" })
public class PostSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reseiver = request.getParameter("postReseiver");
		String postTitle = request.getParameter("post-title");
		String postContent = request.getParameter("post-content");
		
		PostService service = new PostService();
		int result = service.insertPost(reseiver,postTitle,postContent);
		if(result == 0 ) {
			request.setAttribute("title", "메세지 전송 실패");
			request.setAttribute("msg", "관리자에게 문의하세요");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("title", "메세지 전송 성공");
			request.setAttribute("msg", "메세지 전송에 성공했습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/postListNotRead.do?reqPage=1&memberId=admin");
		}
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
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
