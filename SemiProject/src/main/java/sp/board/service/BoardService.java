package sp.board.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.board.dao.BoardDao;
import sp.board.vo.Board;
import sp.board.vo.BoardPageData;

public class BoardService {
	private BoardDao dao;

	public BoardService() {
		super();
		dao = new BoardDao();
	}

	public BoardPageData selectBoardList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = dao.selectBoardList(conn);
		int numPerPage = 10;
		//요청페이지가 1페이지면 → 최신글 1~10번(100개의 글경우 91~100)
		//요청페이지가 2페이지면 → 최신글 11~20번(100개의 글경우 81~90)
		//요청페이지가 3페이지면 → 최신글 21~30번(100개의 글경우 71~80)
		int end = numPerPage*reqPage;
		int start = end -numPerPage +1;
		//페이징 제작 시작
		int totalCount = dao.selectBoardCount(conn);
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		//네비게이션 사이즈
		int pageNaviSize = 5;
		
		//페이지네비게이션 시작번호
		//reqPage 1~5 : 1 2 3 4 5
		//reqPage 6~10 : 6 7 8 9 10
		//reqPage 11~15 : 11 12 13 14 15 
		
		int pageNo = ((reqPage -1)/pageNaviSize)*pageNaviSize + 1;
		
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/boardList.do?reqPage="+(1)+"'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/noticeList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(totalPage)+"'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		//NoticePageData npd = new NoticePageData(list,pageNavi,start);
		JDBCTemplate.close(conn);
		//return npd;
		return null;
	}
	
}
