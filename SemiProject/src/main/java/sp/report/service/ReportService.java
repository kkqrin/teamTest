package sp.report.service;

import sp.report.dao.ReportDao;

public class ReportService {
	private ReportDao dao;
	public ReportService() {
		super();
		dao = new ReportDao();
	}


}
