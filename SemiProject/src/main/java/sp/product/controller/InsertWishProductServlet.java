package sp.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.product.service.ProductService;

/**
 * Servlet implementation class InsertWishProductServlet
 */
@WebServlet(name = "InsertWishProduct", urlPatterns = { "/insertWishProduct.do" })
public class InsertWishProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWishProductServlet() {
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
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		// 3. 비즈니스 로직
		ProductService service = new ProductService();
		int result = service.insertWishProduct(memberNo, productNo);
		
		// 4. 결과 처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "관심상품 등록 완료");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "관심상품 등록 실패");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/productView.do?productNo="+productNo);
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
