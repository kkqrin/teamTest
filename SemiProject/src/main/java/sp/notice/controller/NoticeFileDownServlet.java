package sp.notice.controller;

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

import sp.notice.service.NoticeService;
import sp.notice.vo.Notice;

/**
 * Servlet implementation class NoticeFileDownServlet
 */
@WebServlet(name = "NoticeFileDown", urlPatterns = { "/noticeFileDown.do" })
public class NoticeFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		//2. 값추출
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		//3. 비지니스로직
		NoticeService service = new NoticeService();
		Notice n = service.getNotice(noticeNo);
		//4. 결과처리
		//다운로드를 시킬 파일과 서블릿을 연결
		String root = getServletContext().getRealPath("/");
		//webapp폴더 기준으로 다운로드 시킬 파일명 연결
		String downFile = root+"upload/notice/"+n.getFilepath();
		//파일을 서블릿으로 읽어오기 위한 스트림 생성(+속도 개선을 위한 보조스트림 생성)
		FileInputStream fis = new FileInputStream(downFile);
		BufferedInputStream bis = new BufferedInputStream(fis);
		//읽어온 파일을 사용자에게 내보낼 스트림 생성(+보조스트림)
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		//파일명 처리
		String resFilename = new String(n.getFilename().getBytes("UTF-8"),"ISO-8859-1");
		//파일 다운로드를 위한 HTTP 헤더 설정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		//파일전송
		while(true) {
			int read = bis.read();
			if(read != -1) {
				bos.write(read);
			}else {
				break;
			}
		}
		bos.close();
		bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
