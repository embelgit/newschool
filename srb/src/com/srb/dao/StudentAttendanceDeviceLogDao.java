package com.srb.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.StudentAttendanceDeviceLogHibernate;
import com.srb.utility.HibernateUtility;

public class StudentAttendanceDeviceLogDao {

	public void addstudentAttendanceLog(StudentAttendanceDeviceLogHibernate bean) {
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

}
