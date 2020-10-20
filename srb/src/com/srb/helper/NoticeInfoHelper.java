package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.dao.NoticeInfoDao;
import com.srb.hibernate.NoticeInfoHibernate;
import com.srb.hibernate.TeacherInfoHibernate;
import com.srb.utility.HibernateUtility;

public class NoticeInfoHelper {

	public void doNoticeInfoHelper(HttpServletRequest request,
			HttpServletResponse response) {
	
	String className = request.getParameter("className");
	String division = request.getParameter("division");
	String academicYear = request.getParameter("academicYear");
	String task = request.getParameter("task");
	String fkDivisionId = request.getParameter("fkDivisionId");
	String fkClassId = request.getParameter("fkClassId");
	String noticeDate = request.getParameter("noticeDate");
	
	NoticeInfoHibernate nif = new NoticeInfoHibernate();
	
	System.out.println(" date before parsing" +noticeDate);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date dateOfBirth = null;
	
	try{
		dateOfBirth = format.parse(noticeDate);
		nif.setNoticeDate(dateOfBirth);
		System.out.println(" date dateOfBirth parsing" +dateOfBirth);
	}
	catch(Exception e){
		e.printStackTrace();
		System.out.println("Exception in date parsing");
	}
	
	nif.setClassName(className);
	nif.setDivision(division);
	nif.setAcademicYear(academicYear);
	nif.setTask(task);
	nif.setFkClassId(Long.parseLong(fkClassId));
	nif.setFkDivisionId(Long.parseLong(fkDivisionId));
	Date date = new Date();
	nif.setNoticeDate(date);
	
	NoticeInfoDao dao = new NoticeInfoDao();
	dao.NoticeInfoHibernate(nif);
}
//
	
	public void editNotice(HttpServletRequest request,HttpServletResponse response) {
	
	String className = request.getParameter("className");
	String division = request.getParameter("division");
	String academicYear = request.getParameter("academicYear");
	String task = request.getParameter("task");
	String fkDivisionId = request.getParameter("fkDivisionId");
	String fkClassId = request.getParameter("fkClassId");
	String noticeDate = request.getParameter("noticeDate");
	String pkid = request.getParameter("pkid");
	Long pkid1 = Long.parseLong(pkid);

	
	
	com.srb.utility.HibernateUtility hbu=null;
	Session session = null;
	Transaction transaction = null;
	
	 hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	 transaction = session.beginTransaction();


	
	 NoticeInfoHibernate nif = (NoticeInfoHibernate) session.load(NoticeInfoHibernate.class, pkid1);
	
	System.out.println(" date before parsing" +noticeDate);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date dateOfBirth = null;
	
	try{
		dateOfBirth = format.parse(noticeDate);
		nif.setNoticeDate(dateOfBirth);
		System.out.println(" date dateOfBirth parsing" +dateOfBirth);
	}
	catch(Exception e){
		e.printStackTrace();
		System.out.println("Exception in date parsing");
	}
	
	nif.setClassName(className);
	nif.setDivision(division);
	nif.setAcademicYear(academicYear);
	nif.setTask(task);
	nif.setFkClassId(Long.parseLong(fkClassId));
	nif.setFkDivisionId(Long.parseLong(fkDivisionId));
	Date date = new Date();
	nif.setNoticeDate(date);
	
    session.saveOrUpdate(nif);
		transaction.commit();

}
}
