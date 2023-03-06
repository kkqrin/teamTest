package sp.product.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import sp.product.dao.ProductDao;
import sp.product.vo.Category;
import sp.product.vo.Product;
import sp.product.vo.ProductComment;
import sp.product.vo.ProductPageData;
import sp.product.vo.ProductViewData;

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

	public ProductPageData selectProductList(int category, int reqPage, int clickCategory) {
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 20;
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;
		// 상품 게시글 리스트
		ArrayList<Product> list = dao.selectProductList(conn, start, end, category, clickCategory);
		// 화면 출력을 위한 해당 카테고리 이름 불러오기
		Category cn = dao.selectFirstCategoryName(conn, category, clickCategory);
		
		int totalCount = dao.selectProductList(conn, category, clickCategory);
		
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
			if(clickCategory == 0) {
				pageNavi += "<a class='page-item' href='/productList.do?category="+category+"&reqPage="+(pageNo-1)+"'>";				
			}else if(clickCategory == 1) {
				pageNavi += "<a class='page-item' href='/productSubList.do?category="+category+"&reqPage="+(pageNo-1)+"'>";
			}
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		
		// 페이지네비 숫자
		for(int i=0;i < pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				if(clickCategory == 0) {
					pageNavi += "<a class='page-item active-page' href='/productList.do?category="+category+"&reqPage="+(pageNo)+"'>";					
				}else if(clickCategory == 1) {
					pageNavi += "<a class='page-item active-page' href='/productSubList.do?category="+category+"&reqPage="+(pageNo)+"'>";
				}
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				if(clickCategory == 0) {
					pageNavi += "<a class='page-item' href='/productList.do?category="+category+"&reqPage="+(pageNo)+"'>";					
				}else {
					pageNavi += "<a class='page-item' href='/productSubList.do?category="+category+"&reqPage="+(pageNo)+"'>";
				}
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
			if(clickCategory == 0) {
				pageNavi += "<a class='page-item' href='/productList.do?category="+category+"&reqPage="+(pageNo)+"'>";				
			}else if(clickCategory == 1) {
				pageNavi += "<a class='page-item' href='/productSubList.do?category="+category+"&reqPage="+(pageNo)+"'>";
			}
			pageNavi += "<span class='material-icons'>chevron_right</span>";				
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		
		ProductPageData ppd = new ProductPageData();
		ppd.setList(list);
		ppd.setPageNavi(pageNavi);
		ppd.setStart(start);
		if(clickCategory == 0) {
			ppd.setCategoryRef(category);			
		}else if(clickCategory == 1) {
			ppd.setCategoryNo(category);			
		}
		ppd.setfCategoryName(cn.getfCategoryName());
		
		JDBCTemplate.close(conn);
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

	public ProductViewData selectOneProduct(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		// 조회수 올리기
		int result = dao.updateViewCount(conn, productNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			// 게시글 상세 보기
			Product p = dao.selectOneProduct(conn, productNo);
			
			// 댓글창
			// 1. 일반 댓글
			ArrayList<ProductComment> commentList = dao.selectProductComment(conn, productNo);
			// 2. 대댓글
			ArrayList<ProductComment> reCommentList = dao.selectProductReComment(conn, productNo);
			
			ProductViewData pvd = new ProductViewData(p, commentList, reCommentList);
			
			JDBCTemplate.close(conn);
			return pvd;
		}else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);
			return null;
		}
	}

	public int insertProductComment(ProductComment pc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertProductComment(conn, pc);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateProductComment(ProductComment pc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateProductComment(conn, pc);

		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteProductComment(int pdNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteProductComment(conn, pdNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}
}
