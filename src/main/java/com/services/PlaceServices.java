package com.services;

import java.util.List;

import com.model.PlaceModel;
import com.model.UserModel;

public interface PlaceServices {

	public boolean addPlace(PlaceModel um);
	public boolean isDelete(int id);
	public boolean isUpdate(PlaceModel um);
	public PlaceModel getPlaceById(int id);
	public List<PlaceModel> getPlaces();
}
