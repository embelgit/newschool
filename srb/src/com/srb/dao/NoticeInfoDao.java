package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.ExamTimeTableHibernate;
import com.srb.hibernate.NoticeInfoHibernate;
import com.srb.utility.HibernateUtility;

public class NoticeInfoDao {
public void NoticeInfoHibernate(NoticeInfoHibernate nif){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
			System.out.println("In tacher DAO");
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(nif);
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

public List getnoticeList()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	List<NoticeInfoHibernate> supList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("select pk_notice_id,str_class_name,str_division,str_academic_year,dt_notice_date,str_task_in_text from notice");
	List<Object[]> list = query.list();


	supList= new ArrayList<NoticeInfoHibernate>(0);


for (Object[] o : list) 
{	
	NoticeInfoHibernate r = new NoticeInfoHibernate();
	System.out.println("result - "+Arrays.toString(o));
	r.setPkNoticeId(Long.parseLong(o[0].toString()));
	r.setClassName(o[1].toString());
	r.setDivision(o[2].toString());
	r.setAcademicYear(o[3].toString());
	r.setNoticeDate((Date)o[4]);
	r.setTask(o[5].toString());
	supList.add(r);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return supList;
}
public void delNoticeDetails(String TransportId1) {
	Long pk_notice_id = Long.parseLong(TransportId1);
	HibernateUtility hbu = null ;
	Transaction tx = null; 
	Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("DELETE FROM notice WHERE pk_notice_id =:pk_notice_id");
			query.setParameter("pk_notice_id",pk_notice_id);
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









}
