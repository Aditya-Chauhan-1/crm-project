package in.sp.main.entity;

import org.springframework.web.multipart.MultipartFile;

import in.sp.main.urls.OtherUrls;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "Course_Name")
	private String coursename;
	
	@Column(name = "Syllabus")
	private String syllabus;
	
	@Column(name = "Original_Price")
	private String originalprice;
	
	@Column(name = "Discount_Price")
	private String discountedprice;
	
	@Column(name = "Course_Validity")
	private String coursevalidity;
	
	@Column(name = "Course_img_url")
	private String courseimage;
	
	@Column(name = "Trainer_Name")
	private String trainersname;
	
	@Column(name = "Trainer_Details")
	private String trainersdetails;
	
	@Column(name = "Trainer_img_url")
	private String trainersimage;
	
	@Column(name = "Other_Details")
	private String otherdetails;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public String getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(String originalprice) {
		this.originalprice = originalprice;
	}
	public String getDiscountedprice() {
		return discountedprice;
	}
	public void setDiscountedprice(String discountedprice) {
		this.discountedprice = discountedprice;
	}
	public String getCoursevalidity() {
		return coursevalidity;
	}
	public void setCoursevalidity(String coursevalidity) {
		this.coursevalidity = coursevalidity;
	}
	public String getCourseimage() {
		return courseimage;
	}
	public void setCourseimage(MultipartFile file) {
		this.courseimage = OtherUrls.IMAGE_UPLOAD_URL + file.getOriginalFilename();
	}
	public String getTrainersname() {
		return trainersname;
	}
	public void setTrainersname(String trainersname) {
		this.trainersname = trainersname;
	}
	public String getTrainersdetails() {
		return trainersdetails;
	}
	public void setTrainersdetails(String trainersdetails) {
		this.trainersdetails = trainersdetails;
	}
	public String getTrainersimage() {
		return trainersimage;
	}
	public void setTrainersimage(MultipartFile file) {
		this.trainersimage = OtherUrls.IMAGE_UPLOAD_URL + file.getOriginalFilename();
	}
	public String getOtherdetails() {
		return otherdetails;
	}
	public void setOtherdetails(String otherdetails) {
		this.otherdetails = otherdetails;
	}
}
