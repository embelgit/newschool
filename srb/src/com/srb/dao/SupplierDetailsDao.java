package com.srb.dao;

import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.GetSupplierDetails;
import com.srb.hibernate.SupplierDetailsBean;
import com.srb.utility.HibernateUtility;
public class SupplierDetailsDao {

	public List getAllSupplier()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from SupplierDetailsBean");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllSupllier", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}

	public void valSupplierDetails(SupplierDetailsBean sdb) {
		
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		try{
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
	
				 System.out.println("Tx started");
				session.save(sdb);
				transaction.commit();
				System.out.println("Successful");
		}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		}finally{
		hbu.closeSession(session);
		}

		
	}
	
	// get supplier List
public List getSupplierList(){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<GetSupplierDetails> supList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT supplier_name, city, contact_no, alternate_no, email_id, contact_person_name, address,pk_supplier_id from supplier_details");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();


		supList= new ArrayList<GetSupplierDetails>(0);


	for (Object[] object : list) {	
		GetSupplierDetails reports = new GetSupplierDetails();
		reports.setDealerName(object[0].toString());
		reports.setCity(object[1].toString());
		reports.setContactNo((BigInteger)object[2]);
		//reports.setLandline((BigInteger)object[3]);
		reports.setEmail(object[4].toString());
		reports.setPersonName(object[5].toString());
		//reports.setTin(object[6].toString());
		reports.setAddress(object[6].toString());
		reports.setSupId(Long.parseLong(object[7].toString()));
		
		
		supList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return supList;
	}

// edit supplier by kishor 
public List getAllSupplierSetailsForEdit(String supplierID) {


	System.out.println("into dao supplier : "+supplierID);
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("select supplier_name, city, contact_no, alternate_no, contact_person_name, address, email_id, Id_No,tin_no from supplier_details WHERE pk_supplier_id ='"+supplierID+"'");
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

//delete supplier by kishor

public void deleteSupplier(String supplier) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("delete from supplier_details where pk_supplier_id="+supplier);
			int seletedRecords = query.executeUpdate();
			System.out.println("Number of credit Cusr deleted == + ="+seletedRecords);
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
