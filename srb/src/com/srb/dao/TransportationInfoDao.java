package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Query;
import org.hibernate.Session;

import com.srb.bean.GetTransportationDetails;
import com.srb.bean.SuppliersPaymentBean;
import com.srb.bean.TrasnpotationSchollBusBean;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.utility.HibernateUtility;

public class TransportationInfoDao {
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
	
	public List getAllTransportaionDetailsLists(){

		
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
		Query query=session.createSQLQuery("select q.first_name,q.middle_name,q.last_name,m.class_name,s.division_name,d.leave_DateFrom,d.leaveDate_To,d.Contact_No,d.Pincode,d.payement,d.Address from division_master s, \r\n" + 
				"class_master m, trasnpotation_school_bus d, student_master q \r\n" + 
				"where d.fk_class_id1 = m.pk_class_id and \r\n" + 
				"d.fk_division_id1 = s.pk_division_id  and q.pk_student_id=d.studentID;");
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
	finally{if (session!=null) {
		hbu.closeSession(session);
	}		}
	return custList;

	}
	//List to delete
public List getToDeleteTransportaionDetailsLists(){

		
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
		Query query=session.createSQLQuery("select pk_Trasnpotation_Scholl_BusId,studentName,Contact_No from trasnpotation_school_bus;");
		//Query query = session.createQuery("from PurchaseBill2");
		//query.setParameter("abc", abc);
		List<Object[]> list = query.list();


		custList= new ArrayList<GetTransportationDetails>(0);


	for (Object[] object : list) 
	{	
		
		GetTransportationDetails reports = new GetTransportationDetails();
		reports.setPkTranspaymentId(Long.parseLong(object[0].toString()));
		reports.setStudentName(object[1].toString());
		reports.setContactNo(Long.parseLong(object[2].toString()));
			System.out.println(""+(object[0]).toString());
			System.out.println(""+(object[1]).toString());
			System.out.println(""+(object[2]).toString());
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
//delte Transportation Details
public void deletTransport(String TransportId1) {
	Long pk_Trasnpotation_Scholl_BusId = Long.parseLong(TransportId1);
	HibernateUtility hbu = null ;
	org.hibernate.Transaction tx = null; 
	Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("DELETE FROM trasnpotation_school_bus WHERE pk_Trasnpotation_Scholl_BusId =:pk_Trasnpotation_Scholl_BusId");
			query.setParameter("pk_Trasnpotation_Scholl_BusId",pk_Trasnpotation_Scholl_BusId);
			int seletedRecords = query.executeUpdate();
			System.out.println("Number of credit Cusr deleted = = "+seletedRecords);
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

public List getListToEditTransportaionDetails(){

	
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
	Query query=session.createSQLQuery("select pk_Trasnpotation_Scholl_BusId,studentName,Contact_No from trasnpotation_school_bus;");
	//Query query = session.createQuery("from PurchaseBill2");
	//query.setParameter("abc", abc);
	List<Object[]> list = query.list();


	custList= new ArrayList<GetTransportationDetails>(0);


for (Object[] object : list) 
{

	GetTransportationDetails reports = new GetTransportationDetails();
	reports.setPkTranspaymentId(Long.parseLong(object[0].toString()));
	reports.setStudentName(object[1].toString());
	reports.setContactNo(Long.parseLong(object[2].toString()));
		System.out.println(""+(object[0]).toString());
		System.out.println(""+(object[1]).toString());
		System.out.println(""+(object[2]).toString());
	 custList.add(reports);
}}catch(RuntimeException e){	

}
finally{ if (session!=null) {
	hbu.closeSession(session);
}	
}
return custList;

}
//get Transportation Payment Details
public List getTransportationPaymentList()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	List<TrasnpotationSchollBusBean> supList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT balanceAmountT,paidAmountT, studentName, insert_date, totalAnnualFee, personnameT, paymentMode3 FROM trasnportdetails_payment where transaction_id > 0");
	List<Object[]> list = query.list();


	supList= new ArrayList<TrasnpotationSchollBusBean>(0);


for (Object[] o : list) 
{	
	TrasnpotationSchollBusBean reports = new TrasnpotationSchollBusBean();
	reports.setBalanceAmountT(Double.parseDouble(o[0].toString()));
	reports.setPaidAmountT(Double.parseDouble(o[1].toString()));
	reports.setStudentName(o[2].toString());
	reports.setInsertDate(o[3].toString());
	reports.setTotalAnnualFee(Double.parseDouble(o[4].toString()));
	reports.setPersonnameT(o[5].toString());
	reports.setPaymentMode3(o[6].toString());
	//reports.setBankName(o[7].toString());
	supList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return supList;
}
//get Transportation payment List to delete
public List getTransportPaymentListtoDelete()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	List<TrasnpotationSchollBusBean> supList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT studentName, paidAmountT,pkTranspayment_Id FROM trasnportdetails_payment where transaction_id > 0");
	List<Object[]> list = query.list();


	supList= new ArrayList<TrasnpotationSchollBusBean>(0);


for (Object[] o : list) 
{	
	TrasnpotationSchollBusBean reports = new TrasnpotationSchollBusBean();
	reports.setPkTranspaymentId(Long.parseLong(o[2].toString()));
	reports.setStudentName(o[0].toString());
	reports.setPaidAmountT(Double.parseDouble(o[1].toString()));
	supList.add(reports);
}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return supList;
}
//Transportation Transaction Delete
public void deletTransportPayment(String TransportId1) {
	Long pkTranspayment_Id = Long.parseLong(TransportId1);
	HibernateUtility hbu = null ;
	org.hibernate.Transaction tx = null; 
	Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("DELETE FROM trasnportdetails_payment WHERE pkTranspayment_Id =:pkTranspayment_Id");
			query.setParameter("pkTranspayment_Id",pkTranspayment_Id);
			int seletedRecords = query.executeUpdate();
			System.out.println("Number of credit Cusr deleted = = "+seletedRecords);
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




}
