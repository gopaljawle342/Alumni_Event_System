package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.model.EventModel;
import com.model.ReviewModel;
import com.model.UserModel;
import com.services.EventService;
import com.services.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/alumni")
public class AlumniController {

	@Autowired
	EventService eService;
	
	@Autowired
	StudentService service;
	
	
	@GetMapping("/profile")
	public String getProfile() {
		
		return "student/profile";
	}
	
	
	@GetMapping("/register/{id}")
	public String registerEvent(RedirectAttributes rw,HttpSession session,@PathVariable("id")Integer eid) {
		UserModel userModel=(UserModel) session.getAttribute("user");
		 if(userModel==null) {
			 rw.addFlashAttribute("registerstatus","1");
			   return "redirect:/";
		   }
		System.out.println("User Id"+userModel.getId()+"         event ID"+eid);
		if(userModel!=null) {
		   if(eService.registerStudentEvent(eid,userModel.getId())) {
			    rw.addFlashAttribute("msg", "Registration for Event Success");
		   }else {
			   rw.addFlashAttribute("msg", "Something error");
		   }
		   List<EventModel> eList = eService.eventNotRegistred(userModel.getId());
			rw.addFlashAttribute("elist", eList);
	}
		return "redirect:/alumni";
	}
	
	@PostMapping("/review")
	public String sendreview(RedirectAttributes rw ,ReviewModel rm) {
		      
		if(service.sendReview(rm)) {
			 rw.addFlashAttribute("msg","Review Sended Success...!");   
		}else {
			rw.addFlashAttribute("msg","Review Not Sended");
		}
		 
		return "redirect:/review";
	}
	
	@GetMapping("/review/{id}")
	@ResponseBody
	public List<ReviewModel> getReviews(@PathVariable("id") Integer eid) {
		   List<ReviewModel> rList=service.getallReview(eid);
		  
		   
		return rList;
	}
}
