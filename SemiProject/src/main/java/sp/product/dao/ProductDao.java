package sp.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.product.vo.Category;
import sp.product.vo.Product;
import sp.product.vo.ProductComment;

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
			query = "SELECT * FROM (SELECT ROWNUM AS RNUM, N.* FROM ( SELECT PRODUCT_NO, CATEGORY_NO, SELLER_ID, PRODUCT_TITLE, PRODUCT_STATUS, PRODUCT_PRICE, VIEW_COUNT, PRODUCT_AREA, substr(enroll_date,6,2) as month, substr(enroll_date,9,2) as day, FILEPATH FROM PRODUCT LEFT JOIN CATEGORY USING (CATEGORY_NO) WHERE CATEGORY_ref=? ORDER BY 1 DESC )N) WHERE RNUM BETWEEN ? AND ?";			
		}else if(clickCategory == 1) {
			// 하위카테고리 category_no기준
			query = "SELECT * FROM (SELECT ROWNUM AS RNUM, N.* FROM ( SELECT PRODUCT_NO, CATEGORY_NO, SELLER_ID, PRODUCT_TITLE, PRODUCT_STATUS, PRODUCT_PRICE, VIEW_COUNT, PRODUCT_AREA, substr(enroll_date,6,2) as month, substr(enroll_date,9,2) as day, FILEPATH FROM PRODUCT LEFT JOIN CATEGORY USING (CATEGORY_NO) WHERE CATEGORY_NO=? ORDER BY 1 DESC )N) WHERE RNUM BETWEEN ? AND ?";
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
//				p.setEnrollDate(rset.getString("enroll_date"));
				p.setEnrollMonth(rset.getString("month"));
				p.setEnrollDay(rset.getString("day"));
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

	public int selectProductList(Connection conn, int category, int clickCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "";
		int totalCount = 0;
		
		if(clickCategory == 0) {
			query = "select count(*) as cnt from product p left join category c using (category_no) where c.category_ref=?";			
		}else if(clickCategory == 1) {
			query = "select count(*) as cnt from product where category_no=?";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, category);
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

	public int updateViewCount(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update product set view_count = view_count+1 where product_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Product selectOneProduct(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = "select * from product where product_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setCategoryNo(rset.getInt("category_no"));
				p.setEnrollDate(rset.getString("enroll_date"));
				p.setFilename(rset.getString("filename"));
				p.setFilepath(rset.getString("filepath"));
				p.setProductArea(rset.getString("product_area"));
				p.setProductContent(rset.getString("product_content"));
				p.setProductNo(rset.getInt("product_no"));
				p.setProductPrice(rset.getInt("product_price"));
				p.setProductStatus(rset.getInt("product_status"));
				p.setProductTitle(rset.getString("product_title"));
				p.setSellerId(rset.getString("seller_id"));
				p.setViewCount(rset.getInt("view_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return p;
	}

	public ArrayList<ProductComment> selectProductComment(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductComment> list = new ArrayList<ProductComment>();
		
		// 댓글만 조회 (null)
		String query = "select * from product_comment where product_ref=? and pd_ref is null order by 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductComment pc = new ProductComment();
				pc.setPdContent(rset.getString("pd_content"));
				pc.setPdDate(rset.getString("pd_date"));
				pc.setPdNo(rset.getInt("pd_no"));
				pc.setPdRef(rset.getInt("pd_ref"));
				pc.setPdWriter(rset.getString("pd_writer"));
				pc.setProductRef(rset.getInt("product_ref"));
				list.add(pc);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public ArrayList<ProductComment> selectProductReComment(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductComment> list = new ArrayList<ProductComment>();
		
		// 대댓글만 조회(not null)
		String query = "select * from product_comment where product_ref=? and pd_ref is not null order by 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductComment pc = new ProductComment();
				pc.setPdContent(rset.getString("pd_content"));
				pc.setPdDate(rset.getString("pd_date"));
				pc.setPdNo(rset.getInt("pd_no"));
				pc.setPdRef(rset.getInt("pd_ref"));
				pc.setPdWriter(rset.getString("pd_writer"));
				pc.setProductRef(rset.getInt("product_ref"));
				list.add(pc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public int insertProductComment(Connection conn, ProductComment pc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into product_comment values(product_comment_seq.nextval, ?, ?, TO_CHAR(SYSDATE,'YYYY-MM-DD HH:mi:SS'), ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pc.getPdWriter());
			pstmt.setString(2, pc.getPdContent());
			pstmt.setInt(3, pc.getProductRef());
			if(pc.getPdRef() == 0) {
				pstmt.setString(4, null);
			}else {
				pstmt.setInt(4, pc.getPdRef());
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateProductComment(Connection conn, ProductComment pc) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		String query = "update product_comment set pd_content=? where pd_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pc.getPdContent());
			pstmt.setInt(2, pc.getPdNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int deleteProductComment(Connection conn, int pdNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "delete from product_comment where pd_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pdNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Product> selectMyWishProduct(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
		String query = "SELECT WISH_PRODUCT_NO, PRODUCT_NO, PRODUCT_TITLE, PRODUCT_STATUS, PRODUCT_PRICE, substr(enroll_date,6,2) as month, substr(enroll_date,9,2) as day, FILEPATH, MEMBER_NO, view_count FROM WISH_PRODUCT LEFT JOIN PRODUCT USING (PRODUCT_NO) WHERE MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setWishProductNo(rset.getInt("wish_product_no"));
				p.setProductNo(rset.getInt("product_no"));
				p.setProductTitle(rset.getString("product_title"));
				p.setProductStatus(rset.getInt("product_status"));
				p.setProductPrice(rset.getInt("product_price"));
//				p.setEnrollDate(rset.getString("enroll_date"));
				p.setEnrollMonth(rset.getString("month"));
				p.setEnrollDay(rset.getString("day"));
				p.setFilepath(rset.getString("filepath"));
				p.setMemberNo(rset.getInt("member_no"));
				p.setViewCount(rset.getInt("view_count"));
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

	public int insertWishProduct(Connection conn, int memberNo, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "INSERT INTO WISH_PRODUCT VALUES(WISH_PRODUCT_SEQ.NEXTVAL, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, productNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Product> selectProductWishTable(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<>();
		
		String query = "SELECT MEMBER_NO FROM WISH_PRODUCT WHERE PRODUCT_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product wp = new Product();
				wp.setMemberNo(rset.getInt("member_no"));
				list.add(wp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		
		return list;
	}

	public int deleteWishProduct(Connection conn, int memberNo, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "DELETE FROM WISH_PRODUCT WHERE MEMBER_NO=? AND PRODUCT_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, productNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Product> selectPopularProduct(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
		String query = "select * from (select rownum as rnum, n.* from (select product_no,category_no,seller_id,product_title,product_status,product_price,view_count,product_content,substr(enroll_date,6,2) as month, substr(enroll_date,9,2) as day,product_area,filename,filepath,wish_count from (select p.*,(SELECT count(*)  FROM WISH_PRODUCT wp where wp.product_no=p.product_no) as wish_count from product p order by wish_count desc) where wish_count != 0)n) where rnum between 1 and 8";
		
		try {
			pstmt = conn.prepareStatement(query);
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
				p.setProductContent(rset.getString("product_content"));
//				p.setEnrollDate(rset.getString("enroll_date"));
				p.setEnrollMonth(rset.getString("month"));
				p.setEnrollDay(rset.getString("day"));
				p.setProductArea(rset.getString("product_area"));
				p.setFilename(rset.getString("filename"));
				p.setFilepath(rset.getString("filepath"));
				p.setWishCount(rset.getInt("wish_count"));
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

	public Category selectCategoryNames(Connection conn, int categoryNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Category c = null;
		
		String query = "select c.category_name as fc_name, sub.category_name as sc_name from category c join category sub on (c.category_no = sub.category_ref) where sub.category_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, categoryNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Category();
				c.setfCategoryName(rset.getString("fc_name"));
				c.setCategoryName(rset.getString("sc_name"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return c;
	}
	public Product selectProductMemberNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		String query = "select member_no from product p left join member_tbl m on (p.seller_id = m.member_id)where product_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Product();
				p.setMemberNo(rset.getInt("member_No"));
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return p;
	}

	

	public ArrayList<Product> selectNewProduct(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
//		String query = "SELECT * FROM (SELECT ROWNUM AS RNUM, N.* FROM ( SELECT PRODUCT_NO, CATEGORY_NO, SELLER_ID, PRODUCT_TITLE, PRODUCT_STATUS, PRODUCT_PRICE, VIEW_COUNT, PRODUCT_AREA, substr(enroll_date,6,2) as month, substr(enroll_date,9,2) as day, FILEPATH FROM PRODUCT LEFT JOIN CATEGORY USING (CATEGORY_NO) ORDER BY 1 DESC )N) WHERE RNUM BETWEEN 1 AND 8";
		String query = "select * from (select rownum as rnum, n.* from (select p.*,(SELECT count(*) FROM WISH_PRODUCT wp where wp.product_no=p.product_no) as wish_count from product p order by 1 desc)n) where rnum between 1 and 8";
		
		try {
			pstmt = conn.prepareStatement(query);
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
				p.setWishCount(rset.getInt("wish_count"));
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

	public ArrayList<Product> selectMyStore(Connection conn, String sellerId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
		String query = "select product_no, category_no, seller_id, product_title, product_status, product_price, view_count, product_area, enroll_date, filepath from product where seller_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sellerId);
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
}


