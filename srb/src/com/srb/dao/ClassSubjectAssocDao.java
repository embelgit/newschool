package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClasSubAssoBean;
import com.srb.hibernate.ClassSubjectAssocHibernate;
import com.srb.utility.HibernateUtility;

public class ClassSubjectAssocDao {

public void ClassSubjectAssocHibernate(ClassSubjectAssocHibernate csa){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(csa);
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

public List<ClasSubAssoBean> getSubInfo(String classId) {


	
	HibernateUtility hbu=null;
	Session session=null;
	List<ClasSubAssoBean> itemlist=null;
	try
	{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 String sqlQuery = "SELECT s.pk_subject_id,s.subject_name FROM class_subject_association c right join subject_master s on s.pk_subject_id=c.fk_subject_id  WHERE fk_class_id ='"+classId+"'";
	 System.out.println("in dao classId=="+classId);
	 Query query=session.createSQLQuery(sqlQuery);
		List<Object[]> list = query.list();

		System.out.println("list size== === ="+list.size());
		 itemlist = new ArrayList<ClasSubAssoBean>(0);
	     for (Object[] objects : list) {
		 System.out.println(Arrays.toString(objects));
		 ClasSubAssoBean bean = new ClasSubAssoBean();
		 System.out.println("itemlist");
		
		 bean.setSubId(objects[0].toString());
		 bean.setSubName(objects[1].toString());
		
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