package com.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.model.DepartmentModel;
import com.model.EventModel;
import com.model.PlaceModel;
import com.services.DeptService;
import com.services.EventService;
import com.services.PlaceServices;

@Controller
@RequestMapping("/event")
public class EventController {
  
	@Autowired
	DeptService dService;
	
	@Autowired
	PlaceServices ps;
	
	@Autowired
	EventService es;
	
	
	@PostMapping
	public String addEvent(@ModelAttribute("EventModel") EventModel em,RedirectAttributes rw) {
		
		  if(es.addEvent(em)) { 
			  rw.addFlashAttribute("msg","Data Added Success");
		  
		  }else
		  { rw.addFlashAttribute("msg","data not added"); }
		 
		    
		    List<EventModel> eList=es.getEvents();
		 rw.addFlashAttribute("elist", eList);
		return "redirect:/event";
	}
	
	@PostMapping("/update")
	public String updateEvent(EventModel em,RedirectAttributes rw) {
		 
		  if(es.isUpdate(em)) {
			  rw.addFlashAttribute("msg","Data Updated success....!");
		  }else {
			  rw.addFlashAttribute("msg","Data Not Updated");
		  }
		  List<EventModel> eList=es.getEvents();
			 rw.addFlashAttribute("elist", eList);
		
		return "redirect:/event";
		  
	}
	
	
	@DeleteMapping("/{id}")
	@ResponseBody
	public String deleteEvent(@PathVariable("id") Integer id)
	{            es.isDelete(id);
	      List<EventModel> eList=es.getEvents();
	      Gson gson=new Gson();
		
		return gson.toJson(eList);
	}
	
	
	@GetMapping("/{id}")
	public String getUpdateForm(@PathVariable("id") Integer id,Model m) {
		     EventModel eModel=es.getEventById(id);
		     m.addAttribute("event", eModel);
		     
		     List<DepartmentModel> list = dService.getDepartment();
				m.addAttribute("dlist", list);
				List<PlaceModel> pList=ps.getPlaces();
				m.addAttribute("plist", pList);
		return "updateEvent";
	}
	
	
}

