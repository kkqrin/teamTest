package sp.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.product.vo.Category;

public class ProductDao {

	public int reserveProduct(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update product set product_status=1 where product_no=?";
		return 0;
	}

	public ArrayList<Category> selectOneSubCategory(Connection conn, int categoryRef) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = new ArrayList<Category>();
		
		String query = "select * from category where category_ref=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, categoryRef);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Category p = new Category();
				p.setCategoryName(rset.getString("category_name"));
				p.setCategoryNo(rset.getInt("category_no"));
				p.setCategoryRef(rset.getInt("category_ref"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

}
