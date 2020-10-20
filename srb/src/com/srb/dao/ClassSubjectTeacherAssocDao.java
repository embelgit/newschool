package com.srb.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.ClassSubjectTeacherAssocHibernate;
import com.srb.utility.HibernateUtility;

public class ClassSubjectTeacherAssocDao {

public void ClassSubjectTeacherAssocHibernate(ClassSubjectTeacherAssocHibernate cst){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(cst);
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

}