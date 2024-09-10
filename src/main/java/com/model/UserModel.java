package com.model;

public class UserModel {
	private int id;
	private String firstname;
	private String lastname;
	private String email;
	private String password;
	private DepartmentModel department;
	private PassYearModel pass;
	private String contact;
	private String type;;
	private int status;
	private int attendStatus;

	

	public UserModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserModel(int id, String firstname, String lastname, String email, String password, String contact,
			String type) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.password = password;
		this.contact = contact;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public DepartmentModel getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentModel department) {
		this.department = department;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	public PassYearModel getPass() {
		return pass;
	}

	public void setPass(PassYearModel pass) {
		this.pass = pass;
	}
	

	public int getStatus() {
		return status;
	}
	

	public void setStatus(int status) {
		this.status = status;
	}
	public int getAttendStatus() {
		return attendStatus;
	}

	public void setAttendStatus(int attendStatus) {
		this.attendStatus = attendStatus;
	}

	@Override
	public String toString() {
		return "UserModel [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email
				+ ", password=" + password + ", department=" + department + ", pass=" + pass + ", contact=" + contact
				+ ", type=" + type + "]";
	}
}