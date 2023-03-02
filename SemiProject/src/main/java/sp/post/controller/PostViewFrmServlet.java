package sp.post.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.post.service.PostService;
import sp.post.vo.Post;

/**
 * Servlet implementation class PostViewFrmServlet
 */
@WebServlet(name = "PostViewFrm", urlPatterns = { "/postViewFrm.do" })
public class PostViewFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostViewFrmServlet() {
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
		Post p = service.selectOnePost(postNo);
		if(p == null) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "삭제된 게시물 입니다.");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/postList.do?reqPage=1&memberId=admin");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("p", p);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/post/postViewFrm.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
