package sp.deal.vo;

public class Deal {
	private int dealNo;
	private int productNo;
	private int memberNo;
	private String reserveDate;
	private String completeDate;
	
	//deal table 없는 변수 저장
	private String sellerId;
	private String productTitle;
	private int productPrice;
	private int productStatus;
	private String memberId;
	
	
	public Deal() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Deal(int dealNo, int productNo, int memberNo, String reserveDate, String completeDate, String sellerId,
			String productTitle, int productPrice, int productStatus, String memberId) {
		super();
		this.dealNo = dealNo;
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.reserveDate = reserveDate;
		this.completeDate = completeDate;
		this.sellerId = sellerId;
		this.productTitle = productTitle;
		this.productPrice = productPrice;
		this.productStatus = productStatus;
		this.memberId = memberId;
	}


	public int getDealNo() {
		return dealNo;
	}


	public void setDealNo(int dealNo) {
		this.dealNo = dealNo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}


	public String getCompleteDate() {
		return completeDate;
	}


	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
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


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getProductStatus() {
		return productStatus;
	}


	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	
}
