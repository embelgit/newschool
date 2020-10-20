package com.srb.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.StudentScannedDocumentUploadHibernate;
import com.srb.utility.HibernateUtility;

public class StudentScannedDocumentDao {

	public void addStudentScanDocuments(StudentScannedDocumentUploadHibernate b) {
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
		}
		finally{
		hbu.closeSession(session);
		}
	
		
	}

}
