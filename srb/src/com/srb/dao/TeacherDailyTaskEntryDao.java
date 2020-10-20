package com.srb.dao;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetSchoolDetailBean;
import com.srb.hibernate.HomeWorkTeacherDailyTaskEntryHibernate;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.hibernate.TeacherDailyTaskEntryHibernate;
import com.srb.utility.HibernateUtility;

public class TeacherDailyTaskEntryDao {

	public void addTeacherTaskDaily(TeacherDailyTaskEntryHibernate b) {
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		session.save(b);
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
	

	public void addHomeWorkTeacherTaskDaily(HomeWorkTeacherDailyTaskEntryHibernate b) {
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		session.save(b);
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
	
	// Teacher Daily Task by kishor 
		public List getAllTeacherDetailForList(){

			HibernateUtility hbu=null;
			Session session=null;
			List<TeacherDailyTaskEntryHibernate> custList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("select teacher_name,academic_year,class_name,division,`subject`,task from teacher_daily_task");
			//Query query = session.createQuery("from PurchaseBill2");
			List<Object[]> list = query.list();

			custList= new ArrayList<TeacherDailyTaskEntryHibernate>(0);

		    for (Object[] object : list) {	
		    	TeacherDailyTaskEntryHibernate reports = new TeacherDailyTaskEntryHibernate();
			
			reports.setTeacherName(object[0].toString());
			reports.setAcademicYear(object[1].toString());
			reports.setClassName(object[2].toString());
			reports.setDivision(object[3].toString());
			reports.setSubjectName(object[4].toString());
			reports.setTask(object[5].toString());
			
			custList.add(reports);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return custList;

		}
//homework list
		public List getAllhomeworkDetailForList(){

			HibernateUtility hbu=null;
			Session session=null;
			List<HomeWorkTeacherDailyTaskEntryHibernate> custList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("select pk_teacher_daily_task, teacher_name,class_name, division,`subject`,task,insert_date from home_work");
			//Query query = session.createQuery("from PurchaseBill2");
			List<Object[]> list = query.list();


			custList= new ArrayList<HomeWorkTeacherDailyTaskEntryHibernate>(0);

		for (Object[] o : list) {	
			System.out.println("result - "+Arrays.toString(o));
			HomeWorkTeacherDailyTaskEntryHibernate rp = new HomeWorkTeacherDailyTaskEntryHibernate();
			rp.setPkTeacherDailyTaskId(Long.parseLong(o[0].toString()));
			rp.setTeacherName(o[1].toString());
			rp.setClassName(o[2].toString());
			rp.setDivision(o[3].toString());
			rp.setSubjectName(o[4].toString());
			rp.setTask(o[5].toString());
			rp.setInsertDate((Date)o[6]);
	//		rp.setAcademicYear(o[7].toString());
			custList.add(rp);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return custList;

	 }
		
		//
		public List getAllteacher()
		{
			HibernateUtility hbu = null;
			Session session =  null;
			Query query = null;
			 List<SubjectInfoHibernate> list = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 query = session.createQuery("from HomeWorkTeacherDailyTaskEntryHibernate");
				 list = query.list(); 
			} catch (RuntimeException e) {
				e.printStackTrace();
				
			}
			 
			 finally
			 {
				 if (session!=null) {
					hbu.closeSession(session);
				}
			 }
					return list;
			
		}
		
		//
		public void deletehomework(String hid) {
			
			HibernateUtility hbu = null ;
			 Session session = null;
			 List list  = null;
			 Transaction tx = null;
			 System.out.println("fk_subject_id in dAO - "+hid);
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 tx = session.beginTransaction();
					Query query = session.createSQLQuery("delete FROM home_work WHERE pk_teacher_daily_task = '"+hid+"'");
					int seletedRecords = query.executeUpdate();
					tx.commit();
					System.out.println("Number of credit Cusr deleted == + = - "+seletedRecords);
					//list = query.list();
					
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
				
			 finally
			 { 
				 if (session!=null) {
					hbu.closeSession(session);
				}
			 }
			
		}
}
