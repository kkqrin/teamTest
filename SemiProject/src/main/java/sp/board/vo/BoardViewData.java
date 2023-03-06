package sp.board.vo;

import java.util.ArrayList;

public class BoardViewData {
	private Board b;
	private ArrayList<BoardComment> commentList;
	private ArrayList<BoardComment> reCommentList;
	public BoardViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardViewData(Board b, ArrayList<BoardComment> commentList, ArrayList<BoardComment> reCommentList) {
		super();
		this.b = b;
		this.commentList = commentList;
		this.reCommentList = reCommentList;
	}
	public Board getB() {
		return b;
	}
	public void setB(Board b) {
		this.b = b;
	}
	public ArrayList<BoardComment> getCommentList() {
		return commentList;
	}
	public void setCommentList(ArrayList<BoardComment> commentList) {
		this.commentList = commentList;
	}
	public ArrayList<BoardComment> getReCommentList() {
		return reCommentList;
	}
	public void setReCommentList(ArrayList<BoardComment> reCommentList) {
		this.reCommentList = reCommentList;
	}
	
}
