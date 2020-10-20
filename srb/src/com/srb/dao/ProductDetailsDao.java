package com.srb.dao;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.GetSupplierDetails;
import com.srb.bean.ProductDetailsBean;
import com.srb.hibernate.ProductDetailsHibernate;
import com.srb.utility.HibernateUtility;

public class ProductDetailsDao 
{
	public void addProductDetails(ProductDetailsHibernate pdh) 
	{
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try
		{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(pdh);
		transaction.commit();
		}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				rbe.printStackTrace();
			}	
		}
		finally{
		hbu.closeSession(session);
		}
	}
	
	// Delete Shop NAme =====
	
	
public void deleteProduct(String fk_School_id) {
		
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("delete from school_master where pk_school_id="+fk_School_id);
				int seletedRecords = query.executeUpdate();
				System.out.println("Number of credit Cusr deleted == + ="+seletedRecords);
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
	//
public void deletecomplaint(String fk_School_id) {
	
	
	Transaction tx = null;
	HibernateUtility hbu = null ;
	 Session session = null;
	
	 List list  = null;
	 try {
		 

		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		tx = session.beginTransaction();

			Query query = session.createSQLQuery("delete from parents_complaints where pk_parents_complaint = "+fk_School_id);
			int seletedRecords = query.executeUpdate();

			System.out.println("Number of credit Cusr deleted == + = "+seletedRecords);
		//	session.close();

			tx.commit();
			System.out.println("tx comit");
			//list = query.list();
			
	}  catch (Exception e) {
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

	public List getProductName()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from ProductDetailsHibernate");
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
//del
	public void deleteproductss(String pro_id) {
		
		HibernateUtility hbu = null ;
		Transaction tx = null; 
		Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 tx = session.beginTransaction();
				Query query = session.createSQLQuery("delete from product_details where pk_product_Id = "+pro_id);
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
	public List getAllproducts()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from ProductDetailsHibernate");
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
	
	public List<ProductDetailsBean> getProductDetails(String productName, String fkProductId) 
	{
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate localDate = LocalDate.now();
		
		String d = dtf.format(localDate);
		
		String[] d1 = d.split("/");
		
		String month = d1[1];
		
		System.out.println("----------==============-=-=-==-==--=   ::  "+month); 

		
		HibernateUtility hbu = null;
		Session session = null;
		List<ProductDetailsBean> expenseList = null;
		
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			/*Query query2 = session.createSQLQuery("SELECT p.product_name, p.unit, SUM(quantity) FROM product_details p LEFT JOIN kitchen_inventory k ON p.pk_product_Id = k.fk_product_id WHERE pk_product_Id='"+fkProductId+"' AND MONTH(date)='"+month+"'");*/
			/*Query query2 = session.createSQLQuery("select product_name, unit, quantity from product_details WHERE MONTH(date)='"+month+"' AND product_name='"+productName+"'");*/
			
			Query query2 = session.createSQLQuery("SELECT product_name, unit from product_details where pk_product_Id='"+fkProductId+"' AND product_name='"+productName+"'");
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<ProductDetailsBean>(0);

			for (Object[] object : list) {

				ProductDetailsBean reports = new ProductDetailsBean();

				reports.setProductName(object[0].toString());
				reports.setUnit(object[1].toString());

				expenseList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;

	}
	
	
	
	
	// get Employee Details for edit
	public List<ProductDetailsBean> getProductTotalQuantity(String fkProductId, String productName) 
	{
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate localDate = LocalDate.now();
		
		String d = dtf.format(localDate);
		
		String[] d1 = d.split("/");
		
		String month = d1[1];
		
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<ProductDetailsBean> expenseList = null;
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		
			
			Query query2 = session.createSQLQuery("SELECT p.product_name, p.unit, p.product_quantity, SUM(quantity) FROM product_details p LEFT JOIN kitchen_inventory k ON p.pk_product_Id = k.fk_product_id WHERE pk_product_Id='"+fkProductId+"' AND MONTH(date)='"+month+"'");
			
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<ProductDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {

				ProductDetailsBean reports = new ProductDetailsBean();

				reports.setProductName(o[0].toString());
				reports.setUnit(o[1].toString());
				reports.setProductLimit(o[2].toString());
				reports.setTotalQuantity(o[3].toString());
				
				
				expenseList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;

	}

	
	// get product List
	public List getProductList()
	{
		
			HibernateUtility hbu=null;
			Session session=null;
			List<ProductDetailsBean> proList=null;
		try{	
	
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
	
			Query query=session.createSQLQuery("SELECT product_name, unit, product_quantity FROM product_details");
			//Query query = session.createQuery("from PurchaseBill2");
			List<Object[]> list = query.list();
	
	
			proList= new ArrayList<ProductDetailsBean>(0);
	
	
		for (Object[] o : list) 
		{
			
			ProductDetailsBean reports = new ProductDetailsBean();
			
			reports.setProductName(o[0].toString());
			reports.setUnit(o[1].toString());
			reports.setProductLimit(o[2].toString());
			
			
			proList.add(reports);
	
		}}
		catch(RuntimeException e)
		{	
	
		}
		
		finally
		{
	
			hbu.closeSession(session);	
		}
		
		return proList;
		}

	
	
	//get Product Details for edit
	public List<ProductDetailsBean> getProductDetailsEdit(Long fkProductId) 
	{

		System.out.println("In Dao");
		
		System.out.println("IDIDID  ::  "+fkProductId);
		HibernateUtility hbu = null;
		Session session = null;
		
		List<ProductDetailsBean> proList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		
			Query query2 = session.createSQLQuery("select product_name, unit, product_quantity,Description from product_details WHERE pk_product_Id ='"+fkProductId+"'");
			List<Object[]> list = query2.list();
			
			System.out.println("=---------------- SIZE --------------  :: "+list.size());

			proList = new ArrayList<ProductDetailsBean>(0);

			
			for (Object[] o : list) 
			{

				ProductDetailsBean reports = new ProductDetailsBean();

				reports.setProductName(o[0].toString());
				reports.setUnit(o[1].toString());
				reports.setProductLimit(o[2].toString());
				reports.setDescription(o[3].toString());
				
				proList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return proList;

	}



}
