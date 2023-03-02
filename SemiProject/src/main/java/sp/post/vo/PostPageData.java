package sp.post.vo;

import java.util.ArrayList;

public class PostPageData {
	private ArrayList<Post> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	private int notRead;
	public PostPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostPageData(ArrayList<Post> list, String pageNavi, int start, int totalCount, int notRead) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
		this.notRead = notRead;
	}
	public ArrayList<Post> getList() {
		return list;
	}
	public void setList(ArrayList<Post> list) {
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
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getNotRead() {
		return notRead;
	}
	public void setNotRead(int notRead) {
		this.notRead = notRead;
	}
	
}
