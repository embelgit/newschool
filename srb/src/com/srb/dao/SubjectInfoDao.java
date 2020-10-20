package com.srb.dao;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClasSubAssoBean;
import com.srb.bean.ClassDivisionSubjectAssocBean;
import com.srb.bean.GetExamTimeTableDetail;
import com.srb.hibernate.ClassInfoHibernate;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.hibernate.SubjectWiseSyllabusEntryHibernate;
import com.srb.utility.HibernateUtility;


public class SubjectInfoDao {
	  
	

public void SubjectInfoHibernate( SubjectInfoHibernate suf){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(suf);
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
	
public List getAllMainSubject()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from SubjectInfoHibernate");
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
public List getAllMainSubject10()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from HomeWorkTeacherDailyTaskEntryHibernate GROUP BY subjectName");
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


//delsub
public void deletesubject(String fk_subject_id) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 Transaction tx = null;
	 System.out.println("fk_subject_id in dAO - "+fk_subject_id);
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("delete from subject_master where pk_subject_id ='"+fk_subject_id+"'");
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

public List getAllSubjectDetailForList(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<ClasSubAssoBean> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT pk_subject_id,subject_name FROM subject_master");
	//Query query = session.createQuery("from PurchaseBill2");
	List<Object[]> list = query.list();


	custList= new ArrayList<ClasSubAssoBean>(0);


for (Object[] object : list) {	
	ClasSubAssoBean reports = new ClasSubAssoBean();
	reports.setSubId(object[0].toString());
	reports.setSubName(object[1].toString());
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}

//

public List getAllsubject()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<ClassInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from SubjectInfoHibernate ");
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
public List<SubjectWiseSyllabusEntryHibernate> getsubjectwiseInfo(String fkClassId,String fkDivisionId,String subject,String fkteacherid) {
	HibernateUtility hbu=null;
	Session session=null;
	List<SubjectWiseSyllabusEntryHibernate> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
//		Query query = session.createSQLQuery("SELECT day,exam_date,start_time,end_time,subject_name FROM exam_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ='"+fkDivId+"' AND fk_exam_id="+fkExamId);
	Query query	 = session.createSQLQuery("select pk_subjectwise_syllabus_entry_id,teacher_name,class_name,division,syllabus,insert_date from subject_wise_syllabus_entry WHERE class_name = '"+fkClassId+"' AND division = '"+fkDivisionId+"' AND teacher_name = '"+fkteacherid+"' AND `subject` = '"+subject+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SubjectWiseSyllabusEntryHibernate>(0);
		
		
		for (Object[] object : list) {
			
			SubjectWiseSyllabusEntryHibernate s = new SubjectWiseSyllabusEntryHibernate();
			//String day = object[0].toString();
			System.out.println("resukt - "+Arrays.toString(object));
			s.setPkSubjectWiseSyllabusEntryId(Long.parseLong(object[0].toString()));
			s.setTeacherName(object[1].toString());
			s.setClassName(object[2].toString());
			s.setDivision(object[3].toString());
			s.setSyllabus(object[4].toString());
			s.setInsertDate((Date)object[5]);
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

