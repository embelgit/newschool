package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClasSubAssoBean;
import com.srb.bean.ClassDivisionSubjectAssocBean;
import com.srb.hibernate.ClassDivisionSubjectAssocHibernate;
import com.srb.utility.HibernateUtility;

public class ClassDivisionSubjectAssocDao {

public void  ClassDivisionSubjectAssocHibernate( ClassDivisionSubjectAssocHibernate cds){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(cds);
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

public List<ClassDivisionSubjectAssocBean> getDivSubInfo(String classId) {


	
	HibernateUtility hbu=null;
	Session session=null;
	List<ClassDivisionSubjectAssocBean> itemlist=null;
	try
	{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 String sqlQuery = "SELECT  class_name,division_name,subject_name FROM class_division_subject_association WHERE fk_class_id ='"+classId+"'";
	 System.out.println("in dao classId=="+classId);
	 Query query=session.createSQLQuery(sqlQuery);
		List<Object[]> list = query.list();

		System.out.println("list size== === ="+list.size());
		 itemlist = new ArrayList<ClassDivisionSubjectAssocBean>(0);
	     for (Object[] objects : list) {
		 System.out.println(Arrays.toString(objects));
		 ClassDivisionSubjectAssocBean bean = new ClassDivisionSubjectAssocBean();
		 System.out.println("itemlist");
		
		 bean.setClassName(objects[0].toString());
		 bean.setSubName(objects[2].toString());
		 bean.setDivision(objects[1].toString());
		 
		 bean.setDivID(objects[0].toString());
		 bean.setSubId(objects[2].toString());
		
		 System.out.println("itemlist");
		
		itemlist.add(bean);
		
	     }
	}
	catch(RuntimeException e)
	{
		System.out.println("Error in getAllItemDetails(String key)");	
	}finally
	{if(session!=null){
		hbu.closeSession(session);	
	}
	}
	
	return itemlist;
	
	


}

}
