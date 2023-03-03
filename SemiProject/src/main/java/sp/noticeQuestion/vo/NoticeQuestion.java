package sp.noticeQuestion.vo;

public class NoticeQuestion {
	private int faqNo;
	private int memberNo;
	private String faqCategory;
	private String faqContent;
	private int faqCount;
	public NoticeQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeQuestion(int faqNo, int memberNo, String faqCategory, String faqContent, int faqCount) {
		super();
		this.faqNo = faqNo;
		this.memberNo = memberNo;
		this.faqCategory = faqCategory;
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
	public String getFaqCategory() {
		return faqCategory;
	}
	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
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
