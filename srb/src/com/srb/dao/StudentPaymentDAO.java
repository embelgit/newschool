package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.StudentCashBankBookHibernate;
import com.srb.utility.HibernateUtility;

public class StudentPaymentDAO {

	//add student payment
	public void addStudentPayment(StudentCashBankBookHibernate bean) {
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(bean);
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

	// to get Payment receipt number
	public List getPaymentReceiptNumber() {
		
		HibernateUtility hbu=null;
		Session session=null;
		List<StudentCashBankBookHibernate> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT payment_receipt_number , pk_student_payment_id FROM student_payment ORDER BY payment_receipt_number DESC LIMIT 1");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<StudentCashBankBookHibernate>(0);
			for (Object[] object : list) {
				StudentCashBankBookHibernate reports = new StudentCashBankBookHibernate();
				reports.setPaymentReceiptNumber(Long.parseLong(object[0].toString()));
				saleList.add(reports);	 
		}}
		catch(RuntimeException e)
		{
			System.out.println("error in getPaymentReceiptNumber() in studentPaymentDAO");
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return saleList;
		
	}

}
