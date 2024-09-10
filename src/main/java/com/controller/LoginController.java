package com.controller;

import java.util.List;

import org.apache.catalina.filters.AddDefaultCharsetFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.DepartmentModel;
import com.model.EventModel;
import com.model.PassYearModel;
import com.model.PlaceModel;
import com.model.UserModel;
import com.oracle.wls.shaded.org.apache.bcel.generic.NEW;
import com.services.AdminService;
import com.services.DeptService;
import com.services.EventService;
import com.services.PassYearService;
import com.services.PlaceServices;
import com.services.StudentService;

import jakarta.mail.Session;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	StudentService us;

	@Autowired
	EventService es;

	@Autowired
	DeptService dService;

	@Autowired
	PassYearService pService;

	@Autowired
	AdminService aService;

	@Autowired
	PlaceServices ps;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model m,HttpSession session) {
		
		if(session.getAttribute("user")!=null) {
			System.out.println("session true");
			UserModel userModel=(UserModel) session.getAttribute("user");
			if(userModel.getType().toLowerCase().equals("student")) {
				return "redirect:/alumni";
			}else {
				System.out.println("Hello");
				return "redirect:/dashboard";
			}
		}
		
		List<DepartmentModel> dList = dService.getDepartment();
		List<PassYearModel> yearModels = pService.getPassYears();
		m.addAttribute("dlist", dList);
		m.addAttribute("y", yearModels);
		List<EventModel> elist=es.getEvents();
		m.addAttribute("elist", elist);
		return "HomePage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(RedirectAttributes  m, UserModel um, HttpSession session) {
		UserModel user = us.isLogin(um);
		System.out.println(um);
		System.out.println(user);
		if (user != null) {
			if (user.getStatus() != 0) {
				int count = dService.departmentCount();
				m.addFlashAttribute("dcount", count);
				int scount = us.countStudent();
				m.addFlashAttribute("scount", scount);
				int acount = aService.adminCount();
				m.addFlashAttribute("acount", acount);
				int ecount = es.getEvents().size();
				m.addFlashAttribute("ecount", ecount);
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(60 *60* 60*24*30);
				if (user.getType().toLowerCase().equals("student")) {
					return "redirect:/alumni";
				} else {

					return "redirect:/dashboard";
				}

			} else {
				m.addFlashAttribute("login", "0");
				return "redirect:/";
			}
		} else {
			m.addFlashAttribute("login", "0");
			return "redirect:/";
		}

	}

	/*
	 * @RequestMapping(value = "/register", method = RequestMethod.POST) public
	 * String registerUser(UserModel um, Model m) {
	 * 
	 * System.out.println(um); if (us.addStudent(um)) { m.addAttribute("msg",
	 * "Login Success"); } else { m.addAttribute("msg",
	 * "Invalid Data Plese Try again "); } return "UserDashBoard"; }
	 */

	@RequestMapping("/user")
	public String userPage(Model m) {
		List<UserModel> ulist = us.getStudents();
		m.addAttribute("slist", ulist);
		return "user";
	}

	@RequestMapping("/event")
	public String eventPage(Model m) {
		List<EventModel> eList = es.getEvents();
		m.addAttribute("elist", eList);
		return "viewevent";
	}

	@RequestMapping("/dashboard")
	public String profilePage(Model m) {
		int count = dService.departmentCount();
		m.addAttribute("dcount", count);
		int scount = us.countStudent();
		m.addAttribute("scount", scount);
		int acount = aService.adminCount();
		m.addAttribute("acount", acount);
		int ecount = es.getEvents().size();
		m.addAttribute("ecount", ecount);
		int compcount=es.completedEvent().size();
		m.addAttribute("compcount", compcount);
		return "dashboard";
	}

	@RequestMapping("/attendance")
	public String attendancePage(Model m,HttpSession session) {
		if(session.getAttribute("user")==null) {
			return "redirect:/";
		}
        List<EventModel> eList=es.completedEvent();
        m.addAttribute("elist",eList);
		
		return "attendance";
	}

	@GetMapping("/admin")
	public String getAdmin(Model m) {

		return "admin";
	}

	@GetMapping("/alumni")
	public String getStudent(Model m,HttpSession session) {
		UserModel userModel=(UserModel) session.getAttribute("user");
		 if(userModel==null) {
			 return "redirect:/";
		   }
		List<EventModel> eList = es.eventNotRegistred(userModel.getId());
		m.addAttribute("elist", eList);
		return "student/studentdashboard";
	}


	@GetMapping("/events")
	public String getEvent(Model m,HttpSession session) {
		UserModel userModel=(UserModel) session.getAttribute("user");
		   if(userModel==null) {
			   return "redirect:/";
		   }
		List<EventModel> eList = es.eventRegistredByStudent(userModel.getId());
		m.addAttribute("elist", eList);
		return "student/event";
	}

	@GetMapping("/profile")
	public String getProfile(Model m) {

		return "student/profile";
	}

	@RequestMapping("/place")
	public String getPlace(Model m) {

		List<PlaceModel> pList = ps.getPlaces();
		m.addAttribute("plist", pList);

		return "place";
	}

	@RequestMapping("/addevent")
	public String getAddEvent(Model m) {
        m.addAttribute("EventModel", new EventModel());
		List<DepartmentModel> dList = dService.getDepartment();
		m.addAttribute("dlist", dList);

		List<PlaceModel> pList = ps.getPlaces();
		m.addAttribute("plist", pList);

		return "addevent";
	}
	
	@RequestMapping("/logout")
	public String logout(Model m,HttpSession session) {
		
	session.removeAttribute("user");
		
		
		return "redirect:/";
	}
	@RequestMapping("/viewattendance")
	public String viewAttendace(Model m,HttpSession session) {
		
		if(session.getAttribute("user")==null) {
			return "redirect:/";
		}
        List<EventModel> eList=es.completedEvent();
        m.addAttribute("elist",eList);
		
		
		return "viewAttendDetails";
	}
	
	@RequestMapping("/review")
	public String review(Model m,HttpSession session) {
		UserModel userModel=(UserModel) session.getAttribute("user");
		if(userModel==null) {
			return "redirect:/";
		}
		
		List<EventModel> eList=us.attendEvents(userModel.getId());
		m.addAttribute("elist",eList);
		m.addAttribute("sid",userModel.getId());
		
		return "student/review";
	}
	
	
	@RequestMapping("/viewReviews")
	public String getreview(Model m) {
		List<EventModel> eList=es.completedEvent();
		  m.addAttribute("elist", eList);
		return "viewReviews";
	}
	
	
	
  
}
