package sp.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.member.vo.Member;
import sp.post.vo.Post;

public class PostDao {

	public ArrayList<Post> selectPostAllList(Connection conn,String memberId ,int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		String query = "select * from(select rownum as RNUM,n.* from(select * from post where post_reseiver = ? order by 1 desc)n) where RNUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Post p = new Post();
				p.setPostNo(rset.getInt("post_no"));
				p.setPostSender(rset.getString("post_sender"));
				p.setPostReseiver(rset.getString("post_reseiver"));
				p.setPostTitle(rset.getString("post_title"));
				p.setPostContent(rset.getString("post_content"));
				p.setRegDate(rset.getString("reg_date"));
				p.setIdentify(rset.getInt("identify"));
				list.add(p);
			}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}

		return list;
	}

	public int selectPostCount(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from post where post_reseiver = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int selectNotRead(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from post where post_reseiver = ? and identify = 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return result;
	}

	public Post selectOnePost(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Post p = null;
		String query = "select * from post where post_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Post();
				p.setPostNo(rset.getInt("post_no"));
				p.setPostSender(rset.getString("post_sender"));
				p.setPostReseiver(rset.getString("post_reseiver"));
				p.setPostTitle(rset.getString("post_title"));
				p.setPostContent(rset.getString("post_content"));
				p.setRegDate(rset.getString("reg_date"));
				p.setIdentify(rset.getInt("identify"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return p;
	}

	public ArrayList<Post> selectPostNoReadList(Connection conn, String memberId, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		String query = "select * from(select rownum as RNUM,n.* from(select * from post where post_reseiver = ? and identify = 1 order by 1 desc)n) where RNUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Post p = new Post();
				p.setPostNo(rset.getInt("post_no"));
				p.setPostSender(rset.getString("post_sender"));
				p.setPostReseiver(rset.getString("post_reseiver"));
				p.setPostTitle(rset.getString("post_title"));
				p.setPostContent(rset.getString("post_content"));
				p.setRegDate(rset.getString("reg_date"));
				p.setIdentify(rset.getInt("identify"));
				list.add(p);
			}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}

		return list;
	}

	public int updatePostCount(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update post set identify = 0 where post_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int selectNoReadPostCount(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from post where post_reseiver = ? and identify = 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertPost(Connection conn, String reseiver, String postTitle, String postContent, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into post values(post_seq.nextval,?,?,?,?,to_char(sysdate,'YYYY-MM-DD HH:mi:SS'),1)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, reseiver);
			pstmt.setString(3, postTitle);
			pstmt.setString(4, postContent);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Post> selectPostSendList(Connection conn, String memberId, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		String query = "select * from(select rownum as RNUM,n.* from(select * from post where post_sender = ? order by 1 desc)n) where RNUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset= pstmt.executeQuery();
			while(rset.next()) {
				Post p = new Post();
				p.setPostNo(rset.getInt("post_no"));
				p.setPostSender(rset.getString("post_sender"));
				p.setPostReseiver(rset.getString("post_reseiver"));
				p.setPostTitle(rset.getString("post_title"));
				p.setPostContent(rset.getString("post_content"));
				p.setRegDate(rset.getString("reg_date"));
				p.setIdentify(rset.getInt("identify"));
				list.add(p);
			}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}

		return list;
	}

	public int selectPostSendCount(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from post where post_sender = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int deletePost(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from post where post_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	/*
	 * public int joinPost(Connection conn, Member m) { PreparedStatement pstmt =
	 * null; int result = 0; String query = "insert into post values()" return 0; }
	 */

}
