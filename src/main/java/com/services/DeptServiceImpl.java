package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.DepartmentModel;
import com.repository.DeptRepo;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	DeptRepo dr;

	@Override
	public boolean isAddDept(DepartmentModel dm) {
		return dr.isAddDept(dm);
	}

	@Override
	public List<DepartmentModel> getDepartment() {
		// TODO Auto-generated method stub
		return dr.getDepartment();
	}

	@Override
	public DepartmentModel getDepartment(int id) {
		// TODO Auto-generated method stub
		return dr.getDepartment(id);
	}

	@Override
	public boolean isUpdateDepartment(DepartmentModel dm) {
		// TODO Auto-generated method stub
		return dr.isUpdateDepartment(dm);
	}

	@Override
	public boolean isDeleteDepartment(int id) {
		// TODO Auto-generated method stub
		return dr.isDeleteDepartment(id);
	}

	@Override
	public boolean isdepartment(String name) {
		// TODO Auto-generated method stub
		return dr.isdepartment(name);
	}

	@Override
	public List<DepartmentModel> getDepartment(String name) {
		// TODO Auto-generated method stub
		return dr.getDepartment(name);
	}

	@Override
	public int departmentCount() {
		// TODO Auto-generated method stub
		return dr.departmentCount();
	}

}
