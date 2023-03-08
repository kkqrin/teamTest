package sp.deal.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

	public int updateReserve(int productNo, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReserve(conn, productNo);
		if(result>0) {
			result = dao.insertDeal(conn, productNo, memberNo);
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

	public int updateComplete(int productNo, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateComplete(conn, productNo, memberNo);
		if(result>0) {
			result = dao.insertDeal2(conn,productNo,memberNo);
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

	public Deal selectProducNo(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Deal d = dao.selectProductNo(conn, memberNo);
		JDBCTemplate.close(conn);
		return d;
	}



}
