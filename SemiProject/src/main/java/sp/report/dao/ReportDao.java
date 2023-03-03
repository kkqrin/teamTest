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
			rset = pstmt.executeQuery();
			while(rset.next()){
				Report r = new Report();
				r.setEnrollDate(rset.getString("enrollDate"));
				r.setFilename(rset.getString("filename"));
				r.setFilepath(rset.getString("filepath"));
				r.setMemberNo(rset.getInt("memberNo"));
				r.setPactCheck(rset.getInt("pactCheck"));
				r.setReportContent(rset.getString("reportContent"));
				r.setReportMember(rset.getString("reportMember"));
				r.setReportNo(rset.getInt("reportNo"));
				r.setReportPrice(rset.getInt("reportPrice"));
				r.setReportType(rset.getInt("reportType"));
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

}
