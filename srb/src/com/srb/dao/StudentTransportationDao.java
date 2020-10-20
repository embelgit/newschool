package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.hibernate.TrasnportDetailsHibernate;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.utility.HibernateUtility;

public class StudentTransportationDao {

	
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
	// Transport Payment 
	public void TrasnportDetailsPaymantSave(TrasnportDetailsHibernate tdh){
		HibernateUtility hbu=null;
		Session session =null;
		Transaction transaction=null;
		
		
		try{
			System.out.println("In Dao");
			hbu= HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(tdh);
			transaction.commit();
			
		}
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe){
				rbe.printStackTrace();
			}
			finally{
				hbu.closeSession(session);
			}
			
		}
		
	}
	

	//get latest Transaction number in Expanduture_payment
	public List getTransactionPaymentTxid() {
		HibernateUtility hbu=null;
		Session session=null;
		List<TrasnportDetailsHibernate> Txidlist=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT transaction_id , personnameT FROM trasnportdetails_payment ORDER BY transaction_id DESC LIMIT 1");

			List<Object[]> list = query.list();
			Txidlist= new ArrayList<TrasnportDetailsHibernate>(0);
			for (Object[] object : list) {
				
				TrasnportDetailsHibernate bean=new TrasnportDetailsHibernate();
				bean.setTxid(Long.parseLong(object[0].toString()));
				bean.setPersonnameT(object[1].toString());
				Txidlist.add(bean);	 
			}}
		catch(RuntimeException e)
		{
			Log.error("Error in getTransactionNo()", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return Txidlist;	
	}	
	
	
	// get school detail to edit
	public List getAllTransportationDetailsForEdit(Long pkTrasnpotationSchollBusId) {

		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("SELECT pk_Trasnpotation_Scholl_BusId,Driver_Name,leave_DateFrom,Contact_No,leaveDate_To,Pincode,payement,Address FROM trasnpotation_school_bus WHERE pk_Trasnpotation_Scholl_BusId ="+pkTrasnpotationSchollBusId);
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
