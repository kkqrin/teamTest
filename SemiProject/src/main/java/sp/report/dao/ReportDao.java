//package sp.report.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//import common.JDBCTemplate;
//import sp.member.vo.Member;
//import sp.report.vo.Report;
//
//public class ReportDao {
//
//	public ArrayList<Report> selectAllReport(Connection conn) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		ArrayList<Report> list = new ArrayList<Report>();
//		//select report_no,report_member,report_type, member_id,pact_check from member_tbl join report_recevied using(member_no) where member_no=2;
//		String query = "select * from member_tbl join report_recevied using(member_no)";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
////			pstmt.setInt(1, memberNo);
//			rset = pstmt.executeQuery();
//			while(rset.next()){
//				Report r = new Report();
//				r.setEnrollDate(rset.getString("enroll_Date"));
//				r.setFilename(rset.getString("filename"));
//				r.setFilepath(rset.getString("filepath"));
//				r.setMemberNo(rset.getInt("member_No"));
//				r.setPactCheck(rset.getInt("pact_Check"));
//				r.setReportContent(rset.getString("report_Content"));
//				r.setReportMember(rset.getString("report_Member"));
//				r.setReportNo(rset.getInt("report_No"));
//				r.setReportPrice(rset.getInt("report_Price"));
//				r.setReportType(rset.getInt("report_Type"));
//				r.setMemberId(rset.getString("member_Id"));
//				list.add(r);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(pstmt);
//			JDBCTemplate.close(rset);
//		}
//		
//		return list;
//	}
//
//	public int changePactCheck(Connection conn, int memberNo, int pactCheck) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		String query = "update report_recevied set pact_check=? where member_no=?";
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, pactCheck);
//			pstmt.setInt(2, memberNo);
//			result = pstmt.executeUpdate();
//			if(result>0) {
//				result = changeMemberGrade(conn, memberNo,pactCheck);
//			}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(pstmt);
//		}
//		return result;
//	}
//
//	public int changeMemberGrade(Connection conn, int memberNo, int pactCheck) {
//		// TODO Auto-generated method stub
//		PreparedStatement pstmt = null;
//		int result = 0;
//		String query = null;
//		if(pactCheck == 1) {
//			query = "update member_tbl set member_grade=4 where member_no=?";
////			deleteProduct(conn, memberNo);
//		}else if(pactCheck ==2) {
//			query = "update member_tbl set member_grade=2 where member_no=?";			
//		}
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, memberNo);
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(pstmt);
//		}
//		return result;
//	}
//
//	public int deleteProduct(Connection conn, int memberNo) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		String query = "delete from product where seller_id = (select member_id from REPORT_RECEVIED left join member_tbl using(member_no) where member_no=?)";
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, memberNo);
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(pstmt);
//		}
//		
//		return result;
//	}
//
//	public Report selectOneReport(Connection conn, int reportNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		Report r = null;
//		String query = "select * from member_tbl join report_recevied using(member_no) where report_no=?";
//		try {
//			pstmt=conn.prepareStatement(query);
//			pstmt.setInt(1, reportNo);
//			rset=pstmt.executeQuery();
//			if(rset.next()) {
//				r = new Report();
//				r.setEnrollDate(rset.getString("enroll_date"));
//				r.setFilename(rset.getString("filename"));
//				r.setFilepath(rset.getString("filepath"));
//				r.setMemberId(rset.getString("member_id"));
//				r.setMemberNo(rset.getInt("member_no"));
//				r.setPactCheck(rset.getInt("pact_check"));
//				r.setReportContent(rset.getString("report_content"));
//				r.setReportMember(rset.getString("report_member"));
//				r.setReportNo(rset.getInt("report_no"));
//				r.setReportPrice(rset.getInt("report_price"));
//				r.setReportType(rset.getInt("report_type"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(pstmt);
//			JDBCTemplate.close(rset);
//		}
//		return r;
//	}
//
//<<<<<<< HEAD
//	public ArrayList<Report> selectDeal(Connection conn, int memberNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		ArrayList<Report> list = new ArrayList<Report>();
//		String query = "select * from deal left join member_tbl using (member_no) left join product using (product_no) where member_no=?";
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, memberNo);
//			rset = pstmt.executeQuery();
//			while(rset.next()) {
//				Report r = new Report();
//				r.setProductNo(rset.getInt("product_No"));
//				r.setProductTitle(rset.getString("product_Title"));
//				r.setSellerId(rset.getString("seller_Id"));
//				r.setProductStatus(rset.getInt("product_Status"));
//				r.setCompleteDate(rset.getString("complete_date"));
//				r.setReserveDate(rset.getString("reserve_date"));
//				list.add(r);
//=======
//	public int countCheck(Connection conn, Member m) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		int result = 0;
//		String query = "select count(pact_check)as cnt from report_recevied where member_no = ?";
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, m.getMemberNo());
//			rset = pstmt.executeQuery();
//			if(rset.next()) {
//				result = rset.getInt("cnt");
//>>>>>>> c1cdccc69448c70be9e53a8fb204179cb9ad50be
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//<<<<<<< HEAD
//			JDBCTemplate.close(pstmt);
//			JDBCTemplate.close(rset);
//		}
//		
//		return list;
//=======
//			JDBCTemplate.close(rset);
//			JDBCTemplate.close(pstmt);
//		}
//		
//		
//		return result;
//	}
//
//	public int countPact(Connection conn, Member m) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		int result = 0;
//		String query = "select count(pact_check)as cnt from report_recevied where member_no = ? pact_check = 1";
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, m.getMemberNo());
//			rset = pstmt.executeQuery();
//			if(rset.next()) {
//				result = rset.getInt("cnt");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			JDBCTemplate.close(rset);
//			JDBCTemplate.close(pstmt);
//		}
//
//		return result;
//>>>>>>> c1cdccc69448c70be9e53a8fb204179cb9ad50be
//	}

