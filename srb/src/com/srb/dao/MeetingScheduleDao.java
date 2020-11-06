package com.srb.dao;
import com.srb.bean.MeetingScheduleBean;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClassDivisionSubjectAssocBean;
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
	//parent meeting List
	public List getMeetingList(){

		
		HibernateUtility hbu=null;
		Session session=null;
		List<MeetingScheduleBean>custList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("select class_name, division_name,d.message,d.insert_date from division_master s, \r\n" + 
				"class_master m, parents_meetings d where d.fk_class_id = m.pk_class_id and \r\n" + 
				"d.fk_div_id = s.pk_division_id;");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();


		custList= new ArrayList<MeetingScheduleBean>(0);


	for (Object[] object : list) {	
		MeetingScheduleBean reports = new MeetingScheduleBean();
		reports.setClassName(object[0].toString());
		reports.setDivisionName(object[1].toString());
		reports.setMessage(object[2].toString());
		reports.setInsertDate(object[3].toString());
		custList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return custList;

	}
public List getMeetingListtoEdit(){

		
		HibernateUtility hbu=null;
		Session session=null;
		List<MeetingScheduleBean>custList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("select class_name, division_name,d.message,s.insert_date,d.pk_schedule_meetings_id,d.fk_class_id,d.fk_div_id from division_master s, \r\n" + 
				"class_master m, parents_meetings d where d.fk_class_id = m.pk_class_id and \r\n" + 
				"d.fk_div_id = s.pk_division_id;");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();


		custList= new ArrayList<MeetingScheduleBean>(0);


	for (Object[] object : list) {	
		MeetingScheduleBean reports = new MeetingScheduleBean();
		reports.setClassName(object[0].toString());
		reports.setDivisionName(object[1].toString());
		reports.setMessage(object[2].toString());
		reports.setInsertDate(object[3].toString());
		reports.setPkScheduleMeetingsId(Long.parseLong(object[4].toString()));
		reports.setFkclassId(Long.parseLong(object[5].toString()));
		reports.setFkDivId(Long.parseLong(object[6].toString()));
		custList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return custList;

	}

public List getParentMeetingForEdit1(Long pk_schedule_meetings_id){
	System.out.println("IN DAO");
	System.out.println(pk_schedule_meetings_id);
	HibernateUtility hbu = null;
	Session session =  null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String TeachingStaff="TeachingStaff";
		Query query1=session.createSQLQuery("select class_name, division_name,d.message,d.insert_date,d.pk_schedule_meetings_id,d.fk_class_id,d.fk_div_id from division_master s, \r\n" + 
		"class_master m, parents_meetings d where d.fk_class_id = m.pk_class_id and \r\n" + 
		"d.fk_div_id = s.pk_division_id  and  d.pk_schedule_meetings_id=:pk_schedule_meetings_id");				 
		query1.setParameter("pk_schedule_meetings_id",pk_schedule_meetings_id);
		 list = query1.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
	 System.out.println("out of dao - return getAllTeacherDetailsForEdit List : "+list);
			return list;

}

//delete parents Meeting
public void deletparentMeeting(String strpro_id) {
	Long pk_schedule_meetings_id = Long.parseLong(strpro_id);
	HibernateUtility hbu = null ;
	Transaction tx = null; 
	Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("DELETE FROM parents_meetings WHERE pk_schedule_meetings_id =:pk_schedule_meetings_id");
			query.setParameter("pk_schedule_meetings_id",pk_schedule_meetings_id);
			int seletedRecords = query.executeUpdate();
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
// schedule Meeting
public List getScheduleMeeting(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<MeetingScheduleBean>custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("select class_name, division_name,d.message,d.insert_date,d.pk_schedule_meetings_id,d.fk_class_id,d.fk_div_id from division_master s, \r\n" + 
			"class_master m, schedule_meetings d where d.fk_class_id = m.pk_class_id and \r\n" + 
			"d.fk_div_id = s.pk_division_id;");
	//Query query = session.createQuery("from PurchaseBill2");
	List<Object[]> list = query.list();


	custList= new ArrayList<MeetingScheduleBean>(0);


for (Object[] object : list) {	
	MeetingScheduleBean reports = new MeetingScheduleBean();
	reports.setClassName(object[0].toString());
	reports.setDivisionName(object[1].toString());
	reports.setMessage(object[2].toString());
	reports.setInsertDate(object[3].toString());
	reports.setPkScheduleMeetingsId(Long.parseLong(object[4].toString()));
	reports.setFkclassId(Long.parseLong(object[5].toString()));
	reports.setFkDivId(Long.parseLong(object[6].toString()));
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}
// delete Schedule Meetings
public void delScheduleMeeting(String strpro_id) {
	Long pk_schedule_meetings_id = Long.parseLong(strpro_id);
	HibernateUtility hbu = null ;
	Transaction tx = null; 
	Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("DELETE FROM schedule_meetings WHERE pk_schedule_meetings_id =:pk_schedule_meetings_id");
			query.setParameter("pk_schedule_meetings_id",pk_schedule_meetings_id);
			int seletedRecords = query.executeUpdate();
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

//edit schedule Meeting
public List getScheduleMeetingForEdit(Long pk_schedule_meetings_id){
	System.out.println("IN DAO");
	System.out.println(pk_schedule_meetings_id);
	HibernateUtility hbu = null;
	Session session =  null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String TeachingStaff="TeachingStaff";
		Query query1=session.createSQLQuery("select class_name, division_name,d.message,d.insert_date,d.pk_schedule_meetings_id,d.fk_class_id,d.fk_div_id from division_master s, \r\n" + 
		"class_master m, schedule_meetings d where d.fk_class_id = m.pk_class_id and \r\n" + 
		"d.fk_div_id = s.pk_division_id  and  d.pk_schedule_meetings_id=:pk_schedule_meetings_id");				 
		query1.setParameter("pk_schedule_meetings_id",pk_schedule_meetings_id);
		 list = query1.list(); 
	} catch (RuntimeException e) {
		e.printStackTrace();
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
	 System.out.println("out of dao - return getAllTeacherDetailsForEdit List : "+list);
			return list;

}



}

