package sp.product.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.product.dao.ProductDao;
import sp.product.vo.Category;
import sp.product.vo.Product;
import sp.product.vo.ProductPageData;

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

	public ProductPageData selectProductList(int categoryNo, int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 20;
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;
		ArrayList<Product> list = dao.selectProductList(conn, start, end, categoryNo);
		
		int totalCount = dao.selectProductList(conn);
		
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination circle-style'>";
		
		// 이전버튼은 첫 페이지네비가 아닐때
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/productList.do?category="+categoryNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		
		// 페이지네비 숫자
		for(int i=0;i < pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/productList.do?category="+categoryNo+"&reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/productList.do?category="+categoryNo+"&reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				// 현재 페이지가 전체 페이지 수를 넘어가면
				break;
			}
		}	
			
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/productList.do?category="+categoryNo+"&reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		JDBCTemplate.close(conn);
		
		ProductPageData ppd = new ProductPageData(list, pageNavi, start, categoryNo);
		
		return ppd;
	}

	public ArrayList<Category> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> list = dao.selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Category> selectSubCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> list = dao.selectSubCategoryList(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}
}
