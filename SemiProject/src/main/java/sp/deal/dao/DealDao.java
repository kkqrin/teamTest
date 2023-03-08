package sp.deal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.loader.JdbcLeakPrevention;

import common.JDBCTemplate;
import sp.deal.vo.Deal;

public class DealDao {

	public ArrayList<Deal> selectAllDeal(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Deal> list = new ArrayList<Deal>();
		String query = "select * from deal left join member_tbl using (member_no) left join product using (product_no) order by deal_no";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Deal d = new Deal();
				d.setCompleteDate(rset.getString("complete_date"));
				d.setDealNo(rset.getInt("deal_no"));
				d.setMemberNo(rset.getInt("member_no"));
				d.setProductNo(rset.getInt("product_no"));
				d.setProductPrice(rset.getInt("product_price"));
				d.setProductStatus(rset.getInt("product_Status"));
				d.setProductTitle(rset.getString("product_title"));
				d.setReserveDate(rset.getString("reserve_date"));
				d.setSellerId(rset.getString("seller_id"));
				d.setMemberId(rset.getString("member_id"));
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public int updateReserve(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update product set product_status=1 where product_No=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertDeal(Connection conn, int productNo, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into deal values(deal_seq.nextval,?,?,to_char(sysdate, 'yyyy-mm-dd hh:mi:ss'),null)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, memberNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateComplete(Connection conn, int productNo, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update product set product_status=2 where product_No=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}

	public int insertDeal2(Connection conn, int productNo, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into deal values(deal_seq.nextval,?,?,null,to_char(sysdate, 'yyyy-mm-dd hh:mi:ss'))";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, memberNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Deal selectProductNo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Deal d = null;
		String query = "select product_no from deal where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				d = new Deal();
				d.setProductNo(rset.getInt("product_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return d;
	}
}
