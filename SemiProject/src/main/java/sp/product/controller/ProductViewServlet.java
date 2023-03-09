package sp.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.product.service.ProductService;
import sp.product.vo.Product;
import sp.product.vo.ProductViewData;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet(name = "ProductView", urlPatterns = { "/productView.do" })
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
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
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		// 3. 비즈니스 로직
		ProductService service = new ProductService();
		// 게시글, 댓글, 대댓글, 관심상품 테이블에 있는지 조회
		ProductViewData pvd = service.selectOneProduct(productNo);
		// 하트수 조회
		Product p = service.selectHeartCount(productNo);
		
		// 4. 결과 처리
		if(pvd == null) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("title", "조회 실패");
			request.setAttribute("msg", "게시글이 존재하지 않습니다.");
			request.setAttribute("icon", "info");
			request.setAttribute("loc", "productList.do?category=1&reqPage=1");
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/product/productView.jsp");
			request.setAttribute("p", pvd.getP());
			request.setAttribute("commentList", pvd.getCommentList());
			request.setAttribute("reCommentList", pvd.getReCommentList());
			request.setAttribute("wishList", pvd.getWishList());
			request.setAttribute("c", pvd.getC());
			request.setAttribute("Heart", p);
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
