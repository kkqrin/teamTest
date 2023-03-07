package sp.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sp.notice.service.NoticeService;
import sp.notice.vo.Notice;

/**
 * Servlet implementation class DeleteNoticeServlet
 */
@WebServlet(name = "DeleteNotice", urlPatterns = { "/deleteNotice.do" })
public class DeleteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNoticeServlet() {
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
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		//3. 비지니스로직
		NoticeService service = new NoticeService();
		Notice n = service.deleteNotice(noticeNo);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(n != null) {
			//게시글 삭제에 성공하면 첨부파일이 있는지 확인한 후
			//첨부파일 있으면 삭제
			if(n.getFilepath() != null) {
				String root = getServletContext().getRealPath("/");
				String deleteFile = root+"upload/notice/"+n.getFilepath();
				File delFile = new File(deleteFile);
				delFile.delete();//파일삭제코드
			}
			request.setAttribute("title", "삭제성공!!!");
			request.setAttribute("msg", "게시글이 삭제되었습니다!!");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/noticeList.do?reqPage=1");
		}else {
			request.setAttribute("title", "삭제실퐤!!!!");
			request.setAttribute("msg", "용티브잡스에게 문의하세요!!");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/noticeView.do?noticeNo="+noticeNo);
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
