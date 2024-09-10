package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.DepartmentModel;
import com.services.DeptService;
import com.services.EventService;

@Controller
@RequestMapping("/oevent")
public class OrgniseEvent {

	@Autowired
	DeptService dService;

}
