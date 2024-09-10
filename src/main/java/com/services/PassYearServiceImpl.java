package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.PassYearModel;
import com.repository.PassYearRepo;


@Service
public class PassYearServiceImpl implements PassYearService {
     
	@Autowired
	PassYearRepo pRepo;
	
	@Override
	public boolean addPassYear(PassYearModel pm) {
		// TODO Auto-generated method stub
		return pRepo.addPassYear(pm);
	}

	@Override
	public List<PassYearModel> getPassYears() {
		// TODO Auto-generated method stub
		return pRepo.getPassYears();
	}

	@Override
	public PassYearModel getPassYear(int id) {
		// TODO Auto-generated method stub
		return pRepo.getPassYear(id);
	}

	@Override
	public boolean isUpdate(PassYearModel pm) {
		// TODO Auto-generated method stub
		return pRepo.isUpdate(pm);
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return pRepo.isDelete(id);
	}

	@Override
	public List<PassYearModel> getPassYear(String name) {
		// TODO Auto-generated method stub
		return pRepo.getPassYear(name);
	}

	
}
