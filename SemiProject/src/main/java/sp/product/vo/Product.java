package sp.product.vo;

public class Product {
	private int productNo;
	private int categoryNo;
	private String sellerId;
	private String productTitle;
	private int productStatus;
	private int productPrice;
	private int viewCount;
	private String productContent;
	private String enrollDate;
	private String productArea;
	private String filename;
	private String filepath;
	private String filename2;
	private String filepath2;
	private String filename3;
	private String filepath3;
	
	
	private int memberNo;
	private int wishProductNo;
	private int wishCount;

	private String enrollMonth;
	private String enrollDay;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int productNo, int categoryNo, String sellerId, String productTitle, int productStatus,
			int productPrice, int viewCount, String productContent, String enrollDate, String productArea,
			String filename, String filepath, int memberNo, int wishProductNo, int wishCount, String enrollMonth,
			String enrollDay) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.sellerId = sellerId;
		this.productTitle = productTitle;
		this.productStatus = productStatus;
		this.productPrice = productPrice;
		this.viewCount = viewCount;
		this.productContent = productContent;
		this.enrollDate = enrollDate;
		this.productArea = productArea;
		this.filename = filename;
		this.filepath = filepath;
		this.memberNo = memberNo;
		this.wishProductNo = wishProductNo;
		this.wishCount = wishCount;
		this.enrollMonth = enrollMonth;
		this.enrollDay = enrollDay;
	}
	
	public Product(int productNo, int categoryNo, String sellerId, String productTitle, int productStatus,
			int productPrice, int viewCount, String productContent, String enrollDate, String productArea,
			String filename, String filepath, String filename2, String filepath2, String filename3, String filepath3,
			int memberNo, int wishProductNo, int wishCount) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.sellerId = sellerId;
		this.productTitle = productTitle;
		this.productStatus = productStatus;
		this.productPrice = productPrice;
		this.viewCount = viewCount;
		this.productContent = productContent;
		this.enrollDate = enrollDate;
		this.productArea = productArea;
		this.filename = filename;
		this.filepath = filepath;
		this.filename2 = filename2;
		this.filepath2 = filepath2;
		this.filename3 = filename3;
		this.filepath3 = filepath3;
		this.memberNo = memberNo;
		this.wishProductNo = wishProductNo;
		this.wishCount = wishCount;
	}

	
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public int getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getProductArea() {
		return productArea;
	}

	public void setProductArea(String productArea) {
		this.productArea = productArea;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getWishProductNo() {
		return wishProductNo;
	}

	public void setWishProductNo(int wishProductNo) {
		this.wishProductNo = wishProductNo;
	}

	public int getWishCount() {
		return wishCount;
	}

	public void setWishCount(int wishCount) {
		this.wishCount = wishCount;
	}

	public String getEnrollMonth() {
		return enrollMonth;
	}

	public void setEnrollMonth(String enrollMonth) {
		this.enrollMonth = enrollMonth;
	}

	public String getEnrollDay() {
		return enrollDay;
	}

	public void setEnrollDay(String enrollDay) {
		this.enrollDay = enrollDay;
	}

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public String getFilepath2() {
		return filepath2;
	}

	public void setFilepath2(String filepath2) {
		this.filepath2 = filepath2;
	}

	public String getFilename3() {
		return filename3;
	}

	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}

	public String getFilepath3() {
		return filepath3;
	}

	public void setFilepath3(String filepath3) {
		this.filepath3 = filepath3;
	}


}
