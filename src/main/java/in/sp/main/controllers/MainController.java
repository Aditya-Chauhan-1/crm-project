package in.sp.main.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.Employee;
import in.sp.main.service.EmpService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {
	
	@Autowired
	EmpService empService;

	@GetMapping("/")
	public String openIndexPage() {

		return "index";
	}

	@GetMapping("/home")
	public String openHomePage() {

		return "index";
	}

	@GetMapping("/login")
	public String openLoginPage() {
		return "login";
	}

	int PAGE_SIZE = 5;
	@GetMapping("/b")
	public String openEmpListPage(Model model,
			@RequestParam(name = "redirect_success", required = false) String success,
			@RequestParam(name = "redirect_error", required = false) String error,
			@RequestParam(defaultValue = "1") int page) {
		
		List<Employee> list_emp = empService.getAllEmployeService();
		
		int TOTAL_PRODUCTS = list_emp.size();
		int TOTAL_PAGE = (int) Math.ceil((double)TOTAL_PRODUCTS/PAGE_SIZE);
		int LIST_START_INDEX = (page-1)*PAGE_SIZE;
		int LIST_END_INDEX = Math.min(LIST_START_INDEX+PAGE_SIZE,TOTAL_PRODUCTS);
		
		List<Employee> new_list_emp = list_emp.subList(LIST_START_INDEX, LIST_END_INDEX);
		

		model.addAttribute("model_emplist",new_list_emp);
		model.addAttribute("model_total_pages",TOTAL_PAGE);
		model.addAttribute("model_current_page",page);
		
		model.addAttribute("model_success",success);
		model.addAttribute("model_error",error);
		
		return "employees-list";
	}

	@GetMapping("/profileAdmin")
	public String openAdmiProfilePage() {
		return "profile-admin";
	}

	@PostMapping("/loginForm")
	public String loginForm(@RequestParam("email") String myemail, @RequestParam("password") String mypass, Model model,HttpSession session) {
		String page = "login";

		if (myemail.equals("admin@gmail.com") && mypass.equals("admin123"))
		{
			page = "profile-admin";
		} 
		else {
			Employee emp = empService.authenticate(myemail);
			if (emp != null && emp.getPassword().equals(mypass)) {
				session.setAttribute("session_employee", emp);
				page = "home-employee";
			}
			else {
				model.addAttribute("model_error", "Email id and Password didnt matched");
				page = "login";
			}
		}

		return page;
	}

	@GetMapping("/addEmployee")
	public String openAddEmployee(Model model) {
		model.addAttribute("modelEmplAttr",new Employee());
		return "add-employee";
	}

	@PostMapping("/addEmpForm")
	public String addEmployeForm(@Valid @ModelAttribute("modelEmplAttr") Employee emp,BindingResult br,Model model) {
		
		if (!br.hasErrors()) {
			boolean status = empService.addEmployeeService(emp);
			if (status) {
				model.addAttribute("model_succes","Employee Added Successfully");
			}
			else {
				model.addAttribute("model_errors","Employee not Added due to some error");
			}
			emp.setName("");
			emp.setEmail("");
			emp.setPassword("");
			emp.setPhoneno("");
		}
			
		return "add-employee";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "login";
	}
	
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("empEmail") String email,RedirectAttributes redirectAttributes) {
		
		boolean status = empService.deleteEmployee(email);
		if (status) {
			redirectAttributes.addAttribute("redirect_success","Employee Deleted Successfully");
		}
		else {
			redirectAttributes.addAttribute("redirect_error","Employee not Deleted due to some error");
		}
		
		return "redirect:/b";
	}
	
	@GetMapping("/editEmployee")
	public String openEditEmployeePage(@RequestParam("empEmail") String email,Model model) {
		
		Employee emp = empService.authenticate(email);
		model.addAttribute("modelEmplAttr",new Employee());
		model.addAttribute("model_emp",emp);
		
		return "edit-employee";
	}
	
	@PostMapping("/updateEmpForm")
	public String updateEmployeForm(@Valid @ModelAttribute("modelEmplAttr") Employee emp,BindingResult br,Model model) {
		
		if (!br.hasErrors()) {
			boolean status = empService.updateEmployeeService(emp);
			if (status) {
				model.addAttribute("model_succes","Employee updated Successfully");
			}
			else {
				model.addAttribute("model_errors","Employee not updated due to some error");
			}
		}
			
		return "edit-employee";
	}
	
	@GetMapping("/profileEmployee")
	public String openEmployeProfile() {
		
		return "profile-employee";
	}
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/homeemployee")
	public String openEmployeHome(Model model) {
		
		List<Object[]> list = productService.getPurchasedCourseCountSrevice();
		
		model.addAttribute("model_count_course_sale",list);
		
		return "home-employee";
	}
	
	
}