package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetDailyTimeTableBean;
import com.srb.bean.GetResultDetailBean;
import com.srb.hibernate.ResultHibernate;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.utility.HibernateUtility;

public class ResultDao {

	public void addResult(ResultHibernate bean) {
	

		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(bean);
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

	//report - class wise result
	public List<GetResultDetailBean> getClassWiseResultInfo(String fkExamId, String fkClassId, String fkDivId) {
		HibernateUtility hbu=null;
		Session session=null;
		String subjectNameFromSubjectTable = null;
		List<GetResultDetailBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,subject_name,passing_marks,obtained_marks,total_marks FROM result_entry WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ='"+fkDivId+"' AND fk_exam_name_id ="+fkExamId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetResultDetailBean>(0);
			 for (Object[] object : list) {
				
				GetResultDetailBean s = new GetResultDetailBean();
				String subject = object[3].toString();
				System.out.println("subject = = ="+subject);
				s.setFirstName(object[0].toString());
				s.setMiddleName(object[1].toString());
				s.setLastName(object[2].toString());
				s.setSubjectName(object[3].toString());
				s.setPassingMarks(object[4].toString());
				s.setObtainedMarks(object[5].toString());
				s.setTotalMarks(object[6].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	
	
	}
//report- student wise result
	public List<GetResultDetailBean> getStudentWiseResultInfo(String fkExamId,
			String fkClassId, String fkDivId, String studentName) {

		HibernateUtility hbu=null;
		Session session=null;
		List<GetResultDetailBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,subject_name,passing_marks,obtained_marks,total_marks FROM result_entry WHERE fk_class_id ='"+fkClassId+"' AND fk_student_id ='"+studentName+"' AND fk_division_id ='"+fkDivId+"' AND fk_exam_name_id ="+fkExamId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetResultDetailBean>(0);
			 for (Object[] object : list) {
				
				GetResultDetailBean s = new GetResultDetailBean();
				s.setFirstName(object[0].toString());
				s.setMiddleName(object[1].toString());
				s.setLastName(object[2].toString());
				s.setSubjectName(object[3].toString());
				s.setPassingMarks(object[4].toString());
				s.setObtainedMarks(object[5].toString());
				s.setTotalMarks(object[6].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	

	}

	//Check For Duplicate Entry OF Result
	public List getResultEntry()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List<ResultHibernate> list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 String abc="Teaching Staff";
				/*
				 * query = session.
				 * createQuery("from TeacherInfoHibernate where designation IN('Teaching Staff') "
				 * );
				 */
			//query = session.createQuery("from TeacherInfoHibernate where designation IN('Principal', 'Teaching Staff', 'Non-Teaching Staff') ");
			 query = session.createQuery("from ResultHibernate");
			 /*query.setParameter("abc", abc);*/
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





}
