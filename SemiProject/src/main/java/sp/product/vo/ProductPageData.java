package sp.product.vo;

import java.util.ArrayList;

public class ProductPageData {
	private ArrayList<Product> list;
	private String pageNavi;
	private int start;
	private int categoryRef;
	private int categoryNo;
	// 화면 출력을 위한 하위카테고리가 참조하는 카테고리의 이름
	private String fCategoryName;

	public ProductPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductPageData(ArrayList<Product> list, String pageNavi, int start, int categoryRef, int categoryNo,
			String fCategoryName) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.categoryRef = categoryRef;
		this.categoryNo = categoryNo;
		this.fCategoryName = fCategoryName;
	}

	public ArrayList<Product> getList() {
		return list;
	}

	public void setList(ArrayList<Product> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCategoryRef() {
		return categoryRef;
	}

	public void setCategoryRef(int categoryRef) {
		this.categoryRef = categoryRef;
	}

	public String getfCategoryName() {
		return fCategoryName;
	}

	public void setfCategoryName(String fCategoryName) {
		this.fCategoryName = fCategoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

}
