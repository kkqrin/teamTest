package sp.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import sp.product.service.ProductService;
import sp.product.vo.Product;

/**
 * Servlet implementation class ProductWriteServlet
 */
@WebServlet(name = "ProductWrite", urlPatterns = { "/productWrite.do" })
public class ProductWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductWriteServlet() {
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
		// 2-1. 업로드 경로 지정
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/product";
		// 2-2. 파일 업로드 최대 용량 설정
		int maxSize = 10 * 1024 * 1024;
		// 2-3. 객체 변환
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		int categoryNo = Integer.parseInt(mRequest.getParameter("categoryNo"));
		String sellerId = mRequest.getParameter("productWriter");
		String productTitle = mRequest.getParameter("productTitle");
		int productPrice = Integer.parseInt(mRequest.getParameter("productPrice"));
		String productContent = mRequest.getParameter("productContent");
		String memberAddr = mRequest.getParameter("memberAddr");
		String filename = mRequest.getOriginalFileName("upfile1");
		String filepath = mRequest.getFilesystemName("upfile1");
		String filename2 = mRequest.getOriginalFileName("upfile2");
		String filepath2 = mRequest.getFilesystemName("upfile2");
		String filename3 = mRequest.getOriginalFileName("upfile3");
		String filepath3 = mRequest.getFilesystemName("upfile3");
		
		Product p = new Product();
		p.setCategoryNo(categoryNo);
		p.setSellerId(sellerId);
		p.setProductTitle(productTitle);
		p.setProductPrice(productPrice);
		p.setProductContent(productContent);
		// 거래지역은 판매자의 주소
		p.setProductArea(memberAddr);
		p.setFilename(filename);
		p.setFilepath(filepath);
		p.setFilename2(filename2);
		p.setFilepath2(filepath2);
		p.setFilename3(filename3);
		p.setFilepath3(filepath3);
		
		// 3. 비즈니스 로직
		ProductService service = new ProductService();
		int result = service.insertProduct(p);
		
		// 4. 결과 처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "게시글 작성 성공");
			request.setAttribute("msg", "게시글이 작성되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "게시글 작성 실패");
			request.setAttribute("msg", "오류가 발생했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
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
