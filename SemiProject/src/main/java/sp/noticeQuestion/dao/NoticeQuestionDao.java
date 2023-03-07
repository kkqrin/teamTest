package sp.noticeQuestion.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.noticeQuestion.vo.NoticeQuestion;

public class NoticeQuestionDao {

	public ArrayList<NoticeQuestion> selectNoticeQuestionList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<NoticeQuestion> list = new ArrayList<NoticeQuestion>();
		String query = "select * from (select rownum as rnum, n.* from(select faq_no, member_no, faq_category, faq_title, faq_content, faq_count from faq order by 1 desc)n) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				NoticeQuestion nq = new NoticeQuestion();
				nq.setFaqNo(rset.getInt("faq_no"));
				nq.setMemberNo(rset.getInt("member_no"));
				nq.setFaqCategory(rset.getInt("faq_category"));
				nq.setFaqTitle(rset.getString("faq_title"));
				nq.setFaqCount(rset.getInt("faq_count"));
				list.add(nq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int selectNoticeQuestionCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query ="select count(*) as cnt from faq";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public NoticeQuestion selectOneNoticeQuestion(Connection conn, int faqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		NoticeQuestion nq = null;
		String query ="select * from faq where faq_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				nq = new NoticeQuestion();
				nq.setFaqCategory(rset.getInt("faq_no"));
				nq.setFaqContent(rset.getString("faq_content"));
				nq.setFaqCount(rset.getInt("faq_count"));
				nq.setFaqNo(rset.getInt("faq_no"));
				nq.setFaqTitle(rset.getString("faq_title"));
				nq.setMemberNo(rset.getInt("member_no"));
				nq.setFaqCategory(rset.getInt("faq_category"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return nq;
	}

	public int updateReadCount(Connection conn, int faqNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update faq set faq_count = faq_count+1 where faq_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertNoticeQuestion(Connection conn, NoticeQuestion nq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO FAQ VALUES(FAQ_SEQ.NEXTVAL,1,?,?,?,0)";
		try {
			pstmt = conn.prepareStatement(query); //카테고리 제목 내용
			pstmt.setInt(1, nq.getFaqCategory());
			pstmt.setString(2, nq.getFaqTitle());
			pstmt.setString(3, nq.getFaqContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}

























