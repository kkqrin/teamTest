package sp.notice.controller;

import java.io.File;
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
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet(name = "NoticeUpdate", urlPatterns = { "/noticeUpdate.do" })
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
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
		//2-1. 파일 업로드 경로 설정
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/notice";
		//2-2. 파일 최대크기 지정
		int maxSize = 10*1024*1024;
		//2-3. request - > MultipartRequest객체로 변환(파일 업로드)
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		int noticeNo = Integer.parseInt(mRequest.getParameter("noticeNo"));
		String noticeTitle = mRequest.getParameter("noticeTitle");
		String noticeContent = mRequest.getParameter("noticeContent");
		//기존 파일이 지워졌으면 "delete", 그외에는 "stay"
		String status = mRequest.getParameter("status");
		//새 첨부파일이 있으면 새 첨부파일 값, 없으면 null
		String filename = mRequest.getOriginalFileName("upfile"); //1
		String filepath = mRequest.getFilesystemName("upfile"); //1
		//기존 첨부파일이 있었으면 기존 첨부파일값, 없었으면 null
		String oldFilename = mRequest.getParameter("oldFilename"); //2
		String oldFilepath = mRequest.getParameter("oldFilepath"); //2
		if(oldFilename != null && status.equals("stay")) {
			filename = oldFilename;
			filepath = oldFilepath;
		}
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setFilename(filename);
		n.setFilepath(filepath);
		//3. 비지니스로직
		NoticeService service = new NoticeService();
		int result = service.updateNotice(n);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("title", "변경완료!!!");
			request.setAttribute("msg", "공지사항이 수정되었습니다.!!");
			request.setAttribute("icon", "success");
			if(status.equals("delete")) {
				File delFile = new File(saveDirectory+"/"+oldFilepath);
				delFile.delete();
			}
		}else {
			request.setAttribute("title", "변경실퐤!!!!");
			request.setAttribute("msg", "오류가 발생하였습니다!!");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/noticeView.do?noticeNo="+n.getNoticeNo());
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
