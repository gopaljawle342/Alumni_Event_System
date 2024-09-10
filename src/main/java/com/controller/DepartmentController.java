package com.controller;

import java.util.List;
import com.google.gson.Gson;
import com.google.gson.annotations.JsonAdapter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.DepartmentModel;
import com.services.DeptService;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@Autowired
	DeptService deptService;

	@PostMapping
	public String addDepartment(DepartmentModel dm, RedirectAttributes rw) {

		System.out.println(dm);
		if (!deptService.isdepartment(dm.getName())) {
			if (deptService.isAddDept(dm)) {
				rw.addFlashAttribute("msg", "Department Added Success");

			} else {
				rw.addFlashAttribute("msg", "Department not addesd...!");
			}
			List<DepartmentModel> list = deptService.getDepartment();
			rw.addFlashAttribute("dlist", list);
		} else {
			rw.addFlashAttribute("msg", "data Already present");
		}
		return "redirect:department";
	}

	@GetMapping
	public ModelAndView getDepartment(ModelAndView m) {
		List<DepartmentModel> list = deptService.getDepartment();
		m.addObject("dlist", list);
		m.setViewName("department");
		return m;
	}

	@GetMapping("/update/{id}")
	public String getUpdateDepartment(@PathVariable("id") Integer id, RedirectAttributes rw) {
		DepartmentModel dModel = deptService.getDepartment(id);
		rw.addFlashAttribute("dept", dModel);
		return "redirect:/department/updateDepartment";
	}

	@GetMapping("/updateDepartment")
	public String getDepartment() {

		return "updateDepartment";
	}

	@PostMapping("/update")
	public String updateDepartment(DepartmentModel dm, RedirectAttributes rw) {
		if (deptService.isUpdateDepartment(dm)) {
			rw.addFlashAttribute("msg", "Data Updated Success");
		} else {
			rw.addFlashAttribute("msg", "data Not Updated");
		}
		List<DepartmentModel> list = deptService.getDepartment();
		rw.addFlashAttribute("dlist", list);
		return "redirect:/department";
	}

	@GetMapping("/name/{name}")
	@ResponseBody
	public String getDepartmentByName(@PathVariable("name") String name, RedirectAttributes rw) {
		List<DepartmentModel> list = deptService.getDepartment(name);
		System.out.println(list);
		Gson gson = new Gson();

		return gson.toJson(list);
	}

	/* @DeleteMapping("/{id}") */
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteDepartment(@PathVariable("id") Integer id, RedirectAttributes rw) {

		
				deptService.isDeleteDepartment(id);
				List<DepartmentModel> list = deptService.getDepartment();
		return new Gson().toJson(list);
	}
}
