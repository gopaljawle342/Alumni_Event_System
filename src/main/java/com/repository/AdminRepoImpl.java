package com.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.UserModel;


@Repository
public class AdminRepoImpl  implements AdminRepo{

	@Autowired
	JdbcTemplate jt;	
	
	@Override
	public boolean addAdmin(UserModel um) {
		
		return jt.update("insert into user values('0',?,?,?,?,?,?)",um.getFirstname(),um.getLastname(),um.getEmail(),um.getPassword(),um.getContact(),um.getType())>0;
				
	}

	@Override 
	public List<UserModel> getAdmins() {
		
		return jt.query("select * from user",new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel uModel=new UserModel();
				uModel.setId(rs.getInt(1));
				uModel.setFirstname(rs.getString(2));
				uModel.setLastname(rs.getString(3));
				uModel.setEmail(rs.getString(4));
				uModel.setPassword(rs.getString(5));
				uModel.setContact(rs.getString(6));
				uModel.setType(rs.getString(7));
				return uModel;
			}
			
			
		});
	}

	@Override
	public UserModel getAdminById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAdmin(UserModel um) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isUpdate(UserModel um) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int adminCount() {
	
		return jt.query("select * from user where type='admin' or type='subadmin' ",new RowMapper<UserModel>() {

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel uModel=new UserModel();
				uModel.setId(rs.getInt(1));
				
				return uModel;
			}
			
			
		}).size();
	}

}
