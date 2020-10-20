package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.hibernate.LibraryPaymentBean;
import com.srb.hibernate.SupplierPaymentBean;
import com.srb.utility.HibernateUtility;

public class LibraryPaymentDao {
public void regSupPayment(LibraryPaymentBean bean) {
		
		HibernateUtility hbu   = null;
		Session session =null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			 session.save(bean);
			 transaction.commit();
			 System.out.println("Successful saved - ");
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

//get latest Transaction number in supplier_payment
	public List getlibraryPaymentTxid() {
		HibernateUtility hbu=null;
		Session session=null;
		List<LibraryPaymentBean> Txidlist=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT pk_supplier_payment_id, transaction_id  FROM library_payment ORDER BY transaction_id DESC LIMIT 1");

			List<Object[]> list = query.list();
			Txidlist= new ArrayList<LibraryPaymentBean>(0);
			for (Object[] object : list) {
				LibraryPaymentBean reports = new LibraryPaymentBean();
				reports.setPkSupPaymentId(Long.parseLong(object[0].toString()));
				reports.setTxId(Long.parseLong(object[1].toString()));
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
}
