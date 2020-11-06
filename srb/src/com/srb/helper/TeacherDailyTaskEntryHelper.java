package com.srb.helper;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetTeacherDetailBean;
import com.srb.bean.TeacherDailyTaskEntryBean;
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
		String date=request.getParameter("date3");
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
		if(!"".equals(date)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(date);
				//det.setStoreDate(joiningDate);
				b.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   "+b.getInsertDate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
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
	public Map getDailyTasktoEdit(Long fkteacherID) {

	 	System.out.println("into helper class");
	 	TeacherDailyTaskEntryDao dao1 = new TeacherDailyTaskEntryDao();
		List catList = dao1.getAllTeacherTaskForEdit1(fkteacherID);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
			TeacherDailyTaskEntryBean b = new TeacherDailyTaskEntryBean();
			b.setPkTeacherDailyTaskId(Long.parseLong(o[0].toString()));
			b.setClassName(o[1].toString());
			b.setDivision(o[2].toString());
			b.setSubjectName(o[3].toString());
			String d = o[4].toString();
			String dt[] = d.split("-");
			String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
			b.setInsertDate(insertDate);
			b.setTask(o[5].toString());
			b.setAcademicYear(o[6].toString());
			map.put(b.getPkTeacherDailyTaskId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	
	}
// update teacher Daily Task
	
	public void updateTeacherTaskDetail(HttpServletRequest request,
			HttpServletResponse response) {
		Session session = null;
		System.out.println("IN helper");
		String teacherName1 =request.getParameter("teacherName1");
		String fkteacherID1 =request.getParameter("fkteacherID1");
		String clsname = request.getParameter("clsname");
		String DivisionName = request.getParameter("DivisionName");
		String academic= request.getParameter("academic");
		String taskInTextt = request.getParameter("taskInTextt");
		String date=request.getParameter("date4");
		String subject=request.getParameter("subject");
		System.out.println("----------------------teacherName1-----------------------"+teacherName1);
		System.out.println("----------------------fkstoreId-----------------------"+fkteacherID1);
		System.out.println("----------------------clsname-----------------------"+clsname);
		System.out.println("----------------------DivisionName----------------------"+DivisionName);
		System.out.println("---------------------academic-----------------------"+academic);
		System.out.println("------------------------taskInTextt------------------"+taskInTextt);
		System.out.println("----------------------date amt-----------------------"+date);
		System.out.println("----------------------subject-----------------------"+subject);
		com.srb.utility.HibernateUtility hbu=null;
		Transaction transaction = null;
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Long pkStoreManagementId1=Long.parseLong(fkteacherID1);
		TeacherDailyTaskEntryHibernate det = (TeacherDailyTaskEntryHibernate) session.load(TeacherDailyTaskEntryHibernate.class, pkStoreManagementId1);
		det.setPkTeacherDailyTaskId(pkStoreManagementId1);
		det.setClassName(clsname);
		det.setAcademicYear(academic);
		det.setTask(taskInTextt);
		det.setSubjectName(subject);
		if(!"".equals(date)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(date);
				//det.setStoreDate(joiningDate);
				det.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   "+det.getInsertDate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
	
		System.out.println("updated in TeacherTask Hibernate");
		com.srb.utility.HibernateUtility hbu2=null;
		//Session session = null;
		 session.saveOrUpdate(det);
			transaction.commit();
		
		}

// delete Teacher Task
	
	public void deleteTeacherdailyTask(HttpServletRequest request, HttpServletResponse response ) {
		String kitpro_id = request.getParameter("fkteacherID2");   
		TeacherDailyTaskEntryDao dao2 = new TeacherDailyTaskEntryDao();
		dao2.deletTeachertask(kitpro_id);
			
		}

	
	
	
}
