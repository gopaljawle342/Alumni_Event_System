package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.email.SendEmails;
import com.model.UserModel;
import com.repository.AdminRepo;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminRepo aRepo;
	
	@Override
	public boolean addAdmin(UserModel um) {
		boolean result=aRepo.addAdmin(um);
		if(result && um.getType().toLowerCase().equals("admin")) {
			SendEmails.sendEmail(um.getEmail(),"Congratulation for get connect with us .....","Hii  "+um.getFirstname()+
					" \n Hello your assign as admin at alumni event \n your username :"+um.getEmail()+"\n your password is : "+um.getPassword()+"\n Update your Password \n Thank You"); 
			
		}else if(result && um.getType().toLowerCase().equals("subadmin")){
			SendEmails.sendEmail(um.getEmail(),"Congratulation for get connect with us .....","Hii  "+um.getFirstname()+
					" \n Hello your assign as SubAdmin at alumni event \n your username :"+um.getEmail()+"\n your password is : "+um.getPassword()+"\n Update your Password \n Thank You");
		}
		
		
		return result;
	}

	@Override
	public List<UserModel> getAdmins() {
		// TODO Auto-generated method stub
		return aRepo.getAdmins();
	}

	@Override
	public UserModel getAdminById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAdmin(UserModel um) {
		// TODO Auto-generated method stub
		return aRepo.isAdmin(um);
	}

	@Override
	public boolean isUpdate(UserModel um) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int adminCount() {
		// TODO Auto-generated method stub
		return aRepo.adminCount();
	}

}
