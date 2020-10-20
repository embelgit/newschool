package com.srb.dao;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClassDivisionSubjectAssocBean;
import com.srb.bean.GetSchoolDetailBean;
import com.srb.hibernate.ClassInfoHibernate;
import com.srb.hibernate.DivisionInfoHibernate;
import com.srb.utility.HibernateUtility;

public class DivisionInfoDao {

public void  DivisionInfoHibernate(DivisionInfoHibernate dif){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(dif);
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
	

public List getAllMainDivision()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<DivisionInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		/*String abc="division";*/
//		 query = session.createQuery("from DivisionInfoHibernate GROUP BY  division");
		 query = session.createQuery("from DivisionInfoHibernate");
		 list = query.list(); 
		 System.out.println("list size div - "+query.list().size());
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
//
public List getAllMainDivision10()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<DivisionInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		/*String abc="division";*/
//		 query = session.createQuery("from DivisionInfoHibernate GROUP BY  division");
		 query = session.createQuery("from HomeWorkTeacherDailyTaskEntryHibernate GROUP BY  division");
		 list = query.list(); 
		 System.out.println("list size div - "+query.list().size());
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

public List getAllDivDetailsForEdit(Long fkclassId, String divisionId) {
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT pk_division_id,room_number FROM division_master WHERE division_name ='"+divisionId+"' AND fk_cat_id ="+fkclassId );
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

public List getAllDivDetailForList(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<ClassDivisionSubjectAssocBean> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT d.pk_division_id,c.class_name,d.division_name,d.room_number FROM division_master d LEFT JOIN class_master c ON d.fk_cat_id = c.pk_class_id");
	//Query query = session.createQuery("from PurchaseBill2");
	List<Object[]> list = query.list();


	custList= new ArrayList<ClassDivisionSubjectAssocBean>(0);


for (Object[] object : list) {	
	ClassDivisionSubjectAssocBean reports = new ClassDivisionSubjectAssocBean();
	reports.setClassName(object[1].toString());
	reports.setDivision(object[2].toString());
	reports.setClassRoomNumber(object[3].toString());
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}

//del
public void deletediv(String fk_class_id, String division) {
	
	
	System.out.println("In delete grid data method of temp DAO tempID is --- >  "+fk_class_id);
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	Transaction transaction = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
			Query query = session.createSQLQuery("delete from division_master WHERE fk_cat_id = '"+fk_class_id+"' AND division_name='"+division+"'");
			 query.executeUpdate();
			 transaction.commit();
		//	System.out.println("Number of credit Cusr deleted == + =   "+seletedRecord);
			 System.out.println("deleted from class table+++++++++ +++++++++++++++ +++++++++++++ ");
			 //list = query.list();
			
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