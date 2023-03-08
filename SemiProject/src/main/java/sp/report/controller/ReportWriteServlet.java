package sp.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import sp.report.service.ReportService;
import sp.report.vo.Report;

/**
 * Servlet implementation class ReportWriteServlet
 */
@WebServlet(name = "ReportWrite", urlPatterns = { "/reportWrite.do" })
public class ReportWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportWriteServlet() {
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
		String root = getServletContext().getRealPath("/");
		String saveDirectoty = root+"upload/report";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectoty, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		int memberNo = Integer.parseInt(mRequest.getParameter("memberNo"));
		String reportMember = mRequest.getParameter("reportMember");
		int reportType = Integer.parseInt(mRequest.getParameter("reportType"));
		String reportContent = mRequest.getParameter("reportContent");
		String filename =mRequest.getOriginalFileName("upfile");
		String filepath = mRequest.getFilesystemName("upfile");
		Report r = new Report();
		r.setMemberNo(memberNo);
		r.setReportMember(reportMember);
		r.setReportType(reportType);
		r.setReportContent(reportContent);
		r.setFilename(filename);
		r.setFilepath(filepath);
		//3. 비즈니스로직
		ReportService service = new ReportService();
		int result = service.insertReport(r);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "신고 접수 완료");
			request.setAttribute("msg", "신고 접수가 완료되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "신고 접수 실패");
			request.setAttribute("msg", "신고 접수가 실패되었습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/reportWriteFrm.do");
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
