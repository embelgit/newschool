package com.srb.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.ClassDivisionSubjectAssocBean;
import com.srb.hibernate.ClassDivisionAssocHibernate;
import com.srb.utility.HibernateUtility;

public class ClassDivisionAssocDao {

public void  ClassDivisionAssocHibernate(ClassDivisionAssocHibernate cda){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(cda);
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


		//Get Vendor Name For DropDown
		public List getDivisionNameByClassName(String classId, String className)
		{
		
			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT d.pk_division_id, d.division_name, c.class_name FROM division_master d INNER JOIN class_master c ON pk_class_id = fk_cat_id WHERE fk_cat_id = '"+classId+"' and class_name = '"+className+"'");
		
				list = query.list();
		
				System.out.println("----- LIST -DAO---- jsp  ::  "+list.size());
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		
			finally
			{
				if (session!=null) {
					hbu.closeSession(session);
				}
			}
			
			System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

			return list;
			
			
		}
		//
		
		public List gettaskk(String subject,String class1,String division,String teacher)
		{
		
			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT pk_teacher_daily_task,task from home_work WHERE teacher_name = '"+teacher+"' AND class_name = '"+class1+"' AND division = '"+division+"' AND `subject` = '"+subject+"'");
		
				list = query.list();
		
				System.out.println("----- LIST -DAO---- jsp  ::  "+list.size());
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		
			finally
			{
				if (session!=null) {
					hbu.closeSession(session);
				}
			}
			
			System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

			return list;
			
			
		}
		//
		public List getDivisionNameByClassName1(String classId, String className)
		{
		
			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT d.pk_division_id, d.division_name, c.class_name FROM division_master d INNER JOIN class_master c ON pk_class_id = fk_cat_id WHERE fk_cat_id = '"+classId+"' and class_name = '"+className+"'");
		
				list = query.list();
		
				System.out.println("----- LIST -DAO---- jsp  ::  "+list.size());
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		
			finally
			{
				if (session!=null) {
					hbu.closeSession(session);
				}
			}
			
			System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

			return list;
			
			
		}
		//del div
		public List getDivisionNameByClassNamedel(String classId, String className)
		{
		
			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
//				Query query = session.createSQLQuery("SELECT d.pk_division_id, d.division_name, c.class_name FROM division_master d INNER JOIN class_master c ON pk_class_id = fk_cat_id WHERE fk_cat_id = '"+classId+"' and class_name = '"+className+"'");
				Query query = session.createSQLQuery("SELECT pk_division_id,division_name FROM division_master WHERE  fk_cat_id = '"+classId+"'");		
				list = query.list();
		
				System.out.println("----- LIST -DAO---- jsp  ::  "+list.size());
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		
			finally
			{
				if (session!=null) {
					hbu.closeSession(session);
				}
			}
			
			System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

			return list;
			
			
		}
		
		
		//nirgum
		public List getDivisionNameByClassNameng(String classId, String className)
		{
		
			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT d.pk_division_id, d.division_name, c.class_name FROM division_master d INNER JOIN class_master c ON pk_class_id = fk_cat_id WHERE fk_cat_id = '"+classId+"' and class_name = '"+className+"'");
		
				list = query.list();
		
				System.out.println("----- LIST -DAO---- jsp  ::  "+list.size());
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		
			finally
			{
				if (session!=null) {
					hbu.closeSession(session);
				}
			}
			
			System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

			return list;
			
			
		}
		

}
	