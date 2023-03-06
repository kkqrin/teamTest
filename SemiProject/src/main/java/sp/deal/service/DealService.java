package sp.deal.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.deal.dao.DealDao;
import sp.deal.vo.Deal;

public class DealService {
	private DealDao dao;

	public DealService() {
		super();
		dao = new DealDao();
	}

	public ArrayList<Deal> selectAllDeal() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Deal> list = dao.selectAllDeal(conn);
		JDBCTemplate.close(conn);
		return list;
	}
}
