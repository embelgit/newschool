package com.srb.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetDailyTimeTableBean;
import com.srb.bean.GetExamTimeTableDetail;
import com.srb.dao.DailyTimeTableDAO;
import com.srb.dao.ExamTimeTableDAO;
import com.srb.hibernate.DailyTimeTableHibernate;
import com.srb.hibernate.ExamInfoHibernate;
import com.srb.hibernate.ExamTimeTableHibernate;
import com.srb.utility.HibernateUtility;

public class ExamTimeTableHelper {

	//grid for exam time table
	public GetExamTimeTableDetail getGridForExamTimeTable(String fkSubjectId,
			String subjectName, String day, String examDate, String startTime,
			String endTime) {

		GetExamTimeTableDetail bean = new GetExamTimeTableDetail();
			
			bean.setFkSubjectId(Long.parseLong(fkSubjectId));
			bean.setSubjetName(subjectName);
			bean.setExamDate(examDate);
			bean.setWeekDay(day);
			bean.setStartTime(startTime);
			bean.setEndTime(endTime);
			System.out.println("fkSubjectId "+fkSubjectId);
			System.out.println("subjectName "+subjectName);
			System.out.println("examDate "+examDate);
			System.out.println("day "+day);
			System.out.println("startTime "+startTime);
			System.out.println("endTime "+endTime);
			
			return bean;
	
	}
//
	public List getGridForExamTimeTableedit(String examname, String clss,String divv) {

		
        Map<Long,GetExamTimeTableDetail> map = new HashMap<Long,GetExamTimeTableDetail>();
 		
        ExamTimeTableDAO dao = new ExamTimeTableDAO();        

		List<GetExamTimeTableDetail> expList = dao.getExamTimeTableInfoedit(examname,divv,clss);
		return expList;
		
		/*
		 * GetExamTimeTableDetail bean = new GetExamTimeTableDetail();
		 * 
		 * bean.setFkSubjectId(Long.parseLong(fkSubjectId));
		 * bean.setSubjetName(subjectName); bean.setExamDate(examDate);
		 * bean.setWeekDay(day); bean.setStartTime(startTime); bean.setEndTime(endTime);
		 * System.out.println("fkSubjectId "+fkSubjectId);
		 * System.out.println("subjectName "+subjectName);
		 * System.out.println("examDate "+examDate); System.out.println("day "+day);
		 * System.out.println("startTime "+startTime);
		 * System.out.println("endTime "+endTime);
		 * 
		 * return bean;
		 */
	
	}
	
