package sp.member.vo;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
 	private String memberEmail;
	private int memberGrade;
	private String enrollDate;
	private String postNumber;
	private String memberAddr;
	private String memberAddr2;
	private int	memberPoint;
	private String memberTemp;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int memberNo, String memberId, String memberPw, String memberName, String memberPhone,
			String memberEmail, int memberGrade, String enrollDate, String postNumber, String memberAddr,
			String memberAddr2, int memberPoint, String memberTemp) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberGrade = memberGrade;
		this.enrollDate = enrollDate;
		this.postNumber = postNumber;
		this.memberAddr = memberAddr;
		this.memberAddr2 = memberAddr2;
		this.memberPoint = memberPoint;
		this.memberTemp = memberTemp;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public int getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getPostNumber() {
		return postNumber;
	}
	public void setPostNumber(String postNumber) {
		this.postNumber = postNumber;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberAddr2() {
		return memberAddr2;
	}
	public void setMemberAddr2(String memberAddr2) {
		this.memberAddr2 = memberAddr2;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberTemp() {
		return memberTemp;
	}
	public void setMemberTemp(String memberTemp) {
		this.memberTemp = memberTemp;
	}

	
}
