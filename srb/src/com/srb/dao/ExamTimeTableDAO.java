package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetDailyTimeTableBean;
import com.srb.bean.GetExamTimeTableDetail;
import com.srb.hibernate.ExamTimeTableHibernate;
import com.srb.utility.HibernateUtility;

public class ExamTimeTableDAO {

	public void addExamTimeTableDetails(ExamTimeTableHibernate cdst) {

		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
	try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(cdst);
		transaction.commit();
	}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				rbe.printStackTrace();
			}	
		}finally{
		hbu.closeSession(session);
	}
	
		
	
		
	}
//
	public List<GetExamTimeTableDetail> getExamTimeTableInfoedit(String examn, String divv, String clss) {
		HibernateUtility hbu=null;
		Session session=null;
		List<GetExamTimeTableDetail> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
//			Query query = session.createSQLQuery("SELECT day,exam_date,start_time,end_time,subject_name FROM exam_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ='"+fkDivId+"' AND fk_exam_id="+fkExamId);
		Query query	 = session.createSQLQuery("select pk_exam_time_table_id,exam_date,`day`,start_time,end_time,subject_name from exam_time_table where exam_name = '"+examn+"' AND class_name='"+clss+"' AND division_name='"+divv+"'");
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetExamTimeTableDetail>(0);
			
			
			for (Object[] object : list) {
				
				GetExamTimeTableDetail s = new GetExamTimeTableDetail();
				//String day = object[0].toString();
				System.out.println("rr - "+Arrays.toString(object));
				s.setPkExamTimeTableId(Long.parseLong(object[0].toString()));
//				s.setWeekDay(object[0].toString());
				s.setExamDate(object[1].toString());
				s.setWeekDay(object[2].toString());
				s.setStartTime(object[3].toString());
				s.setEndTime(object[4].toString());
				s.setSubjetName(object[5].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	
	}
	
	
	
	public List<GetExamTimeTableDetail> getExamTimeTableInfo(String examn, String divv, String clss) {
		HibernateUtility hbu=null;
		Session session=null;
		List<GetExamTimeTableDetail> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
//			Query query = session.createSQLQuery("SELECT day,exam_date,start_time,end_time,subject_name FROM exam_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ='"+fkDivId+"' AND fk_exam_id="+fkExamId);
		Query query	 = session.createSQLQuery("SELECT day,exam_date,start_time,end_time,subject_name FROM exam_time_table WHERE exam_name = '"+examn+"' AND class_name = '"+clss+"' AND division_name = '"+divv+"'");
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetExamTimeTableDetail>(0);
			
			
			for (Object[] object : list) {
				
				GetExamTimeTableDetail s = new GetExamTimeTableDetail();
				//String day = object[0].toString();
				s.setWeekDay(object[0].toString());
				s.setExamDate(object[1].toString());
				s.setStartTime(object[2].toString());
				s.setEndTime(object[3].toString());
				s.setSubjetName(object[4].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	
	}

}
