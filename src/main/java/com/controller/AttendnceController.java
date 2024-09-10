package com.controller;

import java.util.List;

import javax.swing.text.StyleContext.SmallAttributeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.model.StudentEventModel;
import com.model.UserModel;
import com.services.StudentService;

@Controller
@RequestMapping("/attendance")
public class AttendnceController {
   
	@Autowired
	StudentService service;
	
	@GetMapping("/{id}")
	@ResponseBody
	public String getStudentEvent(@PathVariable("id")Integer id) {
		List<UserModel> list=service.studentEventWise(id);
		Gson gson=new Gson();
		
		return gson.toJson(list);
		
	}
	
	@PostMapping("/mark")
	@ResponseBody
	public String updateAttendance(@RequestBody StudentEventModel sem) {
		    int status=service.getAttendStatus(sem.getEid(),sem.getSid());
		    if(status==0) {
		    	status=1;
		    }else {
		    	status=0;
		    }
		     service.updateAttendanceStatus(status, sem.getEid(),sem.getSid());
		     
		     List<UserModel> list=service.studentEventWise(sem.getEid());
				Gson gson=new Gson();
				
				return gson.toJson(list);
		
	}
	
}
