package sp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sp.member.service.MemberService;
import sp.member.vo.Member;
import sp.post.service.PostService;
import sp.post.vo.PostPageData;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login.do" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPw(memberPw);
		MemberService service = new MemberService();
		
		Member member = service.selectOneMember(m);
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				if (member == null) {
					request.setAttribute("title", "로그인 실패");
					request.setAttribute("msg", "아이디 또는 비밀번호 확인해주세요");
					request.setAttribute("icon", "error");
					request.setAttribute("loc", "/");
				} else {
					if (member.getMemberGrade() == 4) {
						request.setAttribute("title", "사기회원");
						request.setAttribute("msg", "사기꾼은 로그인 할 수 없습니다");
						request.setAttribute("icon", "warning");
						request.setAttribute("loc", "/");
					} else {
						HttpSession session = request.getSession();
						session.setAttribute("m", member);
						PostService pservice = new PostService();
						request.setAttribute("title", "로그인 성공");
						request.setAttribute("msg", "환영합니다");
						request.setAttribute("icon", "success");
						request.setAttribute("loc", "/");
					}
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
