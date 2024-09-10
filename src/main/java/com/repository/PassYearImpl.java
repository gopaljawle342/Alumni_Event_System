package com.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.PassYearModel;


@Repository
public class PassYearImpl implements PassYearRepo {
 
	@Autowired
	JdbcTemplate jt;
	
	@Override
	public boolean addPassYear(PassYearModel pm) {
		
		return jt.update("insert into passyear values('0',?)",pm.getYear())>0;
	}

	@Override
	public List<PassYearModel> getPassYears() {
		
		return jt.query("select * from passyear",new RowMapper<PassYearModel>() {

			@Override
			public PassYearModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				PassYearModel pModel=new PassYearModel();
				pModel.setId(rs.getInt(1));
				pModel.setYear(rs.getString(2));
				return pModel;
			}
			
		});
	}

	@Override
	public PassYearModel getPassYear(int id) {
		
		return jt.queryForObject("select *from passyear where id=?",new RowMapper<PassYearModel>() {

			@Override
			public PassYearModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				PassYearModel pModel=new PassYearModel();
				pModel.setId(rs.getInt(1));
				pModel.setYear(rs.getString(2));
				return pModel ;
			}
			
		},id);
	}
	

	@Override
	public boolean isUpdate(PassYearModel pm) {
		
		return jt.update("update passyear set year=? where id=?",pm.getYear(),pm.getId())>0;
	}

	@Override
	public boolean isDelete(int id) {
		
		return jt.update("delete from passyear where id=?",id)>0;
	}

	@Override
	public List<PassYearModel> getPassYear(String name) {
		name="%"+name+"%";
		return jt.query("select *from passyear where year like ? ",new RowMapper<PassYearModel>() {

			@Override
			public PassYearModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				PassYearModel pModel=new PassYearModel();
				pModel.setId(rs.getInt(1));
				pModel.setYear(rs.getString(2));
				return pModel ;
			}
			
		},name);
	}

	

}
