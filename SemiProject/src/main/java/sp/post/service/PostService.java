package sp.post.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.post.dao.PostDao;
import sp.post.vo.Post;
import sp.post.vo.PostPageData;

public class PostService {
	private PostDao dao;

	public PostService() {
		super();
		dao = new PostDao();
	}

	public PostPageData selectPostAllList(int reqPage,String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = numPerPage*reqPage;
		int start = end - numPerPage+1;
		ArrayList<Post> list = dao.selectPostAllList(conn,memberId,start,end);
		//페이징 시작
		int totalCount = dao.selectPostCount(conn,memberId);
		int notRead = dao.selectNotRead(conn,memberId);
		
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
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(1)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(pageNo-1)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/postList.do?reqPage="+(pageNo)+"&memberId=admin'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(pageNo)+"&memberId=admin'>";
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
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(pageNo)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(totalPage)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		PostPageData ppd = new PostPageData(list, pageNavi, start, totalCount, notRead);
		JDBCTemplate.close(conn);
		return ppd;
	}

	public Post selectOnePost(int postNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updatePostCount(conn,postNo);
		if(result ==0) {
			JDBCTemplate.rollback(conn);
			return null;
		}else {
			JDBCTemplate.commit(conn);	
			Post p = dao.selectOnePost(conn,postNo);
			JDBCTemplate.close(conn);
			return p;
		}
	}

	public PostPageData selectPostNoReadList(int reqPage, String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = numPerPage*reqPage;
		int start = end - numPerPage+1;
		ArrayList<Post> list = dao.selectPostNoReadList(conn,memberId,start,end);
		//페이징 시작
		int totalCount = dao.selectPostCount(conn,memberId);
		int notRead = dao.selectNotRead(conn,memberId);
		
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
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(1)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(pageNo-1)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/postList.do?reqPage="+(pageNo)+"&memberId=admin'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(pageNo)+"&memberId=admin'>";
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
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(pageNo)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/postList.do?reqPage="+(totalPage)+"&memberId=admin'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		PostPageData ppd1 = new PostPageData(list, pageNavi, start, totalCount, notRead);
		JDBCTemplate.close(conn);
		return ppd1;
	}
}
	

