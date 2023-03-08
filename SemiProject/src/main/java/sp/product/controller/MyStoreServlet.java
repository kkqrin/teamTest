package sp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.product.service.ProductService;
import sp.product.vo.Product;

/**
 * Servlet implementation class MyStoreServlet
 */
@WebServlet(name = "myStore", urlPatterns = { "/myStore.do" })
public class MyStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyStoreServlet() {
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
		String sellerId = request.getParameter("sellerId");
		String loginId = request.getParameter("loginId");
		// 3. 비즈니스 로직
		ProductService service = new ProductService();
		ArrayList<Product> list = service.selectMyStore(sellerId);
		
		// 4. 결과 처리
		if(sellerId.equals(loginId)) {
			// 판매자 = 로그인아이디 같으면 내 상점
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/product/myStore.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);			
		}else {
			// 다르면 판매자 상점
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/product/sellerStore.jsp");
			request.setAttribute("list", list);
			request.setAttribute("sellerId", sellerId);
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
