package sp.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.product.service.ProductService;
import sp.product.vo.Product;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet(name = "DeleteProduct", urlPatterns = { "/deleteProduct.do" })
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		ProductService service = new ProductService();
		Product p = service.deleteProduct(productNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(p != null) {
			//게시글 삭제에 성공하면 첨부파일 있는지 확인후 있으면 삭제
			if(p.getFilepath() != null) {
				String root = getServletContext().getRealPath("/");
				String deleteFile = root+"upload/product/"+p.getFilepath();
				File delFile = new File(deleteFile);
				delFile.delete();
				}
				if(p.getFilepath2() != null) {
					String root1 = getServletContext().getRealPath("/");
					String deleteFile1 = root1+"upload/product/"+p.getFilepath2();
					File delFile1 = new File(deleteFile1);
					delFile1.delete();
				}
				if(p.getFilepath3() != null) {
					String root2 = getServletContext().getRealPath("/");
					String deleteFile2 = root2+"upload/product/"+p.getFilepath3();
					File delFile2 = new File(deleteFile2);
					delFile2.delete();
				}

			request.setAttribute("title", "삭제성공");
			request.setAttribute("msg", "게시글이 삭제되었습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/productList.do?category=1&reqPage=1");
		}else {
			request.setAttribute("title", "삭제실패");
			request.setAttribute("msg", "관리자에게 문의하세요.");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/productView.do?productNo="+p.getProductNo());
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
