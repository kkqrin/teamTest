package sp.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.member.vo.Member;

public class MemberDao {

	public ArrayList<Member> selectAllMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		String query = "select * from member_tbl order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setEnrollDate(rset.getString("enroll_date"));
				m.setMemberAddr(rset.getNString("member_addr"));
				m.setMemberAddr2(rset.getString("member_addr2"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setMemberGrade(rset.getInt("member_grade"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberTemp(rset.getInt("member_temp"));
				m.setMemberPoint(rset.getInt("member_point"));
				m.setPostNumber(rset.getString("post_number"));
				list.add(m);
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

	public int changeGrade(Connection conn, int memberNo, int memberGrade) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member_tbl set member_grade=? where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberGrade);
			pstmt.setInt(2, memberNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


}