	//add exam time table
	public void addingExamTimeTable(HttpServletRequest request,
			HttpServletResponse response) {
	
		ExamTimeTableHibernate cdst=new ExamTimeTableHibernate();
            Integer count = Integer.parseInt(request.getParameter("count"));
            System.out.println(count);
            for(int i =0 ; i<count;i++)
    		{
				
                String subjectName = request.getParameter("subjetName"+i);
                String examDate = request.getParameter("examDate"+i);
                String fkSubId = request.getParameter("fkSubjectId"+i);
                String endTime = request.getParameter("endTime"+i);
                String startTime = request.getParameter("startTime"+i);
                String academicYear = request.getParameter("academicYear");	
                String classId = request.getParameter("classId");
			    String className = request.getParameter("className");
				String fkDivisionId = request.getParameter("division");
				String divisionName = request.getParameter("divisionName");
				String weekDay = request.getParameter("weekDay"+i);
				String examName = request.getParameter("examName");
				String examId = request.getParameter("examId");
				
				System.out.println("weekDay "+weekDay);
				System.out.println("fkSubId "+fkSubId);
				System.out.println("classId "+classId);
				System.out.println("startTime "+startTime);
				System.out.println("endTime "+endTime);
				System.out.println("subjectName "+subjectName);
				System.out.println("academicYear "+academicYear);
				System.out.println("className "+className);
				System.out.println("divisionName "+divisionName);
				System.out.println("examDate "+examDate);
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date newDate = null;
				try {
					newDate =	format.parse(examDate);
					} 
				catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				cdst.setExamDate(newDate);
				
				cdst.setClassName(className);
				cdst.setFkClassId(Long.parseLong(classId));
				cdst.setFkSubjectId(Long.parseLong(fkSubId));
				cdst.setSubjetName(subjectName);
				cdst.setFkDivisionId(Long.parseLong(fkDivisionId));
				cdst.setDivisionName(divisionName);
				cdst.setWeekDay(weekDay);
				cdst.setAcademicYear(academicYear);
				cdst.setStartTime(startTime);
				cdst.setEndTime(endTime);
				cdst.setExamName(examName);
				cdst.setFkExamNameId(Long.parseLong(examId));
     
				ExamTimeTableDAO dao = new ExamTimeTableDAO();
				dao.addExamTimeTableDetails(cdst);
	
    		}

	
		
	
	}
//edit
	
	
	public void addingExamTimeTableedit(HttpServletRequest request,
			HttpServletResponse response) {
	
//		ExamTimeTableHibernate cdst=new ExamTimeTableHibernate();
            Integer count = Integer.parseInt(request.getParameter("count"));
            System.out.println(count);
            for(int i =0 ; i<count;i++)
    		{
				
                String subjectName = request.getParameter("subjetName"+i);
                String examDate = request.getParameter("examDate"+i);
                String fkSubId = request.getParameter("fkSubjectId"+i);
                String endTime = request.getParameter("endTime"+i);
                String startTime = request.getParameter("startTime"+i);
             //   String academicYear = request.getParameter("academicYear");	
                String classId = request.getParameter("classId");
			    String className = request.getParameter("className");
				String fkDivisionId = request.getParameter("division");
				String divisionName = request.getParameter("divisionName");
		//		String weekDay = request.getParameter("weekDay"+i);
				String examName = request.getParameter("examName");
				String examId = request.getParameter("examId");
				
		//		System.out.println("weekDay "+weekDay);
				System.out.println("fkSubId "+fkSubId);
				System.out.println("classId "+classId);
				System.out.println("startTime "+startTime);
				System.out.println("endTime "+endTime);
				System.out.println("subjectName "+subjectName);
	//			System.out.println("academicYear "+academicYear);
				System.out.println("className "+className);
				System.out.println("divisionName "+divisionName);
				System.out.println("examDate "+examDate);
				System.out.println("examId "+examId);
				//
				
				com.srb.utility.HibernateUtility hbu=null;
				Session session = null;
				Transaction transaction = null;
				
				 hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
			
				//long customerId = Long.parseLong(customerId);
				long examName_id = Long.parseLong(examId);
				
				ExamTimeTableHibernate cdst = (ExamTimeTableHibernate) session.load(ExamTimeTableHibernate.class, examName_id);
				cdst.setPkExamTimeTableId(examName_id);
				
				if(!"".equals(examDate)) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			//		Date dateOfBirth = null;
					Date joiningDate = null;
					try{
				//		dateOfBirth = format.parse(dob);
				//		det.setDob(dateOfBirth);
						joiningDate = format.parse(examDate);
						cdst.setExamDate(joiningDate);
						//det.setInsertDate(joiningDate);
						System.out.println("det.getJdate() -   "+cdst.getExamDate());
					}
					catch(Exception e){
						e.printStackTrace();
						System.out.println("Exception in date parsing");
					}
					}
				cdst.setClassName(className);
				cdst.setFkClassId(Long.parseLong(classId));
				//cdst.setFkSubjectId(Long.parseLong(fkSubId));
				cdst.setSubjetName(subjectName);
				cdst.setFkDivisionId(Long.parseLong(fkDivisionId));
				cdst.setDivisionName(divisionName);
	//			cdst.setWeekDay(weekDay);
	//			cdst.setAcademicYear(academicYear);
				cdst.setStartTime(startTime);
				cdst.setEndTime(endTime);
				cdst.setExamName(examName);
				cdst.setFkExamNameId(Long.parseLong(examId));
  System.out.println("xam updated  -  ");
				  session.saveOrUpdate(cdst);
					transaction.commit();
					
    		}

	
		
	
	}
	
	//view exam time table
	public List getExamTimeTableForReport(HttpServletRequest request,
			HttpServletResponse response) {
		String fkExamId = request.getParameter("fkExamId");
		String fkClassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		
		String examn =  request.getParameter("examn");
		String divv = request.getParameter("divv");
		String clss = request.getParameter("clss");
		
         Map<Long,GetExamTimeTableDetail> map = new HashMap<Long,GetExamTimeTableDetail>();
 		
         ExamTimeTableDAO dao = new ExamTimeTableDAO();        
/* 		List<GetExamTimeTableDetail> expList = dao.getExamTimeTableInfo(fkClassId,fkDivId,fkExamId);*/
 		List<GetExamTimeTableDetail> expList = dao.getExamTimeTableInfo(examn,divv,clss);
 		return expList;
	
	
	
	
	}

}
