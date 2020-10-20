package com.srb.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.dao.userDetailsDao;
import com.srb.hibernate.UserDetailsBean;


import java.util.List;

public class UserDetailsHelper {
	public void userDetails(HttpServletRequest request,
			HttpServletResponse response) {

		
		Long Userid=1001l;
		
		userDetailsDao dao=new userDetailsDao();
		List listtxid=dao.getUserId();
		
		if(listtxid.size()<=0)
		{
			Userid=1l;
		}
		else
		{
		for (int i = 0; i < listtxid.size(); i++) {
			
			UserDetailsBean bean=(UserDetailsBean) listtxid.get(i);
			Userid=bean.getUser_id();
			Userid++;
			
		}
	}
		
		
		
		String address1 = request.getParameter("address1");
		String contactNo = request.getParameter("contactNo");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String pan = request.getParameter("pan");
		String city = request.getParameter("city");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("password2");
		String typeId = request.getParameter("typeId");

		UserDetailsBean udb = new UserDetailsBean();

		if(!"".equals(contactNo)){
			udb.setContactNo(Long.parseLong(contactNo));
		} else
		{
			udb.setContactNo(Long.parseLong("00"));
		}

		udb.setUser_id(Userid);
		udb.setFirstName(firstName);
		udb.setLastName(lastName);
		udb.setAddress1(address1);
		udb.setCity(city);
		udb.setPan(pan);
		udb.setUserName(userName);
		udb.setPassword(password);
		udb.setTypeId(typeId);

		if(rePassword == null){
			udb.setRePassword("N/A");
		}
		else{
			udb.setRePassword(rePassword);
		}
		userDetailsDao udd = new userDetailsDao();
		udd.addUser(udb);
	}

	public List getAlluserName()
	{
		userDetailsDao dao = new userDetailsDao();
		return dao.getAllUsers();
	}
}
