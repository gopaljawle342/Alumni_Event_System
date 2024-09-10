package com.repository;

import java.util.List;

import com.model.EventModel;
import com.model.ReviewModel;
import com.model.UserModel;

public interface StudentRepo {
	public boolean addStudent(UserModel um);

	public List<UserModel> getStudent();

	public UserModel getStudentById(int id);

	public UserModel isStudent(UserModel um);

	public boolean isUpdate(UserModel um);
    public List<EventModel> attendEvents(int sid);
	public boolean registerStudent(UserModel um);
	public boolean isDelete(int id);
	public boolean updateStatus(int id);
	public UserModel isLogin(UserModel um);
	public int countStudent();
	public List<UserModel> studentEventWise(int eid); 
	public int getAttendStatus(int eid ,int sid);
	public boolean sendReview(ReviewModel rm);
	public List<ReviewModel> getallReview(int eid);
	 
	
	
	public boolean updateAttendanceStatus(int aid,int eid,int sid);
	

	
}
