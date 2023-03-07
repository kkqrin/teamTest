package sp.deal.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.deal.service.DealService;

/**
 * Servlet implementation class CompleteServlet
 */
@WebServlet(name = "Complete", urlPatterns = { "/complete.do" })
public class CompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		//3. 비즈니스로직
		DealService service = new DealService();
		int result = service.updateComplete(productNo, memberNo);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "거래 완료");
			request.setAttribute("msg", " 거래를 완료하셨습니다..");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "거래 실패");
			request.setAttribute("msg", "거래를 실패하셨습니다.");
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
