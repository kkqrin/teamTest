package sp.report.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.report.service.ReportService;
import sp.report.vo.Report;

/**
 * Servlet implementation class ReportFileDownServlet
 */
@WebServlet(name = "ReportFileDown", urlPatterns = { "/reportFileDown.do" })
public class ReportFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportFileDownServlet() {
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
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		//3. 비즈니스로직
		ReportService service = new ReportService();
		Report r = service.selectOneReport(reportNo);
		//4. 결과처리
		//다운로드를 시킬 파일과 서블릿을 연결(경로 가져오기 webapp)
		String root = getServletContext().getRealPath("/");
		//webapp 폴더 기준으로 다운로드 시킬 파일명 연결
		String downFile = root+"upload/report/"+r.getFilepath();
		//파일을 서블릿으로 읽어오기 위한 스트림 생성(+속도 개선을 위한 보조스트림생성)
		FileInputStream fis = new FileInputStream(downFile);
		BufferedInputStream bis = new BufferedInputStream(fis);
		//읽어올 파일을 사용자에게 내보낼 스트림 생성(+보조스트림);
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		//파일명 처리
		String resFilename = new String(r.getFilename().getBytes("UTF-8"),"ISO-8859-1");
		//파일 다운로드를 위한 HTTP 헤더 설정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment;filename="+resFilename);
		//파일전송
		while(true) {
			int read = bis.read();
			if(read != -1) {
				bos.write(read);
			}else {
				break;
			}
		}
		bis.close();
		bos.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
