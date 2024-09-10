package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.PlaceModel;
import com.model.UserModel;
import com.repository.PlaceRepo;

@Service
public class PlaceServiceImpl implements PlaceServices {

	@Autowired
	PlaceRepo pr;
	
	@Override
	public boolean addPlace(PlaceModel um) {
		// TODO Auto-generated method stub
		return pr.addPlace(um);
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return pr.isDelete(id);
	}

	@Override
	public boolean isUpdate(PlaceModel um) {
		// TODO Auto-generated method stub
		return pr.isUpdate(um);
	}

	@Override
	public PlaceModel getPlaceById(int id) {
		// TODO Auto-generated method stub
		return pr.getPlaceById(id);
	}

	@Override
	public List<PlaceModel> getPlaces() {
		// TODO Auto-generated method stub
		return pr.getPlaces();
	}

}
