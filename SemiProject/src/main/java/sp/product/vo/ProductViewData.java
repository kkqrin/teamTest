package sp.product.vo;

import java.util.ArrayList;

public class ProductViewData {
	private Product p;
	private ArrayList<ProductComment> commentList;
	private ArrayList<ProductComment> reCommentList;
	private ArrayList<Product> wishList;
	private Category c;

	public ProductViewData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductViewData(Product p, ArrayList<ProductComment> commentList, ArrayList<ProductComment> reCommentList,
			ArrayList<Product> wishList, Category c) {
		super();
		this.p = p;
		this.commentList = commentList;
		this.reCommentList = reCommentList;
		this.wishList = wishList;
		this.c = c;
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

	public ArrayList<Product> getWishList() {
		return wishList;
	}

	public void setWishList(ArrayList<Product> wishList) {
		this.wishList = wishList;
	}

	public Category getC() {
		return c;
	}

	public void setC(Category c) {
		this.c = c;
	}

}
