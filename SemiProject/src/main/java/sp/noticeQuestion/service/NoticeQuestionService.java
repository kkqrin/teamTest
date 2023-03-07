package sp.noticeQuestion.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.notice.vo.Notice;
import sp.noticeQuestion.dao.NoticeQuestionDao;
import sp.noticeQuestion.vo.NoticeQuestion;
import sp.noticeQuestion.vo.NoticeQuestionPageData;

public class NoticeQuestionService {
	private NoticeQuestionDao dao;

	public NoticeQuestionService() {
		super();
		dao = new NoticeQuestionDao();
	}

	public NoticeQuestionPageData selectNoticeQuestionList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = numPerPage*reqPage;
		int start = end - numPerPage + 1;
		ArrayList<NoticeQuestion> list = dao.selectNoticeQuestionList(conn,start,end);
		
		int totalCount = dao.selectNoticeQuestionCount(conn);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//이전 버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeQuestionList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지 숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/noticeQuestionList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/noticeQuestionList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeQuestionList.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		
		JDBCTemplate.close(conn);
		NoticeQuestionPageData qpd = new NoticeQuestionPageData(list, pageNavi, start);
		return qpd;
	}

	public NoticeQuestion selectOneNoticeQuestion(int faqNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReadCount(conn,faqNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
			NoticeQuestion nq = dao.selectOneNoticeQuestion(conn, faqNo);
			JDBCTemplate.close(conn);
			System.out.println(nq);
			return nq;
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return null;
	}

	public int insertNoticeQuestion(NoticeQuestion nq) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertNoticeQuestion(conn,nq);
		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
