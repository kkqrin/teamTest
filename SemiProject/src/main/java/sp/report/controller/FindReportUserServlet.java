package sp.report.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sp.member.service.MemberService;
import sp.member.vo.Member;
import sp.report.service.ReportService;
import sp.report.vo.PactCheck;

/**
 * Servlet implementation class FineReportUserServlet
 */
@WebServlet(name = "FindReportUser", urlPatterns = { "/findReportUser.do" })
public class FindReportUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindReportUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		MemberService mservice = new MemberService();
		Member m = mservice.selectOneMember(memberId);
		ReportService rservice = new ReportService();
		int check = rservice.countCheck(m); 
		int pact = rservice.countPact(m);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		PactCheck p = new PactCheck(check, pact);
		gson.toJson(p,out);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
