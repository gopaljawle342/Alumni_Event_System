package com.repository;

import java.util.List;

import com.model.EventModel;

public interface EventRepo {
   public boolean addEvent(EventModel em);
   public boolean isUpdate(EventModel em);
   public List<EventModel> getEvents();
   public EventModel getEventById(int id);
   public boolean isDelete(int id);
   public boolean registerStudentEvent(int sid,int eid);
   public List<EventModel> eventNotRegistred(int sid);
   public List<EventModel> eventRegistredByStudent(int sid);
   public List<EventModel> completedEvent();
   
   
}
