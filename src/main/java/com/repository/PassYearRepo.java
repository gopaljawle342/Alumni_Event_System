package com.repository;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.model.PassYearModel;

public interface PassYearRepo {
	
	  
	
	public boolean addPassYear(PassYearModel pm);
	public List<PassYearModel> getPassYears();
	public PassYearModel getPassYear(int id);
	public List<PassYearModel> getPassYear(String name);
	public boolean isUpdate(PassYearModel pm );
	public boolean isDelete(int id);
	
	

}
