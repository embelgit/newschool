package com.srb.dao;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClassDivisionSubjectAssocBean;
import com.srb.bean.GetSchoolDetailBean;
import com.srb.hibernate.ClassInfoHibernate;
import com.srb.utility.HibernateUtility;


public class ClassInfoDao {


public void  ClassInfoHibernate( ClassInfoHibernate cif){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(cif);
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
	

public List getAllMainClass()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<ClassInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from ClassInfoHibernate ");
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
//
public List getAllMainexp()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<ClassInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from ExpenditureDetailsBean ");
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


public List getAllMainClass10()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<ClassInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from HomeWorkTeacherDailyTaskEntryHibernate GROUP BY className");
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

//
public List getAllproduct()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<ClassInfoHibernate> list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from StoreManagementHibernate ");
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

public List getAllClassDetailForList(){

	
	HibernateUtility hbu=null;
	Session session=null;
	List<ClassDivisionSubjectAssocBean> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT pk_class_id,class_name FROM class_master");
	//Query query = session.createQuery("from PurchaseBill2");
	List<Object[]> list = query.list();


	custList= new ArrayList<ClassDivisionSubjectAssocBean>(0);


for (Object[] object : list) {	
	ClassDivisionSubjectAssocBean reports = new ClassDivisionSubjectAssocBean();
	reports.setClassName(object[1].toString());
	
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;

}



//del clss
public void deleteGridData(String delTempID, String hotelid) {
	
	
	System.out.println("In delete grid data method of newtemp DAO tempID is --- > "+delTempID);
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	Transaction transaction = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		 Query query = session.createSQLQuery("delete from newtempdata where pk_temp_id='"+delTempID+"' AND hotelid = '"+hotelid+"'");
			int seletedRecords = query.executeUpdate();
			transaction.commit();
			System.out.println("Number of credit Cusr deleted == + =  "+seletedRecords);
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
// old class delete
public void deleteclass(String fk_class_id, String className) {
	
	
	System.out.println("In delete grid data method of temp DAO tempID is --- >  "+fk_class_id);
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	Transaction transaction = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
			Query query = session.createSQLQuery("delete from class_master where pk_class_id = '"+fk_class_id+"'");
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

