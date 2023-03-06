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

/**
 * Servlet implementation class UpdateInfoServlet
 */
@WebServlet(name = "UpdateInfo", urlPatterns = { "/updateInfo.do" })
public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member member = new Member();
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberPw(request.getParameter("memberPw"));
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberPhone(request.getParameter("memberPhone"));
		member.setMemberEmail(request.getParameter("email"));
		member.setPostNumber(request.getParameter("postcode"));
		member.setMemberAddr(request.getParameter("address"));
		member.setMemberAddr2(request.getParameter("detailAddress"));
		
		MemberService service = new MemberService();
		int result = service.updateInfo(member);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			HttpSession session = request.getSession();
			
			Member m = (Member)session.getAttribute("m");
			m.setMemberPw(m.getMemberPw());
			m.setMemberName(m.getMemberName());
			m.setMemberPhone(m.getMemberPhone());
			m.setMemberEmail(m.getMemberEmail());
			m.setPostNumber(m.getPostNumber());
			m.setMemberAddr(m.getMemberAddr());
			m.setMemberAddr2(m.getMemberAddr2());

			request.setAttribute("title", "수정완료");
			request.setAttribute("msg", "정보 수정이 완료되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "수정 실패");
			request.setAttribute("msg", "다시 시도해주세요 화이팅~!.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/myPage.do");
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
