package com.srb.helper;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetTeacherDetailBean;
import com.srb.dao.SubjectInfoDao;
import com.srb.dao.TeacherDailyTaskEntryDao;
import com.srb.hibernate.ExamInfoHibernate;
import com.srb.hibernate.HomeWorkTeacherDailyTaskEntryHibernate;
import com.srb.hibernate.TeacherDailyTaskEntryHibernate;
import com.srb.utility.HibernateUtility;

public class TeacherDailyTaskEntryHelper {

	public void addTeacherTask(HttpServletRequest request,
			HttpServletResponse response) {
		
		String className = request.getParameter("className");
		String division = request.getParameter("division");
		String subject = request.getParameter("subject");
		String teacherName = request.getParameter("teacherName");
		String academicYear = request.getParameter("academicYear");
		String task = request.getParameter("task");
		String fkDivisionId = request.getParameter("fkDivisionId");
		String fkteacherid = request.getParameter("fkteacherid");
		String fkClassId = request.getParameter("fkClassId");
		String taskImage = request.getParameter("taskImage");
		
		//System.out.println("taskImage ===========+ ====="+taskImage);
		
		File file = new File(taskImage);
		byte[] imageData = new byte[(int) file.length()];

		try {
		    FileInputStream fileInputStream = new FileInputStream(file);
		    fileInputStream.read(imageData);
		    fileInputStream.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		TeacherDailyTaskEntryHibernate b = new TeacherDailyTaskEntryHibernate();
		b.setClassName(className);
		b.setDivision(division);
		b.setAcademicYear(academicYear);
		b.setSubjectName(subject);
		b.setTeacherName(teacherName);
		b.setTask(task);
		b.setFkClassId(Long.parseLong(fkClassId));
		b.setFkDivisionId(Long.parseLong(fkDivisionId));
		b.setFkTeacherId(Long.parseLong(fkteacherid));
		b.setTaskPic(imageData);
		Date date = new Date();
		b.setInsertDate(date);
		TeacherDailyTaskEntryDao dao = new TeacherDailyTaskEntryDao();
		dao.addTeacherTaskDaily(b);
	}
	
	public void addHomeWorkTeacherDailyTask(HttpServletRequest request,
			HttpServletResponse response) {
		
		String className = request.getParameter("className");
		String division = request.getParameter("division");
		String subject = request.getParameter("subject");
		String teacherName = request.getParameter("teacherName");
		String academicYear = request.getParameter("academicYear");
		String task = request.getParameter("task");
		String fkDivisionId = request.getParameter("fkDivisionId");
		String fkteacherid = request.getParameter("fkteacherid");
		String fkClassId = request.getParameter("fkClassId");
		String taskImage = request.getParameter("taskImage");
		
		//System.out.println("taskImage ===========+ ====="+taskImage);
		
		File file = new File(taskImage);
		byte[] imageData = new byte[(int) file.length()];

		try {
		    FileInputStream fileInputStream = new FileInputStream(file);
		    fileInputStream.read(imageData);
		    fileInputStream.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		HomeWorkTeacherDailyTaskEntryHibernate b = new HomeWorkTeacherDailyTaskEntryHibernate();
		b.setClassName(className);
		b.setDivision(division);
		b.setAcademicYear(academicYear);
		b.setSubjectName(subject);
		b.setTeacherName(teacherName);
		b.setTask(task);
		b.setFkClassId(Long.parseLong(fkClassId));
		b.setFkDivisionId(Long.parseLong(fkDivisionId));
		b.setFkTeacherId(Long.parseLong(fkteacherid));
		b.setTaskPic(imageData);
		Date date = new Date();
		b.setInsertDate(date);
		
		TeacherDailyTaskEntryDao dao = new TeacherDailyTaskEntryDao();
		dao.addHomeWorkTeacherTaskDaily(b);
	}
//update
	public void editHomeWorkTeacherDailyTask(HttpServletRequest request,
			HttpServletResponse response) {
		
		String className = request.getParameter("className");
		String division = request.getParameter("division");
		String subject = request.getParameter("subject");
		String teacherName = request.getParameter("teacherName");
		String academicYear = request.getParameter("academicYear");
		String task = request.getParameter("task");
		String subid = request.getParameter("subid");

		
		//System.out.println("taskImage ===========+ ====="+taskImage);
		com.srb.utility.HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		long subid1 = Long.parseLong(subid);
		
		HomeWorkTeacherDailyTaskEntryHibernate b = (HomeWorkTeacherDailyTaskEntryHibernate) session.load(HomeWorkTeacherDailyTaskEntryHibernate.class, subid1);

		
		b.setClassName(className);
		b.setDivision(division);
		b.setAcademicYear(academicYear);
		b.setSubjectName(subject);
		b.setTeacherName(teacherName);
		b.setTask(task);
		System.out.println("task - "+b.getTask());
		Date date = new Date();
		b.setInsertDate(date);

	    session.saveOrUpdate(b);
		System.out.println("obj save");
	    transaction.commit();
		System.out.println("tx commit");
	}
	
	
	//view teacher task
	public void showTeacherTask(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("in showTeacherTask helper");
		
		String fkClassId = request.getParameter("fkClassId");
		String fkDivisionId = request.getParameter("fkDivisionId");
		String subject = request.getParameter("subject");
		String fkteacherid = request.getParameter("fkteacherid");
		String academicYear = request.getParameter("academicYear");
		System.out.println("fkClassId"+fkClassId);
		System.out.println("fkDivisionId"+fkDivisionId);
		System.out.println("subject"+subject);
		System.out.println("fkteacherid"+fkteacherid);
		System.out.println("academicYear"+academicYear);
		
		Long teacherId = Long.parseLong(fkteacherid);
		Long divId = Long.parseLong(fkDivisionId);
		Long classId = Long.parseLong(fkClassId);
		
		HttpSession sessionToViewTask = request.getSession();
		
		sessionToViewTask.setAttribute("fkClassIdToViewTask", classId);
		sessionToViewTask.setAttribute("fkDivisionIdToViewTask", divId);
		sessionToViewTask.setAttribute("subjectToViewTask", subject);
		sessionToViewTask.setAttribute("fkteacheridToViewTask", teacherId);
		sessionToViewTask.setAttribute("academicYearToViewTask", academicYear);
	}
	
	//
	public void deletehomewoork(HttpServletRequest request, HttpServletResponse response ) {
		String hid = request.getParameter("fk_home_id");
		System.out.println("hi this is del helper fk_hoem_id - "+hid);
		TeacherDailyTaskEntryDao dao2 = new TeacherDailyTaskEntryDao();
		dao2.deletehomework(hid);
			
		}

}
