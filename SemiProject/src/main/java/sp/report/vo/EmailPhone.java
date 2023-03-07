package sp.report.vo;

public class EmailPhone {
	private String memberPhone;
	private String memberEmail;
	public EmailPhone() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmailPhone(String memberPhone, String memberEmail) {
		super();
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
}
