package sp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.member.service.MemberService;
import sp.member.vo.Member;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet(name = "CheckId", urlPatterns = { "/checkId.do" })
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId=request.getParameter("checkId");
		MemberService service = new MemberService();
		Member m = service.selectOneMember(memberId);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/checkId.jsp");
		request.setAttribute("memberId", memberId);
		if(m==null) {//아이디가 사용가능할 경우
			request.setAttribute("result", 0);
		}else {//이이디가 사용 즁복일 경우
			request.setAttribute("result", 1);
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
