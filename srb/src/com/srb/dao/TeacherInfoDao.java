package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClasSubAssoBean;
import com.srb.bean.FeeStructureReportBean;
import com.srb.bean.GetSchoolDetailBean;
import com.srb.bean.GetTeacherDetailBean;
import com.srb.bean.GetTeacherDetailsSubjecctWiseBean;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.hibernate.TeacherInfoHibernate;
import com.srb.utility.HibernateUtility;

public class TeacherInfoDao {

public void TeacherInfoHibernate(TeacherInfoHibernate tif){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
			System.out.println("In tacher DAO");
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(tif);
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
	
public List getAllMainTeacher()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
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
		 query = session.createQuery("from TeacherInfoHibernate ");
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
//
public List getAllMainTeachertoedit()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
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
		 query = session.createQuery("from TeacherInfoLeaveHibernate ");
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

//
public List getAllteacher()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from TeacherInfoHibernate");
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
public void deleteteachers(String fktechid) {
	
	Transaction tx = null;
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		tx = session.beginTransaction();
		 Query query = session.createSQLQuery("delete from teacher_master where pk_teacher_id = "+fktechid);
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

public List getAllMainTeacher_new()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String abc="Teaching Staff";
		query = session.createQuery("from TeacherInfoHibernate where designation IN('Teaching Staff') ");
		 //query = session.createQuery("from TeacherInfoHibernate ");
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

//
public List getAllMainTeacheredit()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String abc="Teaching Staff";
		query = session.createQuery("from HomeWorkTeacherDailyTaskEntryHibernate ");
		 //query = session.createQuery("from TeacherInfoHibernate ");
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
//

public List gethomeTeacheredit()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String abc="Teaching Staff";
		query = session.createQuery("from HomeWorkTeacherDailyTaskEntryHibernate GROUP BY teacherName");
		 //query = session.createQuery("from TeacherInfoHibernate ");
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
public List getAllMainTeacher1(HttpServletRequest request)
{	
	
	HttpSession usersession = request.getSession(true);
	String designation = (String)usersession.getAttribute("designation");
	//String designation = (String)userSession.getAttribute("designation");
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String abc="Teaching Staff";
		 query = session.createQuery("from TeacherInfoHibernate where designation='"+designation+"' ");
		 	/*
			 * query = session.
			 * createQuery("from TeacherInfoHibernate where designation IN('Principal', 'Teaching Staff', 'Non-Teaching Staff') "
			 * );
			 */
		 //query = session.createQuery("from TeacherInfoHibernate ");
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

//get teacher detail to edit
public List getAllTeacherDetailsForEdit(String designation) {

	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String TeachingStaff="TeachingStaff";
		 query = session.createSQLQuery("SELECT pk_teacher_id,designation,first_name,middle_name,last_name,date_of_birth,education,specialization,percentage,joining_date,mobile_number,landline_number,present_address,permanent_address,aadhar_number,account_number,bank_name,ifsc,pan_number,epf_number,pt_number,Salary FROM teacher_master WHERE designation =:designation ");
		// query = session.createSQLQuery("SELECT pk_teacher_id,designation,first_name,middle_name,last_name,date_of_birth,education,specialization,percentage,joining_date,mobile_number,landline_number,present_address,permanent_address,aadhar_number,account_number,bank_name,ifsc,pan_number,epf_number,pt_number,Salary FROM teacher_master WHERE designation =:designation AND pk_teacher_id =: "+fkTeacherId );
		query.setParameter("designation", designation);
		//query.setParameter("fkTeacherId", fkTeacherId);
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
	 System.out.println("out of dao - return getAllTeacherDetailsForEdit List : "+list);
			return list;

	
}


public List getAllTeacherDetailsForEdit1(Long fkTeacherId) {

	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String TeachingStaff="TeachingStaff";
		 //query = session.createSQLQuery("SELECT pk_teacher_id,designation,first_name,middle_name,last_name,date_of_birth,education,specialization,percentage,joining_date,mobile_number,landline_number,present_address,permanent_address,aadhar_number,account_number,bank_name,ifsc,pan_number,epf_number,pt_number,Salary FROM teacher_master WHERE designation =:designation ");
		 query = session.createSQLQuery("SELECT pk_teacher_id,designation,first_name,middle_name,last_name,date_of_birth,education,specialization,percentage,joining_date,mobile_number,landline_number,present_address,permanent_address,aadhar_number,account_number,bank_name,ifsc,pan_number,epf_number,pt_number,Salary FROM teacher_master WHERE pk_teacher_id ="+fkTeacherId );
		//query.setParameter("designation", designation);
		//query.setParameter("fkTeacherId", fkTeacherId);
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
	 System.out.println("out of dao - return getAllTeacherDetailsForEdit List : "+list);
			return list;

	
}



//get teacher detail to edit forby kishor
public List getAllTeacherDetailswiseForEdit(String designation) {

	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 /*String TeachingStaff="TeachingStaff";*/
		 query = session.createSQLQuery("SELECT pk_teacher_id,first_name,middle_name,last_name FROM teacher_master WHERE designation =:designation ");
		query.setParameter("designation", designation);
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
	 System.out.println("out of dao - return getAllTeacherDetailsForEdit List : "+list);
			return list;

	
}

		//Teacher List
		public List getAllTeacherDetailForList(){
		
			HibernateUtility hbu=null;
			Session session=null;
			List<GetTeacherDetailBean> custList=null;
		try{	
		
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		
			Query query=session.createSQLQuery("SELECT designation, first_name,middle_name,last_name,date_of_birth,education,specialization,percentage,joining_date,mobile_number,landline_number,aadhar_number,present_address,permanent_address,account_number,bank_name,ifsc,pan_number,epf_number,pt_number,Salary FROM teacher_master");
			//Query query = session.createQuery("from PurchaseBill2");
			List<Object[]> list = query.list();
		
			custList= new ArrayList<GetTeacherDetailBean>(0);
		
		    for (Object[] object : list) 
		    {	
				GetTeacherDetailBean reports = new GetTeacherDetailBean();
				
				reports.setDesignation(object[0].toString());
				reports.setFirstName(object[1].toString());
				reports.setMiddleName(object[2].toString());
				reports.setLastName(object[3].toString());
				
				String d = object[4].toString();
				String[] dt = d.split("-");
				String dob = dt[2]+"-"+dt[1]+"-"+dt[0];
				reports.setDob(dob);
				
				reports.setHquqlification(object[5].toString());
				reports.setSpecialization(object[6].toString());
				reports.setPercentage(Double.parseDouble(object[7].toString()));
				
				String d2 = object[4].toString();
				String[] dt2 = d2.split("-");
				String jDate = dt[2]+"-"+dt[1]+"-"+dt[0];
				reports.setJdate(jDate);
				
				reports.setMobnum(Long.parseLong(object[9].toString()));
				reports.setLandno(Long.parseLong(object[10].toString()));
				reports.setAadharNumber(object[11].toString());
				reports.setPreAddress(object[12].toString());
				reports.setPerAddress(object[13].toString());
				reports.setAccountNumber(object[14].toString());
				reports.setBankName(object[15].toString());
				reports.setIfsc(object[16].toString());
				reports.setPanNumber(object[17].toString());
				reports.setEpfNumber(object[18].toString());
				reports.setPtNumber(object[19].toString());
				reports.setSalary(object[20].toString());
				
				custList.add(reports);
			
		}}catch(RuntimeException e){	
		
		}
		finally{
		
		hbu.closeSession(session);	
		}
		return custList;
		
		}

//Teacher Detail Report Subject wise
public List<GetTeacherDetailsSubjecctWiseBean> getTeacherDetailReport(String fkteacherid) 
{

	System.out.println("*****"+fkteacherid);
	HibernateUtility hbu=null;
	Session session=null;
	List<GetTeacherDetailsSubjecctWiseBean> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		//Query query = session.createSQLQuery("SELECT t.first_name,t.middle_name,t.last_name,t.education,t.joining_date,t.mobile_number,c.class_name,c.division_name, c.subject_name from teacher_master t RIGHT OUTER JOIN class_division_subject_teacher_association c ON t.pk_teacher_id= c.pk_class_division_subject_teacher_association_id WHERE t.pk_teacher_id ='"+fkteacherid+"'");
		/*Query query = session.createSQLQuery("SELECT t.first_name,t.middle_name,t.last_name,t.education,t.joining_date,t.mobile_number,c.class_name,c.division_name, c.subject_name from teacher_master t  JOIN class_division_subject_teacher_association c  WHERE t.pk_teacher_id ='"+fkteacherid+"'");*/
		
		
//		Query query = session.createSQLQuery("SELECT t.first_name, t.middle_name,t.last_name, t.education,t.joining_date, t.mobile_number, c.class_name, c.division_name, c.subject_name FROM teacher_master t INNER JOIN class_division_subject_teacher_association c  ON pk_teacher_id = fk_teacher_id WHERE pk_teacher_id = '"+fkteacherid+"'");
		Query query = session.createSQLQuery("SELECT first_name,middle_name,last_name,education,joining_date,mobile_number from teacher_master WHERE pk_teacher_id = '"+fkteacherid+"'");		
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<GetTeacherDetailsSubjecctWiseBean>(0);
		
		
		for (Object[] object : list) {
			
			GetTeacherDetailsSubjecctWiseBean s = new GetTeacherDetailsSubjecctWiseBean();
			
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setHquqlification(object[3].toString());
			s.setJdate(object[4].toString());
			s.setMobnum(Long.parseLong(object[5].toString()));
/*			s.setClassName(object[6].toString());
			s.setDivision(object[7].toString());
			s.setSubject(object[8].toString());*/
			//s.setFkClassId(object[9].toString());
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

public void deleteemp(String empid) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 Transaction tx = null;
	 System.out.println("fk_subject_id in dAO - "+empid);
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("delete from teacher_leave where pk_Teacher_LeaveId ='"+empid+"'");
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

//Teacher Leave Details
public List getLeaveTeacherDetails()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SubjectInfoHibernate> list = null;
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
		 query = session.createQuery("from TeacherInfoLeaveHibernate ");
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


