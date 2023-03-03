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
	public ArrayList<Report> selectAllReport() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Report> list = dao.selectAllReport(conn);
		JDBCTemplate.close(conn);
		return list;
	}


}
