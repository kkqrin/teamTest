package sp.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.board.vo.Board;
import sp.board.vo.BoardComment;
import sp.board.vo.BoardPageData;

public class BoardDao {

	public ArrayList<Board> selectBoardList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		String query = "select * from(select rownum as RNUM,n.* from(select * from board order by 1 desc)n) where RNUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardWriter(rset.getString("board_writer"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardContent(rset.getString("board_content"));
				b.setReadCount(rset.getInt("read_count"));		
				b.setRefDate(rset.getString("ref_date"));				
				b.setFileName(rset.getString("filename"));
				b.setFilePath(rset.getString("filepath"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select Count(*) cnt from board";
		try {
			pstmt = conn.prepareStatement(query);
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

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into board values(board_seq.nextval,?,?,?,0,to_char(sysdate,'YYYY-MM-DD HH:mi:SS'),?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBoardWriter());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getFileName());
			pstmt.setString(5, b.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Board selectOneBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		String query = "select * from board where board_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Board();
				
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardWriter(rset.getString("board_writer"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardContent(rset.getString("board_content"));
				b.setReadCount(rset.getInt("read_count"));		
				b.setRefDate(rset.getString("ref_date"));				
				b.setFileName(rset.getString("filename"));
				b.setFilePath(rset.getString("filepath"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return b;
	}

	public int boardDelete(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from board where board_no = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertBoardComment(Connection conn, BoardComment bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into board_comment values(board_comment_seq.nextval,?,?,?,?,to_char(sysdate,'YYYY-MM-DD HH:mi:SS'))";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bc.getBcWriter());
			pstmt.setInt(2, bc.getBoardRef());
			pstmt.setString(3, (bc.getBcRef()==0)?null:String.valueOf(bc.getBcRef()));
			pstmt.setString(4, bc.getBcContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int updateReadCount(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update board set read_count = read_count +1 where board_no = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<BoardComment> selectBoardComment(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardComment> list = new ArrayList<BoardComment>();
		String query = "select * from board_comment where board_ref = ? and bc_ref is null order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardComment bc = new BoardComment();
				bc.setBcNo(rset.getInt("bc_no"));
				bc.setBcWriter(rset.getString("bc_writer"));
				bc.setBcContent(rset.getString("bc_content"));
				bc.setBcDate(rset.getString("bc_date"));
				bc.setBoardRef(rset.getInt("board_ref"));
				bc.setBcRef(rset.getInt("bc_ref"));
				list.add(bc);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public ArrayList<BoardComment> selectBoardReComment(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardComment> list = new ArrayList<BoardComment>();
		String query = "select * from board_comment where board_ref = ? and bc_ref is not null order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardComment bc = new BoardComment();
				bc.setBcNo(rset.getInt("bc_no"));
				bc.setBcWriter(rset.getString("bc_writer"));
				bc.setBcContent(rset.getString("bc_content"));
				bc.setBcDate(rset.getString("bc_date"));
				bc.setBoardRef(rset.getInt("board_ref"));
				bc.setBcRef(rset.getInt("bc_ref"));
				list.add(bc);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public int deleteBoardComment(Connection conn, int bcNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from board_comment where bc_no = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bcNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update board set board_title = ?,board_content = ?,filename = ?,filepath = ? where board_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getFileName());
			pstmt.setString(4, b.getFilePath());
			pstmt.setInt(5, b.getBoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateBoardComment(Connection conn, BoardComment bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update board_comment set bc_content =? where bc_no =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bc.getBcContent());
			pstmt.setInt(2, bc.getBcNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	
}
