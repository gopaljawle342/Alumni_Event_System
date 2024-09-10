package com.services;

import java.util.List;

import com.model.DepartmentModel;

public interface DeptService {
	public boolean isAddDept(DepartmentModel dm);

	public boolean isdepartment(String name);

	public List<DepartmentModel> getDepartment();

	public DepartmentModel getDepartment(int id);

	public boolean isUpdateDepartment(DepartmentModel dm);

	public boolean isDeleteDepartment(int id);

	public List<DepartmentModel> getDepartment(String name);

	public int departmentCount();
}
