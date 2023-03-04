package sp.product.vo;

import java.util.ArrayList;

public class ProductPageData {
	private ArrayList<Product> list;
	private String pageNavi;
	private int start;
	private int categoryNo;

	public ProductPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductPageData(ArrayList<Product> list, String pageNavi, int start, int categoryNo) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.categoryNo = categoryNo;
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

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

}
