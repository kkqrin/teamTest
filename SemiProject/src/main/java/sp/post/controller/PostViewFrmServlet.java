package sp.post.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		int index = Integer.parseInt(request.getParameter("index"));
		PostService service = new PostService();
		int result = 0;
		if(index != 2) {
		result = service.updatePostCount(postNo);
		}else {
		result = index;
		}
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
