package sp.report.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.report.vo.Report;

public class ReportDao {

	public ArrayList<Report> selectAllReport(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Report> list = new ArrayList<Report>();
		//select report_no,report_member,report_type, member_id,pact_check from member_tbl join report_recevied using(member_no) where member_no=2;
		String query = "select * from member_tbl join report_recevied using(member_no)";
		
		try {
			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()){
				Report r = new Report();
				r.setEnrollDate(rset.getString("enroll_Date"));
				r.setFilename(rset.getString("filename"));
				r.setFilepath(rset.getString("filepath"));
				r.setMemberNo(rset.getInt("member_No"));
				r.setPactCheck(rset.getInt("pact_Check"));
				r.setReportContent(rset.getString("report_Content"));
				r.setReportMember(rset.getString("report_Member"));
				r.setReportNo(rset.getInt("report_No"));
				r.setReportPrice(rset.getInt("report_Price"));
				r.setReportType(rset.getInt("report_Type"));
				r.setMemberId(rset.getString("member_Id"));
				list.add(r);
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

	public int changePactCheck(Connection conn, int memberNo, int pactCheck) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update report_recevied set pact_check=? where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pactCheck);
			pstmt.setInt(2, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int changeMemberGrade(Connection conn, int memberNo, int pactCheck) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = null;
		if(pactCheck == 1) {
			query = "update member_tbl set member_grade=4 where member_no=?";
			deleteProduct(conn, memberNo);
		}else if(pactCheck ==2) {
			query = "update member_tbl set member_grade=2 where member_no=?";			
		}
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteProduct(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from product where seller_id = (select member_id from REPORT_RECEVIED left join member_tbl using(member_no) where member_no=?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Report selectOneReport(Connection conn, int reportNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Report r = null;
		String query = "select * from member_tbl join report_recevied using(member_no) where report_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				r = new Report();
				r.setEnrollDate(rset.getString("enroll_date"));
				r.setFilename(rset.getString("filename"));
				r.setFilepath(rset.getString("filepath"));
				r.setMemberId(rset.getString("member_id"));
				r.setMemberNo(rset.getInt("member_no"));
				r.setPactCheck(rset.getInt("pact_check"));
				r.setReportContent(rset.getString("report_content"));
				r.setReportMember(rset.getString("report_member"));
				r.setReportNo(rset.getInt("report_no"));
				r.setReportPrice(rset.getInt("report_price"));
				r.setReportType(rset.getInt("report_type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return r;
	}

}
