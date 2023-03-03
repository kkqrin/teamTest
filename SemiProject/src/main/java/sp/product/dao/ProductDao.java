package sp.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProductDao {

	public int reserveProduct(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update product set product_status=1 where product_no=?";
		return 0;
	}

}
