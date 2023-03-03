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
		// 입력받은 아이디 패스워드 정보가 일치하는 회원정보를 조회
		Member member = service.selectOneMember(m);//member는 결과를 받아오는 역할을 하는 변수
		// 4.결과처리(결과를 화면으로 구현)
				//아래에서는 alert창을 띄워준 후 다시 로그인 비밀번호 화면으로 되돌아오게 구현할 것임
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				//로그인에 성공/실패 했다는 메세지를 조건을 걸어 msg.jsp에 넘겨줌 
				if (member == null) {
					// 아이디와 비번 틀린경우
					request.setAttribute("title", "로그인 실패");
					request.setAttribute("msg", "아이디 또는 비밀번호 확인해주세요");
					request.setAttribute("icon", "error");
					request.setAttribute("loc", "/");//로그인에 실패했다면 메인페이지로 이동하게 해줌
				} else {
					// 아이디 비밀번호가 일치하는경우
					if (member.getMemberGrade() == 4) {
						// 준회원인 경우
						request.setAttribute("title", "사기회원");
						request.setAttribute("msg", "로그인 할 수 없습니다");
						request.setAttribute("icon", "warning");
						request.setAttribute("loc", "/");//로그인에 실패했다면 메인페이지로 이동하게 해줌
					} else {
					
						HttpSession session = request.getSession();//세션을 불러옴
						session.setAttribute("m", member);//세션을 등록함 member로 정보결과를 받았으니까 member로 받음
						
						request.setAttribute("title", "로그인 성공");
						request.setAttribute("msg", "환영합니다");
						request.setAttribute("icon", "success");
						request.setAttribute("loc", "/");//로그인에 성공했다면 메인페이지로 이동하게 해줌
					}
				}

				// 페이지가 넘어가도록 함
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
