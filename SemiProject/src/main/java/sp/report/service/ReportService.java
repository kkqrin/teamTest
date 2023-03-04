package sp.report.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.report.dao.ReportDao;
import sp.report.vo.Report;

public class ReportService {
	private ReportDao dao;
	public ReportService() {
		super();
		dao = new ReportDao();
	}
	public ArrayList<Report> selectAllReport(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Report> list = dao.selectAllReport(conn, memberNo);
		JDBCTemplate.close(conn);
		return list;
	}
	public int changePactCheck(int memberNo, int pactCheck) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.changePactCheck(conn, memberNo, pactCheck);
		if(result>0) {
			// 멤버 등급 변경
			result = dao.changeMemberGrade(conn, memberNo,pactCheck);
			// 상품 삭제
//			result = dao.deleteProduct(conn,memberNo);
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


}
