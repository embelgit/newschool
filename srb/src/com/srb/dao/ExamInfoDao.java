package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.ExamNameList;
import com.srb.bean.GetExamTimeTableDetail;
import com.srb.bean.SuppliersPaymentBean;
import com.srb.hibernate.ExamInfoHibernate;
import com.srb.hibernate.ExamTimeTableHibernate;
import com.srb.utility.HibernateUtility;

public class ExamInfoDao {

public void ExamInfoHibernate(ExamInfoHibernate ex){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(ex);
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

public List getAllExamNames()
{
	
	
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<ExamInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();

		 query = session.createQuery("from ExamInfoHibernate group by examName ORDER BY pk_exam_id");
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

public List getPassingMArksAsPerSelectedSubject(String fk_class_id,
		String fk_division_id, String fk_examName_id, String academicYear,
		String fk_subject_id, String subjectName) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT passing_marks,pk_exam_id,total_marks FROM school.exam_master WHERE fk_examName_id='"+fk_examName_id+"' AND fk_class_id ='"+fk_class_id+"' AND fk_division_id ='"+fk_division_id+"' AND fk_subject_id ='"+fk_subject_id+"' AND academic_year ='"+academicYear+"' AND subject_name ='"+subjectName+"'");
			Query query = session.createSQLQuery("SELECT passing_marks,pk_exam_id,total_marks FROM school.exam_master WHERE subject_name ='"+subjectName+"' AND fk_class_id ='"+fk_class_id+"' AND fk_division_id ='"+fk_division_id+"' AND fk_subject_id ='"+fk_subject_id+"' AND academic_year ='"+academicYear+"'  ");
			list = query.list();
			
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
		return list;
	

}
//get all exam all details to edit
public List getExamForEdit(String examName_id) {
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("select pk_exam_id, academic_year,class_name,division_name,subject_name,total_marks,passing_marks from exam_master");
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


public List getAllExamName()
{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List<ExamInfoHibernate> list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			query = session.createQuery("from ExamInfoHibernate");
			 /*query = session.createQuery("from CustomerDetailsBean");*/
			 list = query.list(); 
		} catch (Exception e) {
			Log.error("Error in getAllPriduct", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			
				return list;
		
	}


//get Supplier Payment List
public List getExamNameList()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ExamNameList> supList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT exam_name,academic_year,class_name,division_name,subject_name,total_marks,passing_marks FROM exam_master ");
	List<Object[]> list = query.list();


	supList= new ArrayList<ExamNameList>(0);


for (Object[] o : list) 
{	
	ExamNameList reports = new ExamNameList();
	
	reports.setExamName(o[0].toString());
	reports.setAcadamicsYear(o[1].toString());
	reports.setClassName(o[2].toString());
	reports.setDivisionName(o[3].toString());
	reports.setSubjectName(o[4].toString());
	reports.setTotalMarks(o[5].toString());
	reports.setPassingMarks(o[6].toString());
	/*reports.setChequeNum(o[7].toString());
	reports.setCardNum(o[8].toString());
	reports.setAccNum(o[9].toString());
	reports.setBankName(o[10].toString());
	reports.setNameOnCheck(o[11].toString());*/
	
	supList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return supList;
}
//exam time tabke

public List getExamtimeList()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ExamTimeTableHibernate> supList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT pk_exam_time_table_id,exam_name,class_name,division_name,subject_name,`day`,exam_date,academic_year,start_time,end_time from exam_time_table");
	List<Object[]> list = query.list();


	supList= new ArrayList<ExamTimeTableHibernate>(0);


for (Object[] o : list) 
{	
	ExamTimeTableHibernate r = new ExamTimeTableHibernate();
	System.out.println("result - "+Arrays.toString(o));
	r.setPkExamTimeTableId(Long.parseLong(o[0].toString()));
	r.setExamName(o[1].toString());
	r.setClassName(o[2].toString());
	r.setDivisionName(o[3].toString());
	r.setSubjetName(o[4].toString());
	r.setWeekDay(o[5].toString());
	r.setExamDate((Date)o[6]);
	r.setAcademicYear(o[7].toString());
	r.setStartTime(o[8].toString());
	r.setEndTime(o[9].toString());
	supList.add(r);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return supList;
}

// to get Daily Time Table List
public List getDailyTimeTableList()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	List<GetExamTimeTableDetail> supList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("select class_name,division_name,academic_year,`day`,start_time,end_time,subject_name,teacher_name from daily_time_table");
	List<Object[]> list = query.list();


	supList= new ArrayList<GetExamTimeTableDetail>(0);


for (Object[] o : list) 
{	
	GetExamTimeTableDetail reports = new GetExamTimeTableDetail();
	
	reports.setClassName(o[0].toString());
	reports.setDivisionName(o[1].toString());
	reports.setAcademicYear(o[2].toString());
	reports.setWeekDay(o[3].toString());
	reports.setStartTime(o[4].toString());
	reports.setEndTime(o[5].toString());
	reports.setSubjetName(o[6].toString());
	reports.setTeacherName(o[7].toString());
	/*reports.setChequeNum(o[7].toString());
	reports.setCardNum(o[8].toString());
	reports.setAccNum(o[9].toString());
	reports.setBankName(o[10].toString());
	reports.setNameOnCheck(o[11].toString());*/
	
	supList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return supList;
}

//getdivexam
public List getDivisiontoeditexam(String examid, String classid)
{

	HibernateUtility hbu = null ;
	Session session = null;
	List list  = null;
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT fk_division_id, division_name FROM exam_master WHERE exam_name = '"+examid+"' and fk_class_id = '"+classid+"'");
		list = query.list();

		System.out.println("----- LIST -DAO---- jsp  ::  "+query.list().size());
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}

	finally
	{
		if (session!=null) {
			hbu.closeSession(session);
		}
	}
	
	System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

	return list;
	
	
}


}




