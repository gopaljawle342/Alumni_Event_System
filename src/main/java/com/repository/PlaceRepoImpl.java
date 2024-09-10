package com.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.PlaceModel;



@Repository
public class PlaceRepoImpl implements PlaceRepo{

	@Autowired
	JdbcTemplate jt;
	
	@Override
	public boolean addPlace(PlaceModel  pm) {
		
		return jt.update("insert into place values('0',?)",pm.getName())>0;
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return jt.update("delete from place where pid=?",id)>0;
	}

	@Override
	public boolean isUpdate(PlaceModel um) {
		
		return jt.update("update place set pname=? where pid=?",um.getName(),um.getId())>0;
	}

	@Override
	public PlaceModel getPlaceById(int id) {
		
		return jt.query("select * from place where pid=? ",new RowMapper<PlaceModel>() {

			@Override
			public PlaceModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				PlaceModel placeModel=new PlaceModel();
				placeModel.setId(rs.getInt(1));
				placeModel.setName(rs.getString(2));
				return placeModel;
			}
			
		},id).get(0);
	}

	@Override
	public List<PlaceModel> getPlaces() {
		// TODO Auto-generated method stub
		return jt.query("select * from place  ",new RowMapper<PlaceModel>() {

			@Override
			public PlaceModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				PlaceModel placeModel=new PlaceModel();
				placeModel.setId(rs.getInt(1));
				placeModel.setName(rs.getString(2));
				return placeModel;
			}
			
		});
	}


}
