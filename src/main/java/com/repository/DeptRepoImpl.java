package com.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.DepartmentModel;

@Repository
public class DeptRepoImpl implements DeptRepo {

	@Autowired
	JdbcTemplate jt;

	@Override
	public boolean isAddDept(DepartmentModel dm) {
		String sql = "insert into department (dname) values(?)";
		return jt.update(sql, dm.getName().trim()) > 0;
	}

	@Override
	public List<DepartmentModel> getDepartment() {
		String sql = "select * from department order by did";
		return jt.query(sql, new RowMapper<DepartmentModel>() {

			@Override
			public DepartmentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				DepartmentModel dm = new DepartmentModel();
				dm.setId(rs.getInt(1));
				dm.setName(rs.getString(2));
				return dm;
			}

		});
	}

	@Override
	public DepartmentModel getDepartment(int id) {

		return jt.queryForObject("select * from department where did=?", new RowMapper<DepartmentModel>() {

			@Override
			public DepartmentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				DepartmentModel dm = new DepartmentModel();
				dm.setId(rs.getInt(1));
				dm.setName(rs.getString(2));
				return dm;
			}

		}, id);
	}

	@Override
	public List<DepartmentModel> getDepartment(String name) {
		name = "%" + name + "%";
		String sql = "select * from department where dname like ? order by did";
		return jt.query(sql, new RowMapper<DepartmentModel>() {

			@Override
			public DepartmentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				DepartmentModel dm = new DepartmentModel();
				dm.setId(rs.getInt(1));
				dm.setName(rs.getString(2));
				return dm;
			}

		}, name.trim());

	}

	@Override
	public boolean isUpdateDepartment(DepartmentModel dm) {
		String sql = "UPDATE department SET dname = ? where did = ?";

		return jt.update(sql, dm.getName(), dm.getId()) > 0;
	}

	@Override
	public boolean isDeleteDepartment(int id) {
		String sql = "delete from department where did=?";
		return jt.update(sql, id) > 0;

	}

	@Override
	public boolean isdepartment(String name) {

		List<String> list = jt.query("select * from department where dname=?", new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {

				return rs.getString(1);
			}

		}, name.trim());

		if (list.size() > 0)
			return true;

		return false;
	}

	@Override
	public int departmentCount() {

		return jt.queryForObject("select count(did) from department", Integer.class);
	}

}
