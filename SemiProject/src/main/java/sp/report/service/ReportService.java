package sp.report.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.StringTokenizer;

import common.JDBCTemplate;
import sp.member.vo.Member;
import sp.report.dao.ReportDao;
import sp.report.vo.Report;

public class ReportService {
	private ReportDao dao;
	public ReportService() {
		super();
		dao = new ReportDao();
	}
	public ArrayList<Report> selectAllReport() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Report> list = dao.selectAllReport(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int changePactCheck(int memberNo, int pactCheck) {
		Connection conn = JDBCTemplate.getConnection();
		//신고 게시판 상태 변경
		int result = dao.changePactCheck(conn, memberNo, pactCheck);
		if(result>0) {
			// 멤버 등급 변경
			result = dao.changeMemberGrade(conn, memberNo,pactCheck);
			
//			if(result>0) {
				// 상품 삭제
//				result = dao.deleteProduct(conn,memberNo);
				if(result>0) {
					JDBCTemplate.commit(conn);
				}else {
					JDBCTemplate.rollback(conn);
				}
//			}else {
//				JDBCTemplate.rollback(conn);
//			}
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public boolean checkedChangePactCheck(String no, String pact) {
		Connection conn = JDBCTemplate.getConnection();
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		StringTokenizer sT2 = new StringTokenizer(pact,"/");
		boolean result = true;
		while(sT1.hasMoreTokens()) {
			int memberNo = Integer.parseInt(sT1.nextToken());
			int pactCheck = Integer.parseInt(sT2.nextToken());
			// 신고게시판 pactCheck 업데이트 -> 멤버등급(사기꾼) -> 사기꾼 게시글 삭제
			int changeResult = dao.changePactCheck(conn, memberNo, pactCheck);
			if(changeResult == 0) {
				result = false;
				break;
			}
		}
		if(result) {
			JDBCTemplate.commit(conn);			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Report selectOneReport(int reportNo) {
		Connection conn = JDBCTemplate.getConnection();
		Report r = dao.selectOneReport(conn,reportNo);
		JDBCTemplate.close(conn);
		return r;
	}
	public int countCheck(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int check = dao.countCheck(conn,m);
		JDBCTemplate.close(conn);
		return check;
	}
	public int countPact(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int pact = dao.countCheck(conn,m);
		JDBCTemplate.close(conn);
		return pact;
		
	}


}
