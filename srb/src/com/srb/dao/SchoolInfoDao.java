package com.srb.dao;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetSchoolDetailBean;
import com.srb.hibernate.SchoolInfoHibernate;
import com.srb.hibernate.SubjectWiseSyllabusEntryHibernate;
import com.srb.utility.HibernateUtility;

public class SchoolInfoDao {

public void SchoolInfoHibernate (SchoolInfoHibernate scf){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(scf);
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
	
public List getAllSchoolName()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from SchoolInfoHibernate");
	 list = query.list();
	}catch(Exception e){	
		System.out.println("error in getAllSchoolName");
	}
	finally{
		if(session!=null){
		hbu.closeSession(session);	
	}
	}
	return list;
}
//
public List getAllStuName()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from ParentsComplaintHibernate");
	 list = query.list();
	}catch(Exception e){	
		System.out.println("error in getAllSchoolName");
	}
	finally{
		if(session!=null){
		hbu.closeSession(session);	
	}
	}
	return list;
}

// get school detail to edit
public List getAllSchoolDetailsForEdit(Long pkschoolId) {

	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT pk_school_id,school_name,city,sanstha_name,school_reg_number,taluka,district,state,pin_code,institute_name,contact_number,school_udise_number,address FROM school_master WHERE pk_school_id ="+pkschoolId);
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
	 System.out.println("out of dao - return credit customer List : "+list);
			return list;

	}

 public List getAllSchoolDetailForList(){

		HibernateUtility hbu=null;
		Session session=null;
		List<GetSchoolDetailBean> custList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT pk_school_id,school_name,city,sanstha_name,school_reg_number,taluka,district,state,pin_code,institute_name,contact_number,school_udise_number,address FROM school_master");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();


		custList= new ArrayList<GetSchoolDetailBean>(0);

	for (Object[] object : list) {	
		GetSchoolDetailBean reports = new GetSchoolDetailBean();
		reports.setPkSchoolId(Long.parseLong(object[0].toString()));
		reports.setSchoolName(object[1].toString());
		reports.setCity(object[2].toString());
		reports.setSansthaName(object[3].toString());
		reports.setSchoolRegNumber(object[4].toString());
		reports.setTq(object[5].toString());
		reports.setDistrict(object[6].toString());
		reports.setState(object[7].toString());
		reports.setPinCode(Long.parseLong(object[8].toString()));
		reports.setInstituteName(object[9].toString());
		reports.setContactP(Long.parseLong(object[10].toString()));
		reports.setSchoolUdiseNumber(object[11].toString());
		reports.setAddress(object[12].toString());
		
		custList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return custList;

 }
 
 //
 public List getsyllabusList(){

		HibernateUtility hbu=null;
		Session session=null;
		List<SubjectWiseSyllabusEntryHibernate> custList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("select pk_subjectwise_syllabus_entry_id,teacher_name,class_name,division,syllabus,`subject`,academic_year,insert_date from subject_wise_syllabus_entry");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();


		custList= new ArrayList<SubjectWiseSyllabusEntryHibernate>(0);

	for (Object[] object : list) {	
		SubjectWiseSyllabusEntryHibernate reports = new SubjectWiseSyllabusEntryHibernate();
		reports.setPkSubjectWiseSyllabusEntryId(Long.parseLong(object[0].toString()));
		reports.setTeacherName(object[1].toString());
		reports.setClassName(object[2].toString());
		reports.setDivision(object[3].toString());
		reports.setSyllabus(object[4].toString());
		reports.setSubjectName(object[5].toString());
		reports.setAcademicYear(object[6].toString());
		reports.setInsertDate((Date)object[7]);
		custList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return custList;

}
 
}
