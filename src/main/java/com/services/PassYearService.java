package com.services;

import java.util.List;

import com.model.PassYearModel;

public interface PassYearService {

	public boolean addPassYear(PassYearModel pm);
	public List<PassYearModel> getPassYears();
	public PassYearModel getPassYear(int id);
	public List<PassYearModel> getPassYear(String name);
	public boolean isUpdate(PassYearModel pm );
	public boolean isDelete(int id);
}
