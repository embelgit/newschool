package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetStudentDetailsBean;
import com.srb.bean.GetTransportationDetails;
import com.srb.bean.TeacherLeavebean;
import com.srb.hibernate.TeacherInfoHibernate;
import com.srb.hibernate.TeacherInfoLeaveHibernate;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.utility.HibernateUtility;

public class TeacherInfoLeaveDao {

	
public void TeacherInfoLeaveHibernateDetails(TeacherInfoLeaveHibernate tif){
		
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

// TransportionDetailsOFStrudents
public void TransportionDetailsOFStrudents(TrasnpotationSchollBus tsb){
	
	HibernateUtility hbu=null;
	Session session=null;
	Transaction transaction=null;
	
	try{
		System.out.println("In tacher DAO");
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 transaction = session.beginTransaction();

	
	session.save(tsb);
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

//get All student detail for list
public List getAllTeacherLeaveList(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<TeacherLeavebean> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	String abc ="Y";
	Query query=session.createSQLQuery("select pk_Teacher_LeaveId,tm.first_name,tm.middle_name,tm.last_name,Leave_Type,First_Date,Last_Date,ApprovedBy,Description from teacher_leave join teacher_master tm on Fk_Teacher_id = tm.pk_teacher_id ");
	//Query query = session.createQuery("from PurchaseBill2");
	//query.setParameter("abc", abc);
	List<Object[]> list = query.list();


	custList= new ArrayList<TeacherLeavebean>(0);


for (Object[] object : list) 
{	
	
	TeacherLeavebean reports = new TeacherLeavebean();
	
	//reports.setPkleaveId(object[0].toString());
	//System.out.println(""+(object[0].toString()));
	
	reports.setFirstName(object[1].toString());
	System.out.println(""+(object[1].toString()));
	
	reports.setMiddleName(object[2].toString());
	System.out.println(""+(object[2].toString()));
	
	reports.setLastName(object[3].toString());
	System.out.println(""+(object[3].toString()));
	
	reports.setLeavetype(object[4].toString());
	System.out.println(""+(object[4].toString()));
	
	reports.setFirstDate(object[5].toString());
	System.out.println(""+(object[5].toString()));
	
	reports.setLastDate(object[6].toString());
	System.out.println(""+(object[6].toString()));
	
	reports.setApprovedby(object[7].toString());
	System.out.println(""+(object[7].toString()));
	reports.setDescription(object[8].toString());
	System.out.println(""+(object[8].toString()));
	
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}

// Transportaion Details Reports 

//get All student detail for list
public List getAllTransportaionDetailsList(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<GetTransportationDetails> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	String abc ="Y";
			/*
			 * Query query=session.
			 * createSQLQuery("select sm.first_name,sm.middle_name,sm.last_name,cm.class_name,dm.division_name,leave_DateFrom,leaveDate_To,Contact_No,Pincode,payement,Address from trasnpotation_school_bus join student_master sm join class_master cm join division_master dm on studentName = sm.pk_student_id and fk_class_id1 = cm.pk_class_id  "
			 * );
			 */
	Query query=session.createSQLQuery("select sm.first_name,sm.middle_name,sm.last_name,cm.class_name,dm.division_name,leave_DateFrom,leaveDate_To,Contact_No,Pincode,payement,Address from trasnpotation_school_bus join student_master sm join class_master cm join division_master dm on studentName = sm.pk_student_id and fk_class_id1 = cm.pk_class_id and fk_division_id1 = dm.pk_division_id ");
	//Query query = session.createQuery("from PurchaseBill2");
	//query.setParameter("abc", abc);
	List<Object[]> list = query.list();


	custList= new ArrayList<GetTransportationDetails>(0);


for (Object[] object : list) 
{	
	
	GetTransportationDetails reports = new GetTransportationDetails();

	
	
	reports.setFirstName(object[0].toString());
	reports.setMiddleName(object[1].toString());
	reports.setLastName(object[2].toString());
	reports.setClassName(object[3].toString());
	reports.setDivisionName(object[4].toString());
	reports.setLeaveDateFrom(object[5].toString());
	System.out.println(reports.getLeaveDateFrom());
	reports.setLeaveDateTo(object[6].toString());
	System.out.println(reports.getLeaveDateTo());
	reports.setContactNo(Long.parseLong(object[7].toString()));
	reports.setPincode(Long.parseLong(object[8].toString()));
	reports.setPayement(Double.parseDouble(object[9].toString()));
	reports.setAddress(object[10].toString());
	
	//reports.setPkleaveId(object[0].toString());
	//System.out.println(""+(object[0].toString()));
	
				/*
				 * reports.setFirstName(object[1].toString());
				 * System.out.println(""+(object[1].toString()));
				 * 
				 * reports.setMiddleName(object[2].toString());
				 * System.out.println(""+(object[2].toString()));
				 * 
				 * reports.setLastName(object[3].toString());
				 * System.out.println(""+(object[3].toString()));
				 * 
				 * reports.setLeavetype(object[4].toString());
				 * System.out.println(""+(object[4].toString()));
				 * 
				 * reports.setFirstDate(object[5].toString());
				 * System.out.println(""+(object[5].toString()));
				 * 
				 * reports.setLastDate(object[6].toString());
				 * System.out.println(""+(object[6].toString()));
				 * 
				 * reports.setApprovedby(object[7].toString());
				 * System.out.println(""+(object[7].toString()));
				 * reports.setDescription(object[8].toString());
				 * System.out.println(""+(object[8].toString()));
				 */
	
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}

//
public List getAllteacherForEdit(Long teachid) {

	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("select First_Date,Leave_Type,Last_Date,Description,ApprovedBy ,pk_Teacher_LeaveId  from teacher_leave WHERE pk_Teacher_LeaveId = '"+teachid+"'");
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

}
