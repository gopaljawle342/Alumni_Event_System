package com.model;

public class StudentEventModel {
  private int sid;
  private int eid;
public int getSid() {
	return sid;
}
public void setSid(int sid) {
	this.sid = sid;
}
public int getEid() {
	return eid;
}
public void setEid(int eid) {
	this.eid = eid;
}
@Override
public String toString() {
	return "StudentEventModel [sid=" + sid + ", eid=" + eid + "]";
}
  

}
