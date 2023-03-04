package sp.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.product.vo.Category;
import sp.product.vo.Product;

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

	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into product values(product_seq.nextval, ?, ?, ?, 0, ?, 0, ?, TO_CHAR(SYSDATE,'YYYY-MM-DD HH:mi:SS'), ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, p.getCategoryNo());
			pstmt.setString(2, p.getSellerId());
			pstmt.setString(3, p.getProductTitle());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setString(5, p.getProductContent());
			pstmt.setString(6, p.getProductArea());
			pstmt.setString(7, p.getFilename());
			pstmt.setString(8, p.getFilepath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
