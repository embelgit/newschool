package com.srb.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.ExamNameEntryHibernate;
import com.srb.utility.HibernateUtility;

public class ExamNameEntryDao {
public void ExamNameEntryHibernate( ExamNameEntryHibernate exname){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(exname);
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
