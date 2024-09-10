package com.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.DepartmentModel;
import com.model.EventModel;
import com.model.PassYearModel;
import com.model.PlaceModel;
import com.model.ReviewModel;
import com.model.UserModel;

@Repository
public class StudentRepoImpl implements StudentRepo {

	@Autowired
	JdbcTemplate jt;

	public JdbcTemplate getJt() {
		return jt;
	}

	public void setJt(JdbcTemplate jt) {
		this.jt = jt;
	}

	@Override
	public boolean isUpdate(UserModel um) {
		
		return jt.update("call updateStudent(?,?,?,?,?,?,?)",um.getId(),um.getFirstname(),um.getLastname(),um.getEmail(),um.getContact(),um.getDepartment().getId(),um.getPass().getId())>0;
	}

	@Override
	public boolean isDelete(int id) {
		
		return jt.update("delete from user where id=?",id)>0 ;
	}

	@Override
	public boolean addStudent(UserModel um) {

		return jt.update("call AddStudent(?,?,?,?,?,?,?,?,?)",um.getFirstname(),um.getLastname(),um.getEmail(),um.getPassword(),um.getContact(),um.getType(),um.getDepartment().getId(),um.getPass().getId(),1)>0;
	}

	@Override
	public List<UserModel> getStudent() {
		
		return jt.query("select * from user",new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel uModel=new UserModel();
				uModel.setId(rs.getInt(1));
				uModel.setFirstname(rs.getString(2));
				uModel.setLastname(rs.getString(3));
				uModel.setEmail(rs.getString(4));
				uModel.setContact(rs.getString(6));
				uModel.setType(rs.getString(7));
				return uModel;
			}
			
		});
	}

	@Override
	public UserModel getStudentById(int id) {
		try {
		return jt.queryForObject("select u.id,u.firstname,u.lastname,u.email,u.contact,u.type,d.did,d.dname,p.id,p.year from user u inner join user_details ud on ud.sid=u.id inner join department d on d.did=ud.did inner join passyear p on p.id=ud.pid where u.id=?", new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel userModel=new UserModel();
				userModel.setId(rs.getInt(1));
				userModel.setFirstname(rs.getString(2));
				userModel.setLastname(rs.getString(3));
				userModel.setEmail(rs.getString(4));
				userModel.setContact(rs.getString(5));
				userModel.setType(rs.getString(6));
				DepartmentModel dModel=new DepartmentModel();
				dModel.setId(rs.getInt(7));
				dModel.setName(rs.getString(8));
				userModel.setDepartment(dModel);
				PassYearModel passYearModel=new PassYearModel();
				passYearModel.setId(rs.getInt(9));
				passYearModel.setYear(rs.getString(10));
				userModel.setPass(passYearModel);
				return userModel;
			}
			
		},id);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	  

	@Override
	public UserModel isStudent(UserModel um) {
		try {
		return jt.query("SELECT u.id, u.firstname, u.lastname, u.email, u.password, u.contact, u.type, d.did, d.dname, p.id AS passyear_id, p.year AS passyear_year, u.status FROM user u LEFT JOIN user_details ud ON ud.sid = u.id LEFT JOIN department d ON d.did = ud.did LEFT JOIN passyear p ON p.id = ud.pid WHERE u.email = ? OR u.contact = ?",new RowMapper<UserModel>(){

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel userModel=new UserModel();
				userModel.setId(rs.getInt(1));
				userModel.setFirstname(rs.getString(2));
				userModel.setLastname(rs.getString(3));
				userModel.setEmail(rs.getString(4));
				userModel.setPassword(rs.getString(5));
				userModel.setContact(rs.getString(6));
				userModel.setType(rs.getString(7));
				DepartmentModel dModel=new DepartmentModel();
				dModel.setId(rs.getInt(8));
				dModel.setName(rs.getString(9));
				userModel.setDepartment(dModel);
				PassYearModel passYearModel=new PassYearModel();
				passYearModel.setId(rs.getInt(10));
				passYearModel.setYear(rs.getString(11));
				userModel.setPass(passYearModel);
				userModel.setStatus(rs.getInt(12));
				return userModel;
			}
			
		},um.getEmail(),um.getContact()).get(0);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	

	@Override
	public boolean registerStudent(UserModel um) {
		
		return jt.update("call AddStudent(?,?,?,?,?,?,?,?,?)",um.getFirstname(),um.getLastname(),um.getEmail(),um.getPassword(),um.getContact(),um.getType(),um.getDepartment().getId(),um.getPass().getId(),0)>0;

	}

	@Override
	public boolean updateStatus(int id) {
		// TODO Auto-generated method stub
		return jt.update("update user set status=1 where id=?",id)>0;
	}

	@Override
	public int countStudent() {
		
		return  jt.query("select * from user where type='student'",new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				               UserModel uModel=new UserModel();
				               uModel.setId(rs.getInt(1));
								return uModel;
			}
			
		}).size();
	}

	@Override
	public UserModel isLogin(UserModel um) {
		  System.out.println(um);
		try {
			return jt.queryForObject("SELECT u.id, u.firstname, u.lastname, u.email, u.contact, u.type, d.did, d.dname, p.id AS passyear_id, p.year AS passyear_year, u.status FROM user u LEFT JOIN user_details ud ON ud.sid = u.id LEFT JOIN department d ON d.did = ud.did LEFT JOIN passyear p ON p.id = ud.pid WHERE u.email = ? AND u.password =?",new RowMapper<UserModel>(){

				@Override
				public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserModel userModel=new UserModel();
					userModel.setId(rs.getInt(1));
					userModel.setFirstname(rs.getString(2));
					userModel.setLastname(rs.getString(3));
					userModel.setEmail(rs.getString(4));
					
					userModel.setContact(rs.getString(5));
					userModel.setType(rs.getString(6));
					DepartmentModel dModel=new DepartmentModel();
					dModel.setId(rs.getInt(7));
					dModel.setName(rs.getString(8));
					userModel.setDepartment(dModel);
					PassYearModel passYearModel=new PassYearModel();
					passYearModel.setId(rs.getInt(9));
					passYearModel.setYear(rs.getString(10));
					userModel.setPass(passYearModel);
					userModel.setStatus(rs.getInt(11));
					return userModel;
				}
				
			},um.getEmail(),um.getPassword());
			} catch (Exception e) {
				System.out.println("login errror "+e);
				return null;
			}
		}

	@Override
	public List<UserModel> studentEventWise(int id) {
		
		return jt.query("select s.id,s.firstname,s.lastname,s.email,s.contact,a.attendance from user s   inner join student_event_attendance a on a.sid=s.id where a.eid=?",new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				   UserModel uModel=new UserModel();
				     uModel.setId(rs.getInt(1));
				     uModel.setFirstname(rs.getString(2));
				     uModel.setLastname(rs.getString(3));
				     uModel.setEmail(rs.getString(4));
				     uModel.setContact(rs.getString(5));
				     uModel.setAttendStatus(rs.getInt(6));
				return uModel;
			}
			
		},id);
	}

	@Override
	public int getAttendStatus(int eid, int sid) {
		
		return jt.queryForObject("select attendance from student_event_attendance where eid=? and sid=?",Integer.class,eid,sid);
	}

	@Override
	public boolean updateAttendanceStatus(int aid, int eid, int sid) {
		// TODO Auto-generated method stub
		return jt.update("update student_event_attendance set attendance=? where eid=? and sid=?",aid,eid,sid)>0;
	}

	@Override
	public List<EventModel> attendEvents(int sid) {
		
		return jt.query("select e.id,e.name,e.pid,e.edate,e.did,e.event_description from organize_event e inner join student_event_attendance sea on sea.eid=e.id where sea.sid=? and sea.attendance=1 ",new RowMapper<EventModel>() {

			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel eventModel=new EventModel();
				eventModel.setId(rs.getInt(1));
				eventModel.setEname(rs.getString(2));
				PlaceModel pModel=new PlaceModel();
				pModel.setId(rs.getInt(3));
				eventModel.setPm(pModel);
				eventModel.setDate(rs.getDate(4));
				DepartmentModel departmentModel=new DepartmentModel();
				departmentModel.setId(rs.getInt(5));
				
				eventModel.setDm(departmentModel);
				eventModel.setDescription(rs.getString(6));
				return eventModel;
			}
			
		},sid);
	}

	@Override
	public boolean sendReview(ReviewModel rm) {
		
		return jt.update("insert into student_event_feedback (eid,sid,comment) values(?,?,?)",rm.getEid(),rm.getSid(),rm.getReview())>0;
	}

	@Override
	public List<ReviewModel> getallReview(int eid) {
		
		return jt.query("select e.id,e.name,s.id,s.firstname,s.lastname,sef.comment,sef.datetime from user s inner join student_event_feedback sef on sef.sid=s.id inner join organize_event e on e.id=sef.eid where sef.eid=? ",new RowMapper<ReviewModel>() {

			@Override
			public ReviewModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				 ReviewModel rModel=new ReviewModel();
				      rModel.setEid(rs.getInt(1));
				      rModel.setEname(rs.getString(2));
				      rModel.setSid(rs.getInt(3));
				      rModel.setSname(rs.getString(4)+" "+rs.getString(5));
				    rModel.setReview(rs.getString(6));
				    rModel.setDatatime(rs.getString(7));
				return rModel;
			}
			
		},eid);
	}

	
		
	

	

}
