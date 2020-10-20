package com.srb.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetSchoolDetailBean;
import com.srb.bean.Sportinfo;
import com.srb.hibernate.SchoolInfoHibernate;

import com.srb.hibernate.SportInfoHibernate;
import com.srb.hibernate.SportParticipantDetails;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.utility.HibernateUtility;

public class SportInfoDao {
	
public void SportInfoHibernate (SportInfoHibernate scf){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(scf);
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

//list of sport details
public List getAllSportDetailForList(){

	HibernateUtility hbu=null;
	Session session=null;
	List<SportInfoHibernate> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("select Create_activity,Activity_details,Organize_by,other_details from sport_master");
	//Query query = session.createQuery("from PurchaseBill2");
	List<Object[]> list = query.list();


	custList= new ArrayList<SportInfoHibernate>(0);

for (Object[] object : list) {	
	SportInfoHibernate reports = new SportInfoHibernate();
	reports.setCreateactivity((object[0].toString()));
	reports.setActivitydetails(object[1].toString());
	reports.setOrganizeby((object[2].toString()));
	reports.setOtherdetails((object[3].toString()));
	
	
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}
//get all sport for edit
public List getAllSport()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<SportInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from SportInfoHibernate");
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
			return list;
	
}

//particiapnt
public List getAllSportparticipantForList(){

	HibernateUtility hbu=null;
	Session session=null;
	List<SportParticipantDetails> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("select Pk_Sport_Participant, firstName,middleName,LastName,Lose,win,Award,Sport_Participant,start_date,end_date from sportparticipant_details");
	//Query query = session.createQuery("from PurchaseBill2");
	List<Object[]> list = query.list();


	custList= new ArrayList<SportParticipantDetails>(0);

for (Object[] o : list) {	
	SportParticipantDetails r = new SportParticipantDetails();
	r.setPkSportParticipant(Long.parseLong(o[0].toString()));
	r.setFirstName(o[1].toString());
	r.setMiddleName(o[2].toString());
	r.setLastName(o[3].toString());
	r.setLose(o[4].toString());
	r.setWin(o[5].toString());
	r.setAward(o[6].toString());
	r.setSportParticipant(o[7].toString());
	r.setStartdate((Date)o[8]);
	r.setEnddate((Date)o[9]);
	
	custList.add(r);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}

//get all sport all details to edit
public List getAllSportDetailsForEdit(String pkSportId) {
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("select pk_sport_id,Create_activity,Activity_details,Organize_by,other_details from sport_master  where pk_sport_id=:pkSportId");
		 query.setParameter("pkSportId", pkSportId);
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
			return list;

}
public List getSportDetail( String fk_class_id, String fk_division_id) {
	HibernateUtility hbu=null;
	Session session=null;
	List<Sportinfo> list  = null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("Select pk_student_id,first_name,middle_name,last_name from student_master where   fk_class_id='"+fk_class_id+"' and fk_division_id = '"+fk_division_id+"'");
		 
		// list = query.list();
		
		List<Object[]> list1 = query.list();
		list = new ArrayList<Sportinfo>(0);
		for (Object[] o : list1) {
			Sportinfo bean = new Sportinfo();
			bean.setPkSportid(Long.parseLong(o[0].toString()));
			bean.setFirstName(o[1].toString());
			bean.setMiddleName(o[2].toString());
			bean.setLastName(o[3].toString());
			/*bean.setPkBookId(o[4].toString());
			bean.setQuantityInGrid(1l);*/
			//map1.put(bean.getPkBookId(),bean);
		

			list.add(bean);
		}
		 
		System.out.println(list.size()+"*************");
		}catch(RuntimeException e){
			
		e.printStackTrace();
	}finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
	
	return list;


}

}
