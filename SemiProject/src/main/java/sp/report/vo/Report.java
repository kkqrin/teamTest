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
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Report(int reportNo, int memberNo, String reportMember, String enrollDate, int reportType,
			String reportContent, int reportPrice, String filename, String filepath, int pactCheck) {
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

}
