package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.EmployeeLeaveBean;
import com.srb.dao.ExpenditureDetailsDao;
import com.srb.hibernate.ExpenditureDetailsBean;


public class ExpenditureDetailsHelper {

	public void expenseDetails(HttpServletRequest request, HttpServletResponse response) {

		String expenseName = request.getParameter("expenseName");

		ExpenditureDetailsBean bean = new ExpenditureDetailsBean();

		bean.setExpenseName(expenseName);

		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));

		bean.setInsertDate(dateobj);

		ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
		dao.addExpenseDetails(bean);
	}
	
	//List Of Employee Leave
		public List getAllLeaveEmployee(HttpServletRequest request, HttpServletResponse response) 
		{
			Map<Long, EmployeeLeaveBean> map = new HashMap<Long, EmployeeLeaveBean>();
			ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
			List<EmployeeLeaveBean> exp1List = dao.getEmployeeLeaveList();
			
			
			return exp1List;
		}

		
		//expenditure delete  
		public void deleteExpenditure(HttpServletRequest request, HttpServletResponse response ) {
				
				String expenseName = request.getParameter("expenseName");
				   
				ExpenditureDetailsDao dao2 = new ExpenditureDetailsDao();
				dao2.deleteExp(expenseName);
					
				}
		
		
}
