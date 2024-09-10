package com.model;

import java.sql.Date;

public class EventModel {
    private int id;
    private String Ename;
    private Date date;
    private DepartmentModel dm;
    private PlaceModel pm;
    private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEname() {
		return Ename;
	}
	public void setEname(String ename) {
		this.Ename = ename;
	}
	public DepartmentModel getDm() {
		return dm;
	}
	public void setDm(DepartmentModel dm) {
		this.dm = dm;
	}
	public PlaceModel getPm() {
		return pm;
	}
	public void setPm(PlaceModel pm) {
		this.pm = pm;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "EventModel [id=" + id + ", Ename=" + Ename + ", date=" + date + ", dm=" + dm + ", pm=" + pm
				+ ", description=" + description + "]";
	}
    
    
    
}
