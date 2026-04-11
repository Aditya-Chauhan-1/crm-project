package in.sp.main.controllers;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.entity.CustEnquiry;
import in.sp.main.entity.CustFollowUp;
import in.sp.main.entity.Employee;
import in.sp.main.model.CustEnquiryModel;
import in.sp.main.service.CustEnquiryService;
import in.sp.main.service.CustFollowupService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller 
class CustEnquiryController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CustEnquiryService custEnquiryService;
	
	@Autowired
	CustFollowupService custFollowupService;
	
	@GetMapping("/customerEnquiryPage")
	public String openCustomerEnquiryPage(Model model,@RequestParam(name = "redirect_success",required = false) String success,@RequestParam(name = "redirect_error",required = false) String error) {
		
		List<String> list_coursename = productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list",list_coursename);
		
		model.addAttribute("modelCustEnquiryAttr",new CustEnquiryModel());
		
		model.addAttribute("model_success",success);
		model.addAttribute("model_error",error);
		
		return "customer-enquiry";
	}
	
	@PostMapping("/custEnquiryForm")
	public String opencustomerEnquiryForm(RedirectAttributes redirectAttributes, HttpSession session, @ModelAttribute("modelCustEnquiryAttr") CustEnquiryModel custEnquiryModel) {
		
		LocalDate date = LocalDate.now();
		String date1 = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		LocalTime time = LocalTime.now();
		String time1 = time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		
		Employee employee = (Employee) session.getAttribute("session_employee");
		String empEmail = "";
		if (employee != null) {
			empEmail = employee.getEmail();
		}
		
		String phoneno = custEnquiryModel.getPhoneno();
		
		CustEnquiry custEnquiry = custEnquiryModel.getCustEnquiry();
		custEnquiry.setPhoneno(phoneno);
		custEnquiry.setEnquirydate(date1);
		custEnquiry.setEnquirytime(time1);
		custEnquiry.setEmpemail(empEmail);
		
		CustFollowUp custFollowUp = custEnquiryModel.getCustFollowUp();
		custFollowUp.setPhoneno(phoneno);
		
		boolean status1 = custEnquiryService.addCustEnquiryDetailsService(custEnquiry);
		boolean status2 = custFollowupService.addCustFollowupDateService(custFollowUp);
		
		if (status1 && status2) {
			redirectAttributes.addAttribute("redirect_success","Customer Inquery Details Added SuccessFully");
		}
		else {
			redirectAttributes.addAttribute("redirect_error","Customer Inquery Details not added due to some error");
		}
		
		return "redirect:/customerEnquiryPage";
	}
	
	@GetMapping("/customerFollowUpPage")
	public String openCustomerFollowUpPage(Model model, @RequestParam(name ="selectedDate",required = false) String selectedDate) {
		
		if (selectedDate != null) {
			
			List<CustFollowUp> custFollowUps_list = custFollowupService.getCustFollowUpForProvidedDate(selectedDate);
			model.addAttribute("model_followups",custFollowUps_list);
			
		} 
		else {
			LocalDate ld = LocalDate.now();
			String date = ld.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			
			List<CustFollowUp> custFollowUps_list = custFollowupService.getCustFollowUpForProvidedDate(date);
			model.addAttribute("model_followups",custFollowUps_list);
		}
		
		return "customer-followup";
	}
	
	@GetMapping("/checkPhoneNumberAvailability")
	@ResponseBody
	public String checkPhoneNumber(@RequestParam("phoneNumber") String phoneno) {
		
		boolean status = custEnquiryService.isPhoneNumberExists(phoneno);
		if (status) {
			return "exists";
		}
		
		return "not_exists";
	}
	
	@GetMapping("/custEnquiryHistoryPage")
	public String openCustEnquiryHistoryPage(@RequestParam("phno") String phoneno, Model model) {
		
		List<CustEnquiry> list_custenq = custEnquiryService.getCustAllEnquiryHistory(phoneno);
		model.addAttribute("model_custenq",list_custenq);
		
		model.addAttribute("modelCustEnquiryAttr",new CustEnquiryModel());
		
		List<String> list_coursename = productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list",list_coursename);
		
		return "custenq-history";
	}
}
