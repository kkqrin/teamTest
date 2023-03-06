package sp.board.controller;

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

import sp.board.service.BoardService;
import sp.board.vo.Board;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet(name = "BoardUpdate", urlPatterns = { "/boardUpdate.do" })
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//파일 업로드 경로 설정
				String root = getServletContext().getRealPath("/");
				String saveDirectory = root+"upload/board";
				//파일 최대크기 
				int maxSize = 10*1024*1024;
				//Rquest > MultipartRequest 로 변환(파일 업로드 시점)
				MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize,"utf-8" , new DefaultFileRenamePolicy());
				int boardNo = Integer.parseInt(mRequest.getParameter("boardNo"));
				String boardTitle = mRequest.getParameter("boardTitle");
				String boardContent = mRequest.getParameter("boardContent");
				
				//기존 파일이 지워졌으면 "delete" 그외 "stay"
				String status = mRequest.getParameter("status");
				
				//새 첨부파일이 있으면 새 첨부파일 값 , 없으면 null
				String filename = mRequest.getOriginalFileName("upfile");
				String filepath = mRequest.getFilesystemName("upfile");
				
				//기존 첨부파일이 있으면 기존첨부파일값 , 없었으면 null
				String oldFilename = mRequest.getParameter("oldFilename");
				String oldFilepath = mRequest.getParameter("oldFilepath");
				
				if(oldFilename != null && status.equals("stay")) {
					filename = oldFilename;
					filepath = oldFilepath;
				}
				Board b = new Board();
				b.setBoardNo(boardNo);
				b.setBoardTitle(boardTitle);
				b.setBoardContent(boardContent);
				b.setFileName(filename);
				b.setFilePath(filepath);
				
				BoardService service = new BoardService();
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				int result = service.updateBoard(b);
				if(result == 0) {
					request.setAttribute("title", "수정실패");
					request.setAttribute("msg", "공지사항 수정에 실패했습니다.");
					request.setAttribute("icon", "error");
				}else {
					request.setAttribute("title", "수정성공");
					request.setAttribute("msg", "공지사항 수정에 성공했습니다.");
					request.setAttribute("icon", "success");
					if(status.equals("delete")) {
						File delFile = new File(saveDirectory+"/"+oldFilepath);
						delFile.delete();
					}
				}
				request.setAttribute("loc", "/boardView.do?boardNo="+b.getBoardNo());
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
