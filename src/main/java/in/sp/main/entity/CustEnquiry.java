package in.sp.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "CustomerEnquiry")
public class CustEnquiry {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "Phone_no")
	private String phoneno;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "Intrested_Course")
	private String interestedcourse;
	
	@Column(name = "Discussion")
	private String discussion;
	
	@Column(name = "Enquiry_Type")
	private String enquirytype;
	
	@Column(name = "Status")
	private String status;
	
	@Column(name = "Call_TO")
	private String callto;
	
	@Column(name = "Enquiry_Date")
	public String enquirydate;
	
	@Column(name = "Enquiry_Time")
	public String enquirytime;
	
	@Column(name = "emp_email")
	public String empemail;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInterestedcourse() {
		return interestedcourse;
	}
	public void setInterestedcourse(String interestedcourse) {
		this.interestedcourse = interestedcourse;
	}
	public String getDiscussion() {
		return discussion;
	}
	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}
	public String getEnquirytype() {
		return enquirytype;
	}
	public void setEnquirytype(String enquirytype) {
		this.enquirytype = enquirytype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCallto() {
		return callto;
	}
	public void setCallto(String callto) {
		this.callto = callto;
	}
	public String getEnquirydate() {
		return enquirydate;
	}
	public void setEnquirydate(String enquirydate) {
		this.enquirydate = enquirydate;
	}
	public String getEnquirytime() {
		return enquirytime;
	}
	public void setEnquirytime(String enquirytime) {
		this.enquirytime = enquirytime;
	}
	public String getEmpemail() {
		return empemail;
	}
	public void setEmpemail(String empemail) {
		this.empemail = empemail;
	}
	
	
	
}
