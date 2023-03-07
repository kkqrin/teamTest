package sp.product.vo;

public class ProductComment {
	private int pdNo;
	private String pdWriter;
	private String pdContent;
	private String pdDate;
	private int productRef;
	private int pdRef;

	public ProductComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductComment(int pdNo, String pdWriter, String pdContent, String pdDate, int productRef, int pdRef) {
		super();
		this.pdNo = pdNo;
		this.pdWriter = pdWriter;
		this.pdContent = pdContent;
		this.pdDate = pdDate;
		this.productRef = productRef;
		this.pdRef = pdRef;
	}

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public String getPdWriter() {
		return pdWriter;
	}

	public void setPdWriter(String pdWriter) {
		this.pdWriter = pdWriter;
	}

	public String getPdContent() {
		return pdContent;
	}

	public void setPdContent(String pdContent) {
		this.pdContent = pdContent;
	}

	public String getPdDate() {
		return pdDate;
	}

	public void setPdDate(String pdDate) {
		this.pdDate = pdDate;
	}

	public int getProductRef() {
		return productRef;
	}

	public void setProductRef(int productRef) {
		this.productRef = productRef;
	}

	public int getPdRef() {
		return pdRef;
	}

	public void setPdRef(int pdRef) {
		this.pdRef = pdRef;
	}

}
