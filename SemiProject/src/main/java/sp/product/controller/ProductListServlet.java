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
import sp.product.vo.Category;
import sp.product.vo.ProductPageData;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet(name = "ProductList", urlPatterns = { "/productList.do" })
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
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
		// 현재 요청한 카테고리 페이지
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		
		// 3. 비즈니스 로직
		ProductService service = new ProductService();
		// 게시글 목록 보기 + 페이징 처리
		ProductPageData ppd = service.selectProductList(categoryNo, reqPage);
		ArrayList<Category> cList = service.selectCategoryList();
		ArrayList<Category> cSubList = service.selectSubCategoryList();
		
		// 4. 결과 처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/product/productList.jsp");
		
		request.setAttribute("list", ppd.getList());
		request.setAttribute("pageNavi", ppd.getPageNavi());
		request.setAttribute("start", ppd.getStart());
		request.setAttribute("categoryNo", ppd.getCategoryNo());
		request.setAttribute("cList", cList);
		request.setAttribute("cSubList", cSubList);
		
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
