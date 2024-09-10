package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.email.SendEmails;
import com.google.gson.Gson;
import com.model.DepartmentModel;
import com.model.PassYearModel;
import com.model.UserModel;
import com.services.DeptService;
import com.services.PassYearService;
import com.services.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	StudentService us;
	
	@Autowired
	DeptService dService;
    
	@Autowired
	PassYearService pService;
	
	
	
	@PostMapping
	public String addUser(@ModelAttribute("UserModel")UserModel um, Model model) {
		        um.setType("student");
		          
		     model.addAttribute("UserModel",um);
		         
             if(us.addStudent(um)) {
            	 model.addAttribute("msg", "Student addes");
            	
             }else {
            	 model.addAttribute("msg", "Student not added");
            	
             }
            List<UserModel> ulist=us.getStudents();
            model.addAttribute("slist", ulist);
             
		return "user";
	}
	
	@PostMapping("/verify")
	public String registerStudent(@RequestParam("otp") String otp,@RequestParam("userid") Integer id,HttpSession session,RedirectAttributes model) {
		try {
		
		String sessionotp=(String) session.getAttribute("otp");
		if(otp.equals(sessionotp)) {
			model.addFlashAttribute("otpstatus", "Otp Verified");
			
			      us.updateStatus(id);
	     UserModel userModel=us.getStudentById(id);
			      model.addFlashAttribute("status","1");
			 SendEmails.sendEmail(userModel.getEmail(), "Import message..........", "You are Successfully Registred ..\n Please login and Explore Application....."); 
			 
		}else {
//			System.out.println("otp is not correct");
			model.addFlashAttribute("msg","1");
			model.addFlashAttribute("otpstatus", "Wrong otp try agian Later");
		}
		
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "redirect:/";
	}
	
	
	@PostMapping("/register")
	public String registerUser(UserModel um, RedirectAttributes model,HttpSession session) {
		try {
			
			System.out.println(um);
		UserModel userModel=us.isStudent(um);
		System.out.println(userModel);
		if(userModel!=null) {
			if(userModel.getStatus()==1)
			{
				model.addFlashAttribute("registred","1");
				SendEmails.sendEmail(um.getEmail(),"Your already Registred...Plese Check Your Details you are not report it...soon ", "Your Username: "+userModel.getEmail()+"\nYour PassWord: "+userModel.getPassword()+"\nYour Conatct:"+userModel.getContact()+"\nYour Department:"+userModel.getDepartment().getName());
				return "redirect:/";
			}else {
				model.addFlashAttribute("msg","1");
			String otpString=SendEmails.getOtp();
			session.setAttribute("otp", otpString);
			SendEmails.sendEmail(um.getEmail(),"Verification otp .....!", "Your One Time Password is : "+otpString);
			session.setAttribute("userid",userModel.getId());
			
			return "redirect:/";
			
			}
		}
		}catch (Exception e) {
			System.err.println(e);
		}
		
		if(us.registerStudent(um)) {
			UserModel userModel1=us.isStudent(um);
			System.out.println(userModel1);
			
			model.addFlashAttribute("msg","1");
			String otpString=SendEmails.getOtp();
			session.setAttribute("otp", otpString);
			SendEmails.sendEmail(um.getEmail(),"Verification otp .....!", "Your One Time Password is : "+otpString);
			session.setAttribute("userid",userModel1.getId());
		}else {
			
			model.addFlashAttribute("msg","0");
		}
		
		
		return "redirect:/";
	}
	
	
	
	@GetMapping
	public String getStudent(Model m) {
		List<DepartmentModel> list = dService.getDepartment();
		m.addAttribute("dlist", list);
		List<PassYearModel> ylist=pService.getPassYears();
		m.addAttribute("y", ylist);
		return "student";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getUserById(@PathVariable("id") Integer id, Model model) {

		return "Student"; 
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String getUpdate(@PathVariable("id") Integer id, Model model) {
		List<DepartmentModel> list = dService.getDepartment();
		model.addAttribute("dlist", list);
		List<PassYearModel> ylist=pService.getPassYears();
		model.addAttribute("y", ylist);
            UserModel userModel=us.getStudentById(id);
            model.addAttribute("user", userModel);
		return "updatestudent"; 
	}
	
	@PostMapping("update/update")
	public String updateStudent(UserModel um,RedirectAttributes rw) {
		    if(us.isUpdate(um)) {
		    	rw.addFlashAttribute("msg","Data Updated Success....!");
		    }else {
		    	rw.addFlashAttribute("msg","Data Updated Success");
		    } 
		    
		    List<UserModel> ulist=us.getStudents();
            rw.addFlashAttribute("slist", ulist);
		    
		return "redirect:/user";
		
	}
 
	@DeleteMapping("/{id}")
	@ResponseBody
	public String deleteUser(@PathVariable("id") Integer id, Model model) {
              us.isDelete(id);
            	Gson gson=new Gson(); 
            	List<UserModel> list=us.getStudents();
              
		return gson.toJson(list); 
	}

}
