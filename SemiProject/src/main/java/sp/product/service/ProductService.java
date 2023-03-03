package sp.product.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.product.dao.ProductDao;
import sp.product.vo.Category;

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

	public ArrayList<Category> selectOneSubCategory() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> list = dao.selectOneSubCategory(conn);
		return null;
	}
}
