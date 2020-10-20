package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

//import com.Fertilizer.hibernate.ShopDetailsBean;
import com.srb.hibernate.UserDetailsBean;
import com.srb.utility.HibernateUtility;

public class userDetailsDao {
	public void addUser(UserDetailsBean udb) {

		System.out.println("In DAO");

		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("got session ");
			transaction = session.beginTransaction();

			System.out.println("Tx started");
			session.save(udb);
			transaction.commit();
			System.out.println("Successful");
		}
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		}finally{
			hbu.closeSession(session);
		}
	}

	public List getAllUsers()
	{

		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("from UserDetailsBean");
			list = query.list();
		}catch(Exception e){	
			Log.error("Error in getAllMainEmployee",e);
		}
		finally{
			if(session!=null){
				hbu.closeSession(session);	
			}
		}
		return list;
	}
	
	
	//get latest User ID number in User Details
			public List getUserId() {
				HibernateUtility hbu=null;
				Session session=null;
				List<UserDetailsBean> Txidlist=null;
				try
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query = session.createSQLQuery("SELECT user_id , first_name,last_name FROM user_details ORDER BY user_id DESC LIMIT 1");

					List<Object[]> list = query.list();
					Txidlist= new ArrayList<UserDetailsBean>(0);
					for (Object[] object : list) {
						
						UserDetailsBean bean=new UserDetailsBean();
						bean.setUser_id(Long.parseLong(object[0].toString()));
						bean.setFirstName(object[1].toString());
						bean.setLastName(object[1].toString());
						
						Txidlist.add(bean);	 
					}}
				catch(RuntimeException e)
				{
					Log.error("Error in getUserId()", e);	
				}finally
				{if(session!=null){
					hbu.closeSession(session);	
				}
				}
				return Txidlist;	
			}
}
