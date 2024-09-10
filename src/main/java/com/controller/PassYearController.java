package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.model.PassYearModel;
import com.services.PassYearService;

@Controller
@RequestMapping("/passyear")
public class PassYearController {

	@Autowired
	PassYearService pService;

	@PostMapping
	public String addPassYear(PassYearModel pm,RedirectAttributes rw) {
		  if(pService.addPassYear(pm)) {
			  rw.addFlashAttribute("msg","Pass Year Added Success.....!");
		  }else {
			  rw.addFlashAttribute("msg","Pass Year not added ");
		  }
		  
			
		return "redirect:passyear";
	}
	
	@GetMapping
	public String getPassYear(Model m) {
		List<PassYearModel> list=pService.getPassYears();
		m.addAttribute("plist", list);
		return "passyear";
	}
	
	
	@GetMapping("year/{year}")
	@ResponseBody
	public String getPassYearByName(@PathVariable("year") String name) {
		List<PassYearModel> list=pService.getPassYear(name);
		Gson gs=new Gson();
		return gs.toJson(list);
	}
	
	@GetMapping("update/{id}")
	public String getUpdateForm(@PathVariable("id")Integer id,Model m) {
		PassYearModel pModel =pService.getPassYear(id);
		m.addAttribute("y", pModel);
		return "updateyear";
		
	}
	
	public String getPassYearById() {
		return null;
		
	}
	
	@PostMapping("/update/year")
	public String updatePassYear(PassYearModel pm,RedirectAttributes rw) {
		  if(pService.isUpdate(pm)) {
			  rw.addFlashAttribute("msg","Data Updated Success.....!");
		  }else {
			  rw.addFlashAttribute("msg", "Data Not UpDated ...Try again ");
			  
		  }
		
		return "redirect:/passyear";
		
	}
	
	@DeleteMapping("/{id}")
	@ResponseBody
	public String deletePassYear(@PathVariable("id") Integer id) {
		    pService.isDelete(id);
		    
		return new Gson().toJson(pService.getPassYears());
	}
}
