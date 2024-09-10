package com.model;

public class PassYearModel {
  private int id;
  private String year;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
}
@Override
public String toString() {
	return "PassYearModel [id=" + id + ", name=" + year + "]";
}

  
  
}
