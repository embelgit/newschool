package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.SuppliersPaymentBean;
import com.srb.hibernate.LibraryPaymentBean;
import com.srb.hibernate.StoreManagementHibernate;
import com.srb.hibernate.SupplierPaymentBean;
import com.srb.utility.HibernateUtility;

public class SupplierPaymentDao {

public void regSupPayment(SupplierPaymentBean bean) {
		
		HibernateUtility hbu   = null;
		Session session =null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			 session.save(bean);
			 transaction.commit();
			 System.out.println("Successful");
		} catch (RuntimeException e) {
			
			try {
				transaction.rollback();
			} catch (RuntimeException e2) {
				
				Log.error("Error in regSupPayment", e2);
			}
		}
		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		
	}
//hostel
public void regSupPayment1(SupplierPaymentBean bean) {
	
	HibernateUtility hbu   = null;
	Session session =null;
	Transaction transaction = null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		transaction = session.beginTransaction();
		 session.save(bean);
		 transaction.commit();
		 System.out.println("Successful");
	} catch (RuntimeException e) {
		
		try {
			transaction.rollback();
		} catch (RuntimeException e2) {
			
			Log.error("Error in regSupPayment", e2);
		}
	}
	finally
	{
		if (session!=null) {
			hbu.closeSession(session);
		}
	}
	
}


// get Last Bill No 
public List getLastBillNo() {
	// TODO Auto-generated method stub
	HibernateUtility hbu=null;
	Session session=null;
	List<StoreManagementHibernate> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 String abc ="0.00";
	 Query query = session.createSQLQuery("SELECT bill_no ,pk_vendor_payment_id FROM vendor_payment where payment!=:abc ORDER BY pk_vendor_payment_id DESC LIMIT 1");
	query.setParameter("abc", abc);
	 
		List<Object[]> list = query.list();
		 saleList= new ArrayList<StoreManagementHibernate>(0);
		for (Object[] object : list) {
			System.out.println(Arrays.toString(object));
			StoreManagementHibernate reports = new StoreManagementHibernate();
			reports.setBillNo(Double.parseDouble(object[0].toString()));
			saleList.add(reports);	 
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}finally
	{if(session!=null){
		session.close();	
	}
	}
	return saleList;
}


