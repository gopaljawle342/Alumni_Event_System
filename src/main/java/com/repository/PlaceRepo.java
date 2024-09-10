package com.repository;

import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import com.model.PlaceModel;
import com.model.UserModel;

public interface PlaceRepo {

	public boolean addPlace(PlaceModel um);
	public boolean isDelete(int id);
	public boolean isUpdate(PlaceModel um);
	public PlaceModel getPlaceById(int id);
	public List<PlaceModel> getPlaces();
}
