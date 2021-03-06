package com.srb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.swing.text.DateFormatter;
import com.srb.bean.hostelmanagementbean;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.GetStoreManagementDetailBean;
import com.srb.bean.KitchenInventoryBean;
import com.srb.bean.StockManagementBean;
import com.srb.bean.StoreMAnagementBean;
import com.srb.bean.TeacherLeavebean;
import com.srb.hibernate.SportParticipantDetails;
import com.srb.hibernate.StoreManagementHibernate;
import com.srb.hibernate.SupplierPaymentBean;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.utility.HibernateUtility;
import com.srb.hibernate.hostelmanagementhibernate;
public class StoreManagementDAO {

	public void addStockIntoDatabase(StoreManagementHibernate b) {

		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(b);
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
			 query = session.createQuery("from StoreManagementHibernate");
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
	//add hostel
	public void addStockhostelIntoDatabase(hostelmanagementhibernate b) {

		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(b);
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
	
	// add sport Participiant Details 
	public void addSportAPrticipantDetails(SportParticipantDetails b)
	{
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
		
			
			session.save(b);
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
	
	// get Last Bill No 
	public List getLastBillNo() {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List<StoreManagementHibernate> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 /*String abc ="0.00";*/
		 Query query = session.createSQLQuery("SELECT bill_no,pk_store_management_id FROM store_management  ORDER BY pk_store_management_id DESC LIMIT 1");
		/*query.setParameter("abc", abc);*/
		 
			List<Object[]> list = query.list();
			 saleList= new ArrayList<StoreManagementHibernate>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				StoreManagementHibernate reports = new StoreManagementHibernate();
				reports.setBillNo(Double.parseDouble(object[0].toString()));
				saleList.add(reports);	 
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}finally
		{if(session!=null){
			session.close();	
		}
		}
		return saleList;
	}
	
	//get all store inventry List
	
		public List getStoreInventoryList(){
			
			HibernateUtility hbu=null;
			Session session=null;
			List<StoreMAnagementBean> supList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("select pk_store_management_id,bill_no,store_date,supplier_name,product_name,buy_price,quantity,total,gross_total,balance_amount from store_management");
			List<Object[]> list = query.list();


			supList= new ArrayList<StoreMAnagementBean>(0);


		for (Object[] o : list) 
		{	
			StoreMAnagementBean reports = new StoreMAnagementBean();
			
			reports.setPkStoreManagementId(Long.parseLong(o[0].toString()));
			
			/*String d = o[1].toString();
			String[] d2 = d.split("-");
			String date = d2[2]+"-"+d2[1]+"-"+d2[0];*/
			
			//reports.setStoreDate(storeDate);(date);
			
			reports.setBillNo(Double.parseDouble((o[1].toString())));
			reports.setSupplierName(o[3].toString());
			reports.setInsertDate((o[2].toString()));
			reports.setProductName(o[4].toString());
			reports.setBuyPrice(Double.parseDouble(o[5].toString()));
			reports.setQuantity(Double.parseDouble((o[6].toString())));
			reports.setTotal(Double.parseDouble(o[7].toString()));
			reports.setGrossTotal(Double.parseDouble(o[8].toString()));
			reports.setBalanceAmount(Double.parseDouble((o[9].toString())));
			
			
			
			
			supList.add(reports);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return supList;
		}
	
	//get all Supplier Name by kishor
	public List getAllSupplier()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from StoreManagementHibernate");
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
	

	//stock detail between two date
	public List<StockManagementBean> getStockDetailBetweenTwoDate(
			String firstDate, String lastDate) {

		HibernateUtility hbu=null;
		Session session=null;
		List<StockManagementBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		/*	Query query = session.createSQLQuery("SELECT product_name,supplier_name,buy_price,quantity,total,gross_total,bill_no,DATE_FORMAT(insert_date,'%d-%m-%Y') FROM store_management WHERE insert_date between '" + firstDate +"' and '"+lastDate+"'");*/
			
			Query query = session.createSQLQuery("SELECT bill_no, insert_date, product_name, supplier_name, buy_price, quantity, total FROM store_management WHERE insert_date BETWEEN '"+ firstDate +"' AND '"+lastDate +"'");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<StockManagementBean>(0);
	 
			
			for (Object[] o : list) 
			{
				StockManagementBean s = new StockManagementBean();
				
				s.setBillNo(Double.parseDouble(o[0].toString()));
				
				String d = o[1].toString();
				String dt[] = d.split("-");
				String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
				
				s.setInsertDate(insertDate);
				
				s.setProductName(o[2].toString());
				s.setSupplierName(o[3].toString());
				s.setBuyPrice(Double.parseDouble(o[4].toString()));
				s.setQuantity(Double.parseDouble(o[5].toString()));
				s.setTotal(Double.parseDouble(o[6].toString()));

				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
	//
	public List<StockManagementBean> getStockDetail(String fkid) {

		HibernateUtility hbu=null;
		Session session=null;
		List<StockManagementBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		/*	Query query = session.createSQLQuery("SELECT product_name,supplier_name,buy_price,quantity,total,gross_total,bill_no,DATE_FORMAT(insert_date,'%d-%m-%Y') FROM store_management WHERE insert_date between '" + firstDate +"' and '"+lastDate+"'");*/
			
			Query query = session.createSQLQuery("SELECT bill_no, insert_date, product_name, supplier_name, buy_price, quantity, total FROM store_management WHERE pk_store_management_id = '"+fkid+"'");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<StockManagementBean>(0);
	 
			
			for (Object[] o : list) 
			{
				StockManagementBean s = new StockManagementBean();
				System.out.println("--  "+Arrays.toString(o));
				s.setBillNo(Double.parseDouble(o[0].toString()));
				
				String d = o[1].toString();
				String dt[] = d.split("-");
				String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
				
				s.setInsertDate(insertDate);
				
				s.setProductName(o[2].toString());
				s.setSupplierName(o[3].toString());
				s.setBuyPrice(Double.parseDouble(o[4].toString()));
				s.setQuantity(Double.parseDouble(o[5].toString()));
				s.setTotal(Double.parseDouble(o[6].toString()));

				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
	
	//
	public List<TrasnpotationSchollBus> gettransportBetweenTwoDate(String firstDate, String lastDate) {

		HibernateUtility hbu=null;
		Session session=null;
		List<TrasnpotationSchollBus> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		/*	Query query = session.createSQLQuery("SELECT product_name,supplier_name,buy_price,quantity,total,gross_total,bill_no,DATE_FORMAT(insert_date,'%d-%m-%Y') FROM store_management WHERE insert_date between '" + firstDate +"' and '"+lastDate+"'");*/
			
			Query query = session.createSQLQuery("select pk_Trasnpotation_Scholl_BusId,studentName,Contact_No,Driver_Name,payement,Address,leave_DateFrom,leaveDate_To from trasnpotation_school_bus WHERE leave_DateFrom BETWEEN '"+ firstDate +"' AND '"+lastDate +"'");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<TrasnpotationSchollBus>(0);
	 
			
			for (Object[] o : list) 
			{
				TrasnpotationSchollBus s = new TrasnpotationSchollBus();
				
		/*		s.setBillNo(Double.parseDouble(o[0].toString()));
				
				String d = o[1].toString();
				String dt[] = d.split("-");
				String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
				
				s.setInsertDate(insertDate);
			*/
				s.setPkTrasnpotationSchollBusId(Long.parseLong(o[0].toString()));
				s.setStudentName(o[1].toString());
				s.setContactNo(Long.parseLong(o[2].toString()));
				s.setDriverName(o[3].toString());
				
				s.setPayement(Double.parseDouble(o[4].toString()));
				s.setAddress(o[5].toString());
				s.setLeaveDateFrom(o[6].toString());
				s.setLeaveDateTo(o[7].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
	//
	
	public List<TeacherLeavebean> getemppBetweenTwoDate(String firstDate, String lastDate) {

		HibernateUtility hbu=null;
		Session session=null;
		List<TeacherLeavebean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		/*	Query query = session.createSQLQuery("SELECT product_name,supplier_name,buy_price,quantity,total,gross_total,bill_no,DATE_FORMAT(insert_date,'%d-%m-%Y') FROM store_management WHERE insert_date between '" + firstDate +"' and '"+lastDate+"'");*/
			
	//		Query query = session.createSQLQuery("select pk_Trasnpotation_Scholl_BusId,studentName,Contact_No,Driver_Name,payement,Address,leave_DateFrom,leaveDate_To from trasnpotation_school_bus WHERE leave_DateFrom BETWEEN '"+ firstDate +"' AND '"+lastDate +"'");
			Query query=session.createSQLQuery("select pk_Teacher_LeaveId,tm.first_name,tm.middle_name,tm.last_name,Leave_Type,First_Date,Last_Date,ApprovedBy,Description from teacher_leave join teacher_master tm on Fk_Teacher_id = tm.pk_teacher_id where First_Date between '"+firstDate+"' AND '"+lastDate+"'");	
			List<Object[]> list = query.list();
			 saleList= new ArrayList<TeacherLeavebean>(0);
	 
			
			for (Object[] object : list) 
			{
				TeacherLeavebean reports = new TeacherLeavebean();
				
				System.out.println("aaa  "+Arrays.toString(object));
				reports.setPkleaveId(object[0].toString());
				//System.out.println(""+(object[0].toString()));
				
				reports.setFirstName(object[1].toString());
				System.out.println(""+(object[1].toString()));
				
				reports.setMiddleName(object[2].toString());
				System.out.println(""+(object[2].toString()));
				
				reports.setLastName(object[3].toString());
				System.out.println(""+(object[3].toString()));
				
				reports.setLeavetype(object[4].toString());
				System.out.println(""+(object[4].toString()));
				
				reports.setFirstDate(object[5].toString());
				System.out.println(""+(object[5].toString()));
				
				reports.setLastDate(object[6].toString());
				System.out.println(""+(object[6].toString()));
				
				reports.setApprovedby(object[7].toString());
				System.out.println(""+(object[7].toString()));
				reports.setDescription(object[8].toString());
				System.out.println(""+(object[8].toString()));
				saleList.add(reports);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
	
	
// hostel report
	public List<hostelmanagementbean> gethostelStockDetailBetweenTwoDate(String firstDate, String lastDate) {

		HibernateUtility hbu=null;
		Session session=null;
		List<hostelmanagementbean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT bill_no, insert_date, product_name, supplier_name, buy_price, quantity, total FROM hostel_management WHERE insert_date BETWEEN '"+ firstDate +"' AND '"+lastDate+"'");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<hostelmanagementbean>(0);
	 
			
			for (Object[] o : list) 
			{
				hostelmanagementbean s = new hostelmanagementbean();
				System.out.println("result - "+Arrays.toString(o));
				s.setBillNo(Double.parseDouble(o[0].toString()));
				
				String d = o[1].toString();
				String dt[] = d.split("-");
				String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
				
				s.setInsertDate(insertDate);
				
				s.setProductName(o[2].toString());
				s.setSupplierName(o[3].toString());
				s.setBuyPrice(Double.parseDouble(o[4].toString()));
				s.setQuantity(Double.parseDouble(o[5].toString()));
				s.setTotal(Double.parseDouble(o[6].toString()));

				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
	
	
	
	
	
	private DateFormatter DateFormatter()
	{
		// TODO Auto-generated method stub
		return null;
	}

//hostel list
	public List gethostelInventoryList(){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<hostelmanagementbean> supList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("select pk_hostel_id,bill_no,store_date,supplier_name,product_name,buy_price,quantity,total,gross_total,balance_amount from hostel_management");
		List<Object[]> list = query.list();


		supList= new ArrayList<hostelmanagementbean>(0);


	for (Object[] o : list) 
	{	
		hostelmanagementbean reports = new hostelmanagementbean();
		
		reports.setPkhostelid(Long.parseLong(o[0].toString()));		
		reports.setBillNo(Double.parseDouble((o[1].toString())));
		reports.setSupplierName(o[3].toString());
		reports.setInsertDate((o[2].toString()));
		reports.setProductName(o[4].toString());
		reports.setBuyPrice(Double.parseDouble(o[5].toString()));
		reports.setQuantity(Double.parseDouble((o[6].toString())));
		reports.setTotal(Double.parseDouble(o[7].toString()));
		reports.setGrossTotal(Double.parseDouble(o[8].toString()));
		reports.setBalanceAmount(Double.parseDouble((o[9].toString())));
		
		
		
		
		supList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return supList;
	}
	
//del
	public void deletstreproductss(String strpro_id) {
		System.out.println("IN DAO OF STORE MANAGEMENT ");
		HibernateUtility hbu = null ;
		Transaction tx = null; 
		Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 tx = session.beginTransaction();
				Query query = session.createSQLQuery("DELETE FROM store_management WHERE pk_store_management_id = "+strpro_id);
				int seletedRecords = query.executeUpdate();
				System.out.println("Number of credit Cusr deleted = = "+seletedRecords);
				System.out.println("OUT OF DAO");
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
	
	public List getAllstoreDetailsForEdit1(Long pk_store_management_id) {

		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 String TeachingStaff="TeachingStaff";
			 //query = session.createSQLQuery("SELECT pk_teacher_id,designation,first_name,middle_name,last_name,date_of_birth,education,specialization,percentage,joining_date,mobile_number,landline_number,present_address,permanent_address,aadhar_number,account_number,bank_name,ifsc,pan_number,epf_number,pt_number,Salary FROM teacher_master WHERE designation =:designation ");
			 query = session.createSQLQuery("SELECT product_name,bill_no,quantity,buy_price,gst,supplier_name,store_date FROM store_management WHERE pk_store_management_id =:pk_store_management_id");
			//query.setParameter("designation", designation);
			query.setParameter("pk_store_management_id", pk_store_management_id);
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
		 System.out.println("out of dao - return getAllTeacherDetailsForEdit List : "+list);
				return list;

		
	}

public List gethostelInventoryList1(){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<hostelmanagementbean> supList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("select pk_hostel_id,bill_no,supplier_name,insert_date,product_name,buy_price,quantity,total,gross_total,balance_amount from hostel_management");
		List<Object[]> list = query.list();


		supList= new ArrayList<hostelmanagementbean>(0);


	for (Object[] o : list) 
	{	
		hostelmanagementbean reports = new hostelmanagementbean();
		
		reports.setPkhostelid(Long.parseLong(o[0].toString()));		
		reports.setBillNo(Double.parseDouble((o[1].toString())));
		reports.setSupplierName(o[3].toString());
		reports.setInsertDate((o[2].toString()));
		reports.setProductName(o[4].toString());
		reports.setBuyPrice(Double.parseDouble(o[5].toString()));
		reports.setQuantity(Double.parseDouble((o[6].toString())));
		reports.setTotal(Double.parseDouble(o[7].toString()));
		reports.setGrossTotal(Double.parseDouble(o[8].toString()));
		reports.setBalanceAmount(Double.parseDouble((o[9].toString())));
		supList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return supList;
	}

	
public List getHostelDetailsForEdit1(String product_name) {

	
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("select pk_hostel_id,bill_no,supplier_name,insert_date,product_name,buy_price,quantity,total,gross_total from hostel_management WHERE product_name =:product_name");
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
	 System.out.println("out of dao - return getAllTeacherDetailsForEdit List : "+list);
			return list;

	
}

public List getAllStoreBill()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List<GetStoreManagementDetailBean> stlist = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("select bill_no from  store_management");
		 List<Object[]> list1 = query.list();
		 stlist= new ArrayList<GetStoreManagementDetailBean>(0);

		for (Object[] o : list1) 
		{	
			GetStoreManagementDetailBean reports = new GetStoreManagementDetailBean();
			reports.setBillNo(o[0].toString());
			stlist.add(reports);

		}}catch(RuntimeException e){	

		}
		finally{

		hbu.closeSession(session);	
		}
		return stlist;
		}
	
	
	
	
	
	
	
	
	
	
	
}