//get latest Transaction number in supplier_payment
	public List getSupplierPaymentTxid() {
		HibernateUtility hbu=null;
		Session session=null;
		List<SupplierPaymentBean> Txidlist=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT transaction_id , supplier FROM supplier_payment ORDER BY transaction_id DESC LIMIT 1");

			List<Object[]> list = query.list();
			Txidlist= new ArrayList<SupplierPaymentBean>(0);
			for (Object[] object : list) {
				SupplierPaymentBean reports = new SupplierPaymentBean();
				reports.setTxId(Long.parseLong(object[0].toString()));
				Txidlist.add(reports);	 
			}}
		catch(RuntimeException e)
		{
			Log.error("Error in getCustomerBill()", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return Txidlist;	
	}



			//get Supplier Payment List
			public List getSupplierPaymentList()
			{
				
				HibernateUtility hbu=null;
				Session session=null;
				List<SuppliersPaymentBean> supList=null;
			try{	
		
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		
				Query query=session.createSQLQuery("SELECT supplier, bill_no, total_amount, balance, paid_amount, person_name, paymentType, cheque_num, card_num, acc_num, bank_name, name_on_check FROM supplier_payment where transaction_id > 0");
				List<Object[]> list = query.list();
		
		
				supList= new ArrayList<SuppliersPaymentBean>(0);
		
		
			for (Object[] o : list) 
			{	
				SuppliersPaymentBean reports = new SuppliersPaymentBean();
				
				reports.setSupplierName(o[0].toString());
				reports.setBillNo(o[1].toString());
				reports.setTotalAmount(o[2].toString());
				reports.setBalance(o[3].toString());
				reports.setPaidAmount(o[4].toString());
				reports.setPersonName(o[5].toString());
				reports.setPaymentType(o[6].toString());
				reports.setChequeNum(o[7].toString());
				reports.setCardNum(o[8].toString());
				reports.setAccNum(o[9].toString());
				reports.setBankName(o[10].toString());
				reports.setNameOnCheck(o[11].toString());
				
				supList.add(reports);
		
			}}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
			return supList;
			}
	//libray pay
			public List getlibraryPaymentList()
			{
				
				HibernateUtility hbu=null;
				Session session=null;
				List<LibraryPaymentBean> supList=null;
			try{	
		
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		
				Query query=session.createSQLQuery("SELECT supplier, bill_no, total_amount, balance, paid_amount, person_name, paymentType, cheque_num, card_num, acc_num, bank_name, name_on_check FROM library_payment where transaction_id > 0");
				List<Object[]> list = query.list();
		
		
				supList= new ArrayList<LibraryPaymentBean>(0);
		
		
			for (Object[] o : list) 
			{	
				LibraryPaymentBean reports = new LibraryPaymentBean();
				
				reports.setSupplier(o[0].toString());
				reports.setBillNo(Double.parseDouble(o[1].toString()));
				reports.setTotalAmount(Double.parseDouble(o[2].toString()));
				reports.setBalance(Double.parseDouble(o[3].toString()));
				reports.setPaidAmount(Double.parseDouble(o[4].toString()));
				reports.setPersonname(o[5].toString());
				reports.setPaymentType(o[6].toString());
				reports.setChequeNum(o[7].toString());
				reports.setCardNum(Long.parseLong(o[8].toString()));
				reports.setAccNum(Long.parseLong(o[9].toString()));
				reports.setBankName(o[10].toString());
				reports.setNameOnCheck(o[11].toString());
				
				supList.add(reports);
		
			}}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
			return supList;
			}

			//getting bill no as per supplier payment
			public List getBillasperSupplier(String classId)
			{
				Long fk_supplier_id=Long.parseLong(classId);
				HibernateUtility hbu = null ;
				Session session = null;
				List list  = null;
				
				try 
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query = session.createSQLQuery("SELECT DISTINCT\r\n" + 
							"    bill_no,fk_supplier_id\r\n" + 
							"FROM\r\n" + 
							"    supplier_payment WHERE fk_supplier_id = '"+fk_supplier_id+"' ");
			
					list = query.list();
			
					System.out.println("----- LIST -DAO---- jsp  ::  "+list.size());
					
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
					hbu.closeSession(session);
				}
				
				System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

				return list;
				
				
			}

			//delete supplier payment
			public List getSupplierPaymentListtoDelete()
			{
				
				HibernateUtility hbu=null;
				Session session=null;
				List<SuppliersPaymentBean> supList=null;
			try{	
		
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		
				Query query=session.createSQLQuery("SELECT supplier, bill_no, pk_supplier_payment_id FROM supplier_payment where transaction_id > 0");
				List<Object[]> list = query.list();
		
		
				supList= new ArrayList<SuppliersPaymentBean>(0);
		
		
			for (Object[] o : list) 
			{	
				SuppliersPaymentBean reports = new SuppliersPaymentBean();
				
				reports.setSupplierName(o[0].toString());
				reports.setBillNo(o[1].toString());
				reports.setSupId(Long.parseLong(o[2].toString()));
				supList.add(reports);
			}}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
			return supList;
			}
// delete supplier payment
			public void deletsupplierPayment(String TransportId1) {
				Long pk_supplier_payment_id= Long.parseLong(TransportId1);
				HibernateUtility hbu = null ;
				Transaction tx = null; 
				Session session = null;
				 List list  = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 tx = session.beginTransaction();
						Query query = session.createSQLQuery("DELETE FROM supplier_payment WHERE pk_supplier_payment_id =:pk_supplier_payment_id");
						query.setParameter("pk_supplier_payment_id",pk_supplier_payment_id);
						int seletedRecords = query.executeUpdate();
						System.out.println("Deleted Successfully");
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

//get Library Payment to Delete
			public List getlibraryPaymentListtoDelete()
			{
				
				HibernateUtility hbu=null;
				Session session=null;
				List<LibraryPaymentBean> supList=null;
			try{	
		
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		
				Query query=session.createSQLQuery("SELECT supplier, bill_no, paid_amount,pk_supplier_payment_id FROM library_payment where transaction_id > 0");
				List<Object[]> list = query.list();
		
		
				supList= new ArrayList<LibraryPaymentBean>(0);
		
		
			for (Object[] o : list) 
			{	
				LibraryPaymentBean reports = new LibraryPaymentBean();
				
				reports.setSupplier(o[0].toString());
				reports.setBillNo(Double.parseDouble(o[1].toString()));
				reports.setPaidAmount(Double.parseDouble(o[2].toString()));
				reports.setPkSupPaymentId(Long.parseLong(o[3].toString()));
				supList.add(reports);
		
			}}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
			return supList;
			}

			
}
