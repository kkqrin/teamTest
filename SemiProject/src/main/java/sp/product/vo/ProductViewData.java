package sp.product.vo;

import java.util.ArrayList;

public class ProductViewData {
	private Product p;
	private ArrayList<ProductComment> commentList;
	private ArrayList<ProductComment> reCommentList;

	public ProductViewData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductViewData(Product p, ArrayList<ProductComment> commentList, ArrayList<ProductComment> reCommentList) {
		super();
		this.p = p;
		this.commentList = commentList;
		this.reCommentList = reCommentList;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	public ArrayList<ProductComment> getCommentList() {
		return commentList;
	}

	public void setCommentList(ArrayList<ProductComment> commentList) {
		this.commentList = commentList;
	}

	public ArrayList<ProductComment> getReCommentList() {
		return reCommentList;
	}

	public void setReCommentList(ArrayList<ProductComment> reCommentList) {
		this.reCommentList = reCommentList;
	}

}
