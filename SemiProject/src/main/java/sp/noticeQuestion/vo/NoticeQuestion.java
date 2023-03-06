package sp.noticeQuestion.vo;

public class NoticeQuestion {
	private int faqNo;
	private int memberNo;
	private int faqCategory;
	private String faqTitle;
	private String faqContent;
	private int faqCount;
	public NoticeQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeQuestion(int faqNo, int memberNo, int faqCategory, String faqTitle, String faqContent, int faqCount) {
		super();
		this.faqNo = faqNo;
		this.memberNo = memberNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqCount = faqCount;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getFaqCategory() {
		return faqCategory;
	}
	public void setFaqCategory(int faqCategory) {
		this.faqCategory = faqCategory;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public int getFaqCount() {
		return faqCount;
	}
	public void setFaqCount(int faqCount) {
		this.faqCount = faqCount;
	}
}
