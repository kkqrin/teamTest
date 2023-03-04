package sp.product.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.product.dao.ProductDao;
import sp.product.vo.Category;
import sp.product.vo.Product;

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

	public ArrayList<Category> selectOneSubCategory(int categoryRef) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> list = dao.selectOneSubCategory(conn, categoryRef);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertProduct(Product p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertProduct(conn, p);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}
}
