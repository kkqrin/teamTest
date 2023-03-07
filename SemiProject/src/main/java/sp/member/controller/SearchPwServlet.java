package sp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.member.service.MemberService;
import sp.member.vo.Member;

/**
 * Servlet implementation class SearchPwServlet
 */
@WebServlet(name = "SearchPw", urlPatterns = { "/searchPw.do" })
public class SearchPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		//2.값추출
		String memberId2= request.getParameter("memberId2");
		//3.비즈니스로직
		MemberService service = new MemberService();
		Member m = service.selectOneMember(memberId2);
		
		PrintWriter out = response.getWriter();
		if (m == null) {
			out.print(0);
		}else {
			out.print(m.getMemberPw());
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
