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
import sp.post.service.PostService;

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
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		Member m = new Member();
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberPw(request.getParameter("memberPw"));
		m.setMemberName(request.getParameter("memberName"));
		m.setMemberPhone(request.getParameter("memberPhone"));
		m.setMemberEmail(request.getParameter("email"));
		m.setPostNumber(request.getParameter("postcode"));
		m.setMemberAddr(request.getParameter("address"));
		m.setMemberAddr2(request.getParameter("detailAddress"));
		//3.비즈니스로직
		MemberService service = new MemberService();
		int result = service.insertMember(m);
		//4.결과처리
		//->성공실패에 따라서 alert 띄우고 메인페이지로 이동
		//RequestDispatcher는 클라이언트로부터 최초에 들어온 요청을 
		//JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는(보내는) 역할을 수행하거나,
		//특정 자원에 처리를 요청하고 처리 결과를 얻어오는 기능을 수행하는 클래스
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
				request.setAttribute("title", "회원가입 성공");
				request.setAttribute("msg", "사랑합니다 고객님 중고사자 입니다.");
				request.setAttribute("icon", "success");
				request.setAttribute("loc", "/");//성공시 메인페이지로 넘어감
				PostService pservice = new PostService();
				/* int joinPost = pservice.joinPost(m); */
			}else {
				request.setAttribute("title", "회원가입 실패");
				request.setAttribute("msg", "아이디 또는 비밀번호를 다시 입력하세요");
				request.setAttribute("icon", "error");
				request.setAttribute("loc", "/");//실패시 메인페이지로 넘어감
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
