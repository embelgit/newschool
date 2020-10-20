package com.srb.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.MeetingScheduleHibernate;
import com.srb.hibernate.MeetingScheduleHibernateparents;
import com.srb.utility.HibernateUtility;

public class MeetingScheduleDao {

	//add meeting scheduled
	public void addScheduleMeetings(MeetingScheduleHibernate b) {
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
		}finally{
		hbu.closeSession(session);
		}
	
		
	}

	
	// add meetiing parents 
	
	public void addScheduleMeetingsParents(MeetingScheduleHibernateparents  b) {
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
		}finally{
		hbu.closeSession(session);
		}
	
		
	}
}
