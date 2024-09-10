package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.email.SendEmails;
import com.model.EventModel;
import com.model.ReviewModel;
import com.model.UserModel;
import com.repository.StudentRepo;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentRepo ur;

	

	@Override
	public boolean isUpdate(UserModel um) {
		// TODO Auto-generated method stub
		return ur.isUpdate(um);
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return ur.isDelete(id);
	}

	@Override
	public boolean addStudent(UserModel um) {
		       boolean send=ur.addStudent(um);
		       String title="Congratulattion to join our alumni event";
		       String msg="Hello "+um.getFirstname()+",\n You are added by admin  \nyour username   :"+um.getEmail()+"\n your password:"+um.getPassword()+"\n please Login and Verify your details and Update password  \n Thank you......";
		       if(send) {
		    	  SendEmails.sendEmail(um.getEmail(), title, msg);
		       }
		return send;
	}

	@Override
	public List<UserModel> getStudents() {
		
		return ur.getStudent();
	}

	@Override
	public UserModel getStudentById(int id) {
		
		return ur.getStudentById(id);
	}

	@Override
	public UserModel isStudent(UserModel um) {
		
		return ur.isStudent(um);
	}

	@Override
	public boolean registerStudent(UserModel um) {
	
		return ur.registerStudent(um);
	}

	@Override
	public boolean updateStatus(int id) {
		
		return ur.updateStatus(id);
	}

	@Override
	public int countStudent() {
		
		return ur.countStudent();
	}

	@Override
	public UserModel isLogin(UserModel um) {
		
		return ur.isLogin(um);
	}

	@Override
	public List<UserModel> studentEventWise(int eid) {
		
		return ur.studentEventWise(eid);
	}

	@Override
	public int getAttendStatus(int eid,int sid) {
		// TODO Auto-generated method stub
		return ur.getAttendStatus(eid,sid);
	}

	@Override
	public boolean updateAttendanceStatus(int aid, int eid, int sid) {
		// TODO Auto-generated method stub
		return ur.updateAttendanceStatus(aid, eid, sid);
	}

	@Override
	public List<EventModel> attendEvents(int sid) {
		
		return ur.attendEvents(sid);
	}

	@Override
	public boolean sendReview(ReviewModel rm) {
		
		return ur.sendReview(rm);
	}

	@Override
	public List<ReviewModel> getallReview(int eid) {
		
		return ur.getallReview(eid);
	}

}
