package in.sp.main.model;

import in.sp.main.entity.CustEnquiry;
import in.sp.main.entity.CustFollowUp;

public class CustEnquiryModel {
	
	private String phoneno;
	private CustEnquiry custEnquiry;
	private CustFollowUp custFollowUp;
	
	
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public CustEnquiry getCustEnquiry() {
		return custEnquiry;
	}
	public void setCustEnquiry(CustEnquiry custEnquiry) {
		this.custEnquiry = custEnquiry;
	}
	public CustFollowUp getCustFollowUp() {
		return custFollowUp;
	}
	public void setCustFollowUp(CustFollowUp custFollowUp) {
		this.custFollowUp = custFollowUp;
	}
}
