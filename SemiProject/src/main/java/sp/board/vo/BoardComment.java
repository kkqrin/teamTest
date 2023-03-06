package sp.board.vo;

public class BoardComment {
	private int bcNo;
	private String bcWriter;
	private int boardRef;
	private int bcRef;
	private String bcContent;
	private String bcDate;
	public BoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardComment(int bcNo, String bcWriter, int boardRef, int bcRef, String bcContent, String bcDate) {
		super();
		this.bcNo = bcNo;
		this.bcWriter = bcWriter;
		this.boardRef = boardRef;
		this.bcRef = bcRef;
		this.bcContent = bcContent;
		this.bcDate = bcDate;
	}
	public int getBcNo() {
		return bcNo;
	}
	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}
	public String getBcWriter() {
		return bcWriter;
	}
	public void setBcWriter(String bcWriter) {
		this.bcWriter = bcWriter;
	}
	public int getBoardRef() {
		return boardRef;
	}
	public void setBoardRef(int boardRef) {
		this.boardRef = boardRef;
	}
	public int getBcRef() {
		return bcRef;
	}
	public void setBcRef(int bcRef) {
		this.bcRef = bcRef;
	}
	public String getBcContent() {
		return bcContent;
	}
	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}
	
	public String getBcDate() {
		return bcDate;
	}
	public void setBcDate(String bcDate) {
		this.bcDate = bcDate;
	}
	
}
