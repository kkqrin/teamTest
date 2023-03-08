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
 * Servlet implementation class JoinServlet
 */
@WebServlet(name = "Join", urlPatterns = { "/join.do" })
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberPw(request.getParameter("memberPw"));
		m.setMemberName(request.getParameter("memberName"));
		m.setMemberPhone(request.getParameter("memberPhone"));
		m.setMemberEmail(request.getParameter("email"));
		//m.setMemberGrade(Integer.getInteger(request.getParameter("memberGrade")));
		m.setPostNumber(request.getParameter("postcode"));
		m.setMemberAddr(request.getParameter("address"));
		m.setMemberAddr2(request.getParameter("detailAddress"));
		
		MemberService service = new MemberService();
		int result = service.insertMember(m);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			
				request.setAttribute("title", "회원가입 성공");
				request.setAttribute("msg", "사랑합니다 고객님 중고사자 입니다.");
				request.setAttribute("icon", "success");
				request.setAttribute("loc", "/");
			}else {
				request.setAttribute("title", "회원가입 실패");
				request.setAttribute("msg", "아이디 또는 비밀번호를 다시 입력하세요");
				request.setAttribute("icon", "error");
				request.setAttribute("loc", "/");
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
