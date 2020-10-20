package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.dao.ExamNameEntryDao;
import com.srb.hibernate.ExamNameEntryHibernate;

public class ExamNameEntryHelper {

	public void doExamNameEntry(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String examNameEntry = request.getParameter("examNameEntry");
		
		ExamNameEntryHibernate exname= new ExamNameEntryHibernate();
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateobj = new Date();
		exname.setInsertDate(dateobj);
		exname.setExamNameEntry(examNameEntry);
		
		ExamNameEntryDao dao = new ExamNameEntryDao();
		dao.ExamNameEntryHibernate(exname);
		
	}
}
