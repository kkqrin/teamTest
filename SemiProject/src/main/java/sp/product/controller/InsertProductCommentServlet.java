package sp.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.product.service.ProductService;
import sp.product.vo.ProductComment;

/**
 * Servlet implementation class InsertProductCommentServlet
 */
@WebServlet(name = "InsertProductComment", urlPatterns = { "/insertProductComment.do" })
public class InsertProductCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. 값 추출
		ProductComment pc = new ProductComment();
		pc.setPdContent(request.getParameter("pdContent"));
		pc.setPdWriter(request.getParameter("pdWriter"));
		pc.setProductRef(Integer.parseInt(request.getParameter("productRef")));
		pc.setPdRef(Integer.parseInt(request.getParameter("pdRef")));
		
		// 3. 비즈니스 로직
		ProductService service = new ProductService();
		int result = service.insertProductComment(pc);
		
		// 4. 결과 처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "댓글 작성 완료");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "댓글 작성 실패");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/productView.do?productNo="+pc.getProductRef());
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
