package sp.report.vo;

public class Report {
	private int reportNo;
	private int memberNo;
	private String reportMember;
	private String enrollDate;
	private int reportType;
	private String reportContent;
	private int reportPrice;
	private String filename;
	private String filepath;
	private int pactCheck;
	private String memberId;
	
	//거래내역조회
	private int productNo;
	private String productTitle;
	private String sellerId;
	private int productStatus;
	private String reserveDate;
	private String completeDate;
	
	
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Report(int reportNo, int memberNo, String reportMember, String enrollDate, int reportType,
			String reportContent, int reportPrice, String filename, String filepath, int pactCheck, String memberId,
			int productNo, String productTitle, String sellerId, int productStatus, String reserveDate,
			String completeDate) {
		super();
		this.reportNo = reportNo;
		this.memberNo = memberNo;
		this.reportMember = reportMember;
		this.enrollDate = enrollDate;
		this.reportType = reportType;
		this.reportContent = reportContent;
		this.reportPrice = reportPrice;
		this.filename = filename;
		this.filepath = filepath;
		this.pactCheck = pactCheck;
		this.memberId = memberId;
		this.productNo = productNo;
		this.productTitle = productTitle;
		this.sellerId = sellerId;
		this.productStatus = productStatus;
		this.reserveDate = reserveDate;
		this.completeDate = completeDate;
	}


	public int getReportNo() {
		return reportNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getReportMember() {
		return reportMember;
	}


	public void setReportMember(String reportMember) {
		this.reportMember = reportMember;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public int getReportType() {
		return reportType;
	}


	public void setReportType(int reportType) {
		this.reportType = reportType;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	public int getReportPrice() {
		return reportPrice;
	}


	public void setReportPrice(int reportPrice) {
		this.reportPrice = reportPrice;
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


	public int getPactCheck() {
		return pactCheck;
	}


	public void setPactCheck(int pactCheck) {
		this.pactCheck = pactCheck;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getProductTitle() {
		return productTitle;
	}


	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}


	public String getSellerId() {
		return sellerId;
	}


	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}


	public int getProductStatus() {
		return productStatus;
	}


	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
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
	

	

}
