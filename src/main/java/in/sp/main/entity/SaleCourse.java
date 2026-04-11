package in.sp.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "sale_course")
public class SaleCourse {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "Cust_Phone_No")
	private String custphoneno;
	
	@Column(name = "Course_Name")
	private String interestedcourse;
	
	@Column(name = "Emp_Email_ID")
	private String empEmailId;
	
	@Column(name = "Date")
	private String date;
	
	@Column(name = "Time")
	private String time;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustphoneno() {
		return custphoneno;
	}
	public void setCustphoneno(String custphoneno) {
		this.custphoneno = custphoneno;
	}
	public String getEmpEmailId() {
		return empEmailId;
	}
	public void setEmpEmailId(String empEmailId) {
		this.empEmailId = empEmailId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getInterestedcourse() {
		return interestedcourse;
	}
	public void setInterestedcourse(String interestedcourse) {
		this.interestedcourse = interestedcourse;
	}
	
}
