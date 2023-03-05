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

	public ArrayList<Product> selectProductList(Connection conn, int start, int end, int category, int clickCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list  = new ArrayList<Product>();
		String query = "";
		
		if(clickCategory == 0) {
			// 상위카테고리 category_ref기준
			query = "SELECT * FROM (SELECT ROWNUM AS RNUM, N.* FROM ( SELECT PRODUCT_NO, CATEGORY_NO, SELLER_ID, PRODUCT_TITLE, PRODUCT_STATUS, PRODUCT_PRICE, VIEW_COUNT, PRODUCT_AREA, ENROLL_DATE, FILEPATH FROM PRODUCT LEFT JOIN CATEGORY USING (CATEGORY_NO) WHERE CATEGORY_ref=? ORDER BY 1 DESC )N) WHERE RNUM BETWEEN ? AND ?";			
		}else if(clickCategory == 1) {
			// 하위카테고리 category_no기준
			query = "SELECT * FROM (SELECT ROWNUM AS RNUM, N.* FROM ( SELECT PRODUCT_NO, CATEGORY_NO, SELLER_ID, PRODUCT_TITLE, PRODUCT_STATUS, PRODUCT_PRICE, VIEW_COUNT, PRODUCT_AREA, ENROLL_DATE, FILEPATH FROM PRODUCT LEFT JOIN CATEGORY USING (CATEGORY_NO) WHERE CATEGORY_NO=? ORDER BY 1 DESC )N) WHERE RNUM BETWEEN ? AND ?";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, category);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setCategoryNo(rset.getInt("category_no"));
				p.setSellerId(rset.getString("seller_id"));
				p.setProductTitle(rset.getString("product_title"));
				p.setProductStatus(rset.getInt("product_status"));
				p.setProductPrice(rset.getInt("product_price"));
				p.setViewCount(rset.getInt("view_count"));
				p.setProductArea(rset.getString("product_area"));
				p.setEnrollDate(rset.getString("enroll_date"));
				p.setFilepath(rset.getString("filepath"));
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

	public int selectProductList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		
		String query = "select count(*) as cnt from product";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return totalCount;
	}

	public ArrayList<Category> selectCategoryList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = new ArrayList<Category>();
		
		String query = "select * from category where category_ref is null order by 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Category c = new Category();
				c.setCategoryName(rset.getString("category_name"));
				c.setCategoryNo(rset.getInt("category_no"));
				c.setCategoryRef(rset.getInt("category_ref"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public ArrayList<Category> selectSubCategoryList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = new ArrayList<Category>();
		
		String query = "select * from category where category_ref is not null order by 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Category c = new Category();
				c.setCategoryName(rset.getString("category_name"));
				c.setCategoryNo(rset.getInt("category_no"));
				c.setCategoryRef(rset.getInt("category_ref"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public Category selectFirstCategoryName(Connection conn, int category, int clickCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Category cn = null;
		String query = "";
		
		if(clickCategory == 0) {
			// 상위 카테고리의 전체
			query = "select c1.category_name as cn from category c1 left join category c2 on(c1.category_no=c2.category_ref) where c2.category_ref=?";
		}else if(clickCategory == 1) {
			query = "select c2.category_name as cn from category c1 left join category c2 on(c1.category_no=c2.category_ref) where c2.category_no=?";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, category);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cn = new Category();
				cn.setfCategoryName(rset.getString("cn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return cn;
	}

}
