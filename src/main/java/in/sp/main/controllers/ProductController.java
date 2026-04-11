package in.sp.main.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.Employee;
import in.sp.main.entity.Product;
import in.sp.main.entity.SaleCourse;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;

	@GetMapping("/addProducts")
	public String openAddProductPage(Model model,@RequestParam(name = "redirect_attr_success", required = false)String succes, @RequestParam(name = "redirect_attr_error",required = false)String error) {
		model.addAttribute("productAttr",new Product());
		model.addAttribute("model_succes",succes);
		model.addAttribute("model_errors",error);
		return "add-products";
	}
	
	@PostMapping("/addCourseForm")
	public String addCourseDetails(@ModelAttribute("productAttr") Product product,
			@RequestParam("courseimage") MultipartFile courseImg,
			@RequestParam("trainersimage") MultipartFile trainerImg, RedirectAttributes redirectAttributes) {	
		saveImage(courseImg);
		saveImage(trainerImg);
		
		boolean status = productService.addProductService(product);
		if (status) {
			redirectAttributes.addAttribute("redirect_attr_success","Product Added Successfully");
		}
		else {
			redirectAttributes.addAttribute("redirect_attr_error","Product not added due to some error");
		}
		return "redirect:/addProducts";
	}
	
	private boolean saveImage(MultipartFile file) {
		boolean status = false;
		
		try {
			String fileName = file.getOriginalFilename();
			Path filepath = Paths.get("src/main/resources/static/uploads");
			Files.copy(file.getInputStream(),filepath, StandardCopyOption.REPLACE_EXISTING);
			
			status = true;
		} 
		catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		
		return status;
	}
	
	@GetMapping("/productList")
	public String openProductList(Model model) {
		
		List<Product> list_products = productService.getAllProductListService();
		model.addAttribute("model_products_list",list_products);
		
		return "products-list";
	}
	
	@GetMapping("/courseDetails")
	public String openCourseDetails(@RequestParam("courseName") String coursename, Model model) {
		
		Product product = productService.getProductDetailsService(coursename);
		model.addAttribute("model_product",product);
		
		return "course-details";
	}
	
	@GetMapping("/saleCourse")
	public String openSaleCourse(Model model, @RequestParam(name = "redirectAttr_success",required = false) String success, @RequestParam(name = "redirectAttr_error",required = false)String error) {
		
		List<String> list_coursename = productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list",list_coursename);
		model.addAttribute("modelSaleCourseAttr",new SaleCourse());
		
		model.addAttribute("model_success",success);
		model.addAttribute("model_error",error);
		
		return "sale-course";
	}
	
	@PostMapping("/saleCourseForm")
	public String opensaleCourseForm(@ModelAttribute("modelSaleCourseAttr") SaleCourse saleCourse, HttpSession session, RedirectAttributes redirectAttributes) {
		Employee employee = (Employee)session.getAttribute("session_employee");
		String empemail = employee.getEmail();
		
		LocalDate ld = LocalDate.now();
		String date = ld.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		LocalTime lt = LocalTime.now();
		String time = lt.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		saleCourse.setEmpEmailId(empemail);
		saleCourse.setDate(date);
		saleCourse.setTime(time);
		
		boolean status = productService.addSaleCourseDetailsService(saleCourse);
		if (status) {
			redirectAttributes.addAttribute("redirectAttr_success","Course Sale SuccessFully");
		}
		else {
			redirectAttributes.addAttribute("redirectAttr_error","Course not Sale Due to Some Error");
		}
		
		return "redirect:/saleCourse";
	}
	
	@GetMapping("/getCoursePrices")
	@ResponseBody
	public Product getCoursePrices(@RequestParam("SelectedCourese") String selectCourse){
		
		return productService.getSelectedCourseDetailsService(selectCourse);
	}
}
