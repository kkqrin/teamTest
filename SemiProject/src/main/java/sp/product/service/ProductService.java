package sp.product.service;

import java.sql.Connection;

import common.JDBCTemplate;
import sp.product.dao.ProductDao;

public class ProductService {
	private ProductDao dao;

	public ProductService() {
		super();
		dao = new ProductDao();
	}

	public int reserveProduct(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.reserveProduct(conn,productNo);
		return 0;
	}
}
