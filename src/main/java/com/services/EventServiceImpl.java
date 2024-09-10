package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.EventModel;
import com.repository.EventRepo;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventRepo er;
	@Override
	public boolean addEvent(EventModel em) {
		// TODO Auto-generated method stub
		return er.addEvent(em);
	}

	@Override
	public boolean isUpdate(EventModel em) {
		// TODO Auto-generated method stub
		return er.isUpdate(em);
	}

	@Override
	public List<EventModel> getEvents() {
		// TODO Auto-generated method stub
		return er.getEvents();
	}

	@Override
	public EventModel getEventById(int id) {
		// TODO Auto-generated method stub
		return er.getEventById(id);
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return er.isDelete(id);
	}

	@Override
	public boolean registerStudentEvent(int sid, int eid) {
		// TODO Auto-generated method stub
		return er.registerStudentEvent(sid, eid);
	}

	@Override
	public List<EventModel> eventNotRegistred(int sid) {
		// TODO Auto-generated method stub
		return er.eventNotRegistred(sid);
	}

	@Override
	public List<EventModel> eventRegistredByStudent(int sid) {
		// TODO Auto-generated method stub
		return er.eventRegistredByStudent(sid);
	}

	@Override
	public List<EventModel> completedEvent() {
		// TODO Auto-generated method stub
		return er.completedEvent();
	}

}
