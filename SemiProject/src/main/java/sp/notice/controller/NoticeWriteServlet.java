package sp.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import sp.notice.service.NoticeService;
import sp.notice.vo.Notice;

/**
 * Servlet implementation class NoticeWriteServlet
 */
@WebServlet(name = "NoticeWrite", urlPatterns = { "/noticeWrite.do" })
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteServlet() {
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
		String saveDirectory = root+"upload/notice";
		int maxSize = 10*1024*1024;
		MultipartRequest nRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String noticeTitle = nRequest.getParameter("noticeTitle");
		int memberNo = Integer.parseInt(nRequest.getParameter("noticeWriter"));
		String noticeContent = nRequest.getParameter("noticeContent");
		String filename = nRequest.getOriginalFileName("upfile");
		String filepath = nRequest.getFilesystemName("upfile");
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setMemberNo(memberNo);
		n.setNoticeContent(noticeContent);
		n.setFilename(filename);
		n.setFilepath(filepath);
		//3. 비지니스로직
		NoticeService service = new NoticeService();
		int result = service.insertNotice(n);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "게시글 작성 성공!!");
			request.setAttribute("msg", "게시글 작성되었습니다.!!");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "게시글 작성 실패!!");
			request.setAttribute("msg", "오류가 발생하였습니다.!!");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/noticeList.do?reqPage=1");
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
