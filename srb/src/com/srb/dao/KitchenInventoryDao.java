package com.srb.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.GetSupplierDetails;
import com.srb.bean.KitchenInventoryBean;
import com.srb.bean.StockManagementBean;
import com.srb.hibernate.KitchenInventoryHibernate;
import com.srb.utility.HibernateUtility;

public class KitchenInventoryDao 
{
	public void addKitchenInventory(KitchenInventoryHibernate kih)
	{

		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try
		{
			
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();

			 session.save(kih);
			 transaction.commit();
		}
		
		catch(RuntimeException e)
		{
			try
			{
				transaction.rollback();
			}
			catch(RuntimeException rbe)
			{
				rbe.printStackTrace();
			}	
		}
		finally
		{
			hbu.closeSession(session);
		}
	
		
	}
//
	public List getAllproductkitchen()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from KitchenInventoryHibernate");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllSupllier", e);
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
	
	public List getAllproducthostel()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from hostelmanagementhibernate");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllSupllier", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}
	// get Kitchen Inventory List
	public List getKitchenInventoryList(){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<KitchenInventoryBean> supList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT  supplier_name, date, bill_no, product_name, unit, quantity, total, sub_total, gst, gst_amount, gross_total, buy_price,pk_kitchen_inv_id FROM kitchen_inventory");
		List<Object[]> list = query.list();


		supList= new ArrayList<KitchenInventoryBean>(0);


	for (Object[] o : list) 
	{	
		KitchenInventoryBean reports = new KitchenInventoryBean();
		
		reports.setSupplierName(o[0].toString());
		
		String d = o[1].toString();
		String[] d2 = d.split("-");
		String date = d2[2]+"-"+d2[1]+"-"+d2[0];
		
		reports.setDate(date);
		
		reports.setBillNo(o[2].toString());
		reports.setProductName(o[3].toString());
		reports.setUnit(o[4].toString());
		reports.setQuantity(o[5].toString());
		reports.setTotal(o[6].toString());
		reports.setSubTotal(o[7].toString());
		reports.setGst(o[8].toString());
		reports.setGstAmount(o[9].toString());
		reports.setGrossTotal(o[10].toString());
		reports.setBuyPrice(o[11].toString());
		reports.setPk_store_management_id(Long.parseLong(o[12].toString()));
		supList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return supList;
	}
	
	
	
		//kitchen inventory detail between two date
		public List<KitchenInventoryBean> getKitchenInventoryDetailBetweenTwoDate(String firstDate, String lastDate) 
		{

			HibernateUtility hbu=null;
			Session session=null;
			List<KitchenInventoryBean> kitInvList=null;
			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
			/*	Query query = session.createSQLQuery("SELECT product_name,supplier_name,buy_price,quantity,total,gross_total,bill_no,DATE_FORMAT(insert_date,'%d-%m-%Y') FROM store_management WHERE insert_date between '" + firstDate +"' and '"+lastDate+"'");*/
				
				Query query = session.createSQLQuery("SELECT bill_no, date, supplier_name, product_name,unit, quantity, buy_price, total, sub_total, gst, gst_amount, gross_total FROM kitchen_inventory WHERE date BETWEEN '"+firstDate+"' AND '"+lastDate+"'");
				
				List<Object[]> list = query.list();
				kitInvList= new ArrayList<KitchenInventoryBean>(0);
		 
				
				for (Object[] o : list) 
				{
					KitchenInventoryBean s = new KitchenInventoryBean();
					
					s.setBillNo(o[0].toString());
					
					String d = o[1].toString();
					String[] dt = d.split("-");
					
					String date = dt[2]+"-"+dt[1]+"-"+dt[0];
					s.setDate(date);
					
					s.setSupplierName(o[2].toString());
					s.setProductName(o[3].toString());
					s.setUnit(o[4].toString());
					s.setQuantity(o[5].toString());
					s.setBuyPrice(o[6].toString());
					s.setTotal(o[7].toString());
					s.setSubTotal(o[8].toString());
					s.setGst(o[9].toString());
					s.setGstAmount(o[10].toString());
					s.setGrossTotal(o[11].toString());

					kitInvList.add(s);
					}
				}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			return kitInvList;	
		}

		

		public List getAllSupplierKitchenInv()
		{
			HibernateUtility hbu=null;
			Session session=null;
			List list=null;
			try{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createQuery("from KitchenInventoryHibernate");
				list = query.list();
			}
			catch(Exception e){	
				e.printStackTrace();
			}
			finally
			{
				if(session!=null){
					hbu.closeSession(session);
				}
			}
			return list;
		}
		
		//del
		public void deletkitchenproductss(String kitpro_id) {
			
			HibernateUtility hbu = null ;
			Transaction tx = null; 
			Session session = null;
			 List list  = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 tx = session.beginTransaction();
					Query query = session.createSQLQuery("DELETE FROM kitchen_inventory WHERE pk_kitchen_inv_id = "+kitpro_id);
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
		//
		
		public void delethostelproductss(String hostel_id) {
			
			HibernateUtility hbu = null ;
			Transaction tx = null; 
			Session session = null;
			 List list  = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 tx = session.beginTransaction();
					Query query = session.createSQLQuery("DELETE FROM hostel_management WHERE pk_hostel_id = "+hostel_id);
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
			
		public List getAllkitchenDetailsForEdit1(String product_name) {

			
			HibernateUtility hbu = null;
			Session session =  null;
			Query query = null;
			 List list = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 query = session.createSQLQuery("SELECT product_name, bill_no, quantity, buy_price, gst, supplier_name, date, pk_kitchen_inv_id FROM kitchen_inventory WHERE product_name =:product_name");
				//query.setParameter("designation", designation);
				query.setParameter("product_name",product_name);
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
			 System.out.println("out of dao - return getAllHDetailsForEdit List : "+list);
					return list;

			
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


}
