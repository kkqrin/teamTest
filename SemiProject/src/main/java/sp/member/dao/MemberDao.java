package sp.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

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

	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member_tbl where member_Id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				m.setEnrollDate(rset.getString("enroll_date"));
				m.setMemberAddr(rset.getString("member_addr"));
				m.setMemberAddr2(rset.getString("member_addr2"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setMemberGrade(rset.getInt("member_grade"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberPoint(rset.getInt("member_point"));
				m.setMemberTemp(rset.getInt("member_temp"));
				m.setPostNumber(rset.getString("post_number"));
				m.setMemberPw(rset.getString("member_pw"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into member_tbl values(member_tbl_seq.nextval,?,?,?,?,?,3,to_char(sysdate,'yyyy-mm-dd'),?,?,?,0,36.5)";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2,m.getMemberPw());
			pstmt.setString(3,m.getMemberName());
			pstmt.setString(4,m.getMemberPhone());
			pstmt.setString(5,m.getMemberEmail());
			pstmt.setString(6, m.getPostNumber());
			pstmt.setString(7, m.getMemberAddr());
			pstmt.setString(8, m.getMemberAddr2());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member selectOneMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
	
		String query = "select * from member_tbl where member_id=? and member_pw=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			rset=pstmt.executeQuery();
			if(rset.next()) {
				//이제 조회한 결과를 member객체로 member라는 변수에 모든 정보를 세팅함
				member = new Member();
				member.setEnrollDate(rset.getString("enroll_date"));
				member.setMemberAddr(rset.getString("member_addr"));
				member.setMemberAddr2(rset.getString("member_addr2"));
				member.setMemberEmail(rset.getString("member_email"));
				member.setMemberGrade(rset.getInt("member_grade"));
				member.setMemberId(rset.getString("member_id"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberNo(rset.getInt("member_no"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setMemberPoint(rset.getInt("member_point"));
				member.setMemberTemp(rset.getInt("member_temp"));
				member.setPostNumber(rset.getString("post_number"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(rset);
		}
		return member;
		
	}

}
