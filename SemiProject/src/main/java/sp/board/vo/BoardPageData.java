package sp.board.vo;

public class BoardPageData {
	private Board b;
	private int start;
	private int totalCount;
	public BoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardPageData(Board b, int start, int totalCount) {
		super();
		this.b = b;
		this.start = start;
		this.totalCount = totalCount;
	}
	public Board getB() {
		return b;
	}
	public void setB(Board b) {
		this.b = b;
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
	
	
}
