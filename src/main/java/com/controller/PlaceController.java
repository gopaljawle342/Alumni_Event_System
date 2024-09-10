package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.model.PlaceModel;
import com.services.PlaceServices;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	PlaceServices ps;	
	@PostMapping
	public String addPlace(PlaceModel pModel ,RedirectAttributes rw) {
		  if(ps.addPlace(pModel)) {
			  rw.addFlashAttribute("msg","Data Added Success....!");
		  }else {
			  rw.addFlashAttribute("msg","Data Not Added");
		  }
		
		
		return "redirect:/place";
		
	}
	
	@GetMapping
	public String getPlace(Model m) {
		
		List<PlaceModel> pList=ps.getPlaces();
		m.addAttribute("plist", pList);
		
		return "place";
	}
	
	@DeleteMapping("/{id}")
	@ResponseBody
	public String isDelete(@PathVariable("id") Integer id) {
		   ps.isDelete(id);
		   
		   List<PlaceModel> pList=ps.getPlaces();
		   Gson gson=new Gson();
		   
       return gson.toJson(pList);
	}
	
	@PostMapping("/update")
	public String updatePlace(PlaceModel pm,RedirectAttributes rw) {
		    if(ps.isUpdate(pm)) {
		    	rw.addFlashAttribute("msg", "data Updated Success");
		    }else {
		    	rw.addFlashAttribute("msg","data not updated");
		    }
		
		return "redirect:/place";
		
		
	}
	
	@GetMapping("/{id}")
	public String getupdate(@PathVariable("id") Integer id,Model m) {
		PlaceModel pModel=ps.getPlaceById(id);
		m.addAttribute("p", pModel);
		System.out.println(pModel.getName());
		return "updateplace";
		
	}
}