//}
		package sp.report.dao;

		import java.sql.Connection;
		import java.sql.PreparedStatement;
		import java.sql.ResultSet;
		import java.sql.SQLException;
		import java.util.ArrayList;

		import common.JDBCTemplate;
		import sp.member.vo.Member;
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
//					pstmt.setInt(1, memberNo);
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
					if(result>0) {
						result = changeMemberGrade(conn, memberNo,pactCheck);
					}
					
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
//					deleteProduct(conn, memberNo);
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

			public ArrayList<Report> selectDeal(Connection conn, int memberNo) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				ArrayList<Report> list = new ArrayList<Report>();
				String query = "select * from deal left join member_tbl using (member_no) left join product using (product_no) where member_no=?";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, memberNo);
					rset = pstmt.executeQuery();
					while(rset.next()) {
						Report r = new Report();
						r.setProductNo(rset.getInt("product_No"));
						r.setProductTitle(rset.getString("product_Title"));
						r.setSellerId(rset.getString("seller_Id"));
						r.setProductStatus(rset.getInt("product_Status"));
						r.setCompleteDate(rset.getString("complete_date"));
						r.setReserveDate(rset.getString("reserve_date"));
						r.setMemberNo(rset.getInt("member_no"));
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

			public int countCheck(Connection conn, Member m) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				int result = 0;
				String query = "select count(pact_check)as cnt from report_recevied where member_no = ?";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, m.getMemberNo());
					rset = pstmt.executeQuery();
					if(rset.next()) {
						result = rset.getInt("cnt");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					JDBCTemplate.close(rset);
					JDBCTemplate.close(pstmt);
				}

				return result;
				
			}

			public int countPact(Connection conn, Member m) {
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				int result = 0;
				String query = "select count(pact_check)as cnt from report_recevied where member_no = ? pact_check = 1";
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, m.getMemberNo());
					rset = pstmt.executeQuery();
					if(rset.next()) {
						result = rset.getInt("cnt");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					JDBCTemplate.close(rset);
					JDBCTemplate.close(pstmt);
				}

				return result;
		}
	}

					
			
			


