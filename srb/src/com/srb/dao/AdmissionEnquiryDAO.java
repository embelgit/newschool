package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetSchoolDetailBean;
import com.srb.hibernate.AdmissionEnquiryHibernate;
//import com.srb.hibernate.AdmissionEnquiryHibernate;
import com.srb.utility.HibernateUtility;
import com.srb.bean.AdmissionEnquiryBean;
public class AdmissionEnquiryDAO {

	public void addAdmissionEnquiry(AdmissionEnquiryHibernate b) {

		
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
//list
	public List getAlladmissionenquiryForList(){

		HibernateUtility hbu=null;
		Session session=null;
		List<AdmissionEnquiryBean> custList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("select pk_admission_enquiry_id,class_name,student_name,parent_name,email,contact_number,address,previous_school_name,city,alternate_contact_number from admission_enquiry");

		List<Object[]> list = query.list();
       System.out.println(list.size());

		custList= new ArrayList<AdmissionEnquiryBean>(0);

	for (Object[] o : list) {	
		AdmissionEnquiryBean rp = new AdmissionEnquiryBean();
		rp.setPkAdmissionEnquiryId(Long.parseLong(o[0].toString()));
		rp.setClassName(o[1].toString());
		rp.setStudentName(o[2].toString());
		rp.setParentName(o[3].toString());
		rp.setEmail(o[4].toString());
		rp.setContactNumber(Long.parseLong(o[5].toString()));
		rp.setAddress(o[6].toString());
		rp.setPreSchoolN(o[7].toString());
		rp.setCity(o[8].toString());
		rp.setAlternateContactNumber(Long.parseLong(o[9].toString()));
//		rp.setInsertDate(o[9].toString());
		custList.add(rp);
		System.out.println("alternate contact no" +rp.getAlternateContactNumber());

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return custList;

 }
	//
	public List getAllStudent()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from AdmissionEnquiryHibernate");
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
	//del
	public void deleteaddenq(String fkaddid) {
		
		Transaction tx = null;
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 System.out.println("id dao - "+fkaddid);
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			tx = session.beginTransaction();
			 Query query = session.createSQLQuery("delete from admission_enquiry where pk_admission_enquiry_id = "+fkaddid);
				int seletedRecords = query.executeUpdate();
				System.out.println("Number of credit Cusr deleted == + = "+seletedRecords);
				//list = query.list();
				tx.commit();
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
	
	//
	public List getAllStudentForEdit(Long stuId) {

		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select pk_admission_enquiry_id,fk_class_d,class_name,student_name,parent_name,email,contact_number,address,previous_school_name,city,`comment` from admission_enquiry WHERE pk_admission_enquiry_id = "+stuId);
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
	//
	public List getAllnoticeForEdit(String classname,String divname) {

		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select pk_notice_id,dt_notice_date,str_task_in_text from notice WHERE str_class_name = '"+classname+"' AND str_division = '"+divname+"'");
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


public List getAlladmissionenquiryForList1(){

	HibernateUtility hbu=null;
	Session session=null;
	List<AdmissionEnquiryBean> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("select pk_admission_enquiry_id,class_name,student_name,parent_name,email,contact_number,address,previous_school_name,city,alternate_contact_number from admission_enquiry");

	List<Object[]> list = query.list();
   System.out.println(list.size());

	custList= new ArrayList<AdmissionEnquiryBean>(0);

for (Object[] o : list) {	
	AdmissionEnquiryBean rp = new AdmissionEnquiryBean();
	rp.setPkAdmissionEnquiryId(Long.parseLong(o[0].toString()));
	rp.setClassName(o[1].toString());
	rp.setStudentName(o[2].toString());
	rp.setParentName(o[3].toString());
	rp.setEmail(o[4].toString());
	rp.setContactNumber(Long.parseLong(o[5].toString()));
	rp.setAddress(o[6].toString());
	rp.setPreSchoolN(o[7].toString());
	rp.setCity(o[8].toString());
	rp.setAlternateContactNumber(Long.parseLong(o[9].toString()));
//	rp.setInsertDate(o[9].toString());
	custList.add(rp);
	System.out.println("alternate contact no" +rp.getAlternateContactNumber());

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}
}