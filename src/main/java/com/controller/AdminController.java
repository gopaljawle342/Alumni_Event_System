package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.UserModel;
import com.services.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
	AdminService aService;
    
	@PostMapping
	public String addAdmin(RedirectAttributes m,UserModel um) {
		System.out.println(um);
		  if(aService.addAdmin(um)) {
			  m.addFlashAttribute("msg","User added Success...!");
		  }else {
			  m.addFlashAttribute("msg","user Not Added Please check EMail");
		  }
		  List<UserModel> uList=aService.getAdmins();
		  m.addAttribute("slist", uList);
		  
		return "redirect:/user";
	}
	
}
