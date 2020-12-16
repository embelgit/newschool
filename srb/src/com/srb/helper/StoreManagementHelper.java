package com.srb.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.srb.bean.hostelmanagementbean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.srb.hibernate.hostelmanagementhibernate;
import com.srb.utility.HibernateUtility;
import com.itextpdf.text.log.SysoCounter;
import com.srb.bean.GetExamTimeTableDetail;
import com.srb.bean.GetStoreManagementDetailBean;
import com.srb.bean.GetTeacherDetailBean;
import com.srb.bean.StockManagementBean;
import com.srb.bean.StoreMAnagementBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.bean.TeacherLeavebean;
import com.srb.dao.ProductDetailsDao;
import com.srb.dao.StoreManagementDAO;
import com.srb.dao.StudentInfoDao;
import com.srb.dao.SupplierPaymentDao;
import com.srb.dao.TeacherInfoDao;
import com.srb.hibernate.SportParticipantDetails;
import com.srb.hibernate.StoreManagementHibernate;
import com.srb.hibernate.SupplierPaymentBean;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.bean.gethostelmanagementdetailbean;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
public class StoreManagementHelper {

	public GetStoreManagementDetailBean getGridForStoreManagement(String productName) {
		
		GetStoreManagementDetailBean bean = new GetStoreManagementDetailBean();

			bean.setProductName(productName);
			bean.setGst(0l);
//			bean.setGstamt(0l);
			System.out.println("productName "+productName);
			return bean;
	}
//get hostel grid
public gethostelmanagementdetailbean getGridForhostelManagement(String productName) {
		
	gethostelmanagementdetailbean bean = new gethostelmanagementdetailbean();

			bean.setProductName(productName);
			bean.setGst(0l);
	//		bean.setGstamt(0l);
			System.out.println("productName hostel grid "+productName);
			return bean;
	}
	
	
	//adding store
	public void addingStoreManagement(HttpServletRequest request,
			HttpServletResponse response) {
		
		 Integer count = Integer.parseInt(request.getParameter("count"));
         System.out.println(count);
         for(int i =0 ; i<count;i++)
 		{
	        String productName = request.getParameter("productName"+i);
	        String billNo = request.getParameter("billNo");
	        String storeDate = request.getParameter("storeDate");
	
	        String buyPrice = request.getParameter("buyPrice"+i);
	        String quantity = request.getParameter("quantity"+i);
	        String gst = request.getParameter("gst"+i);
	        String gstamt = request.getParameter("gstamt"+i);
	        
	        String total = request.getParameter("total"+i);
	    
	        String grossTotal = request.getParameter("grossTotal");	
	        String fkSupplierId = request.getParameter("fkSupplierId");
	        String supplierName = request.getParameter("supplierName");
	        
	        StoreManagementHibernate b = new StoreManagementHibernate();
	    	/*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD");
	    	Date dateOfBirth = null;
	    	
	    	try{
	    		dateOfBirth = format.parse(storeDate);
	    		b.setStoreDate(dateOfBirth);
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
	    	b.setSupplierName(supplierName1);*/
	    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date sDate = null;
		
			try 
			{
				sDate = dateFormat.parse(storeDate);
			} 
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
			
		
			b.setStoreDate(sDate);
		
	    	b.setSupplierName(supplierName);
	       b.setSupplier1(Long.parseLong(fkSupplierId));
	       b.setGst(Double.parseDouble(gst));
	       b.setGstamt(Double.parseDouble(gstamt));
	 	
	
	    	b.setProductName(productName);
	 	
	 		b.setBuyPrice(Double.parseDouble(buyPrice));
	 		b.setQuantity(Double.parseDouble(quantity));
	 		b.setTotal(Double.parseDouble(total));
	 		b.setGrossTotal(Double.parseDouble(grossTotal));
	 		b.setBalanceAmount(Double.parseDouble(grossTotal));
	 		
	 		b.setBillNo(Double.parseDouble(billNo));
	 		
	 		Date d = new Date();
	 		b.setInsertDate(d);
	 		
	 		StoreManagementDAO dao = new StoreManagementDAO();
	 		dao.addStockIntoDatabase(b);
	 		
	 		com.srb.hibernate.SupplierPaymentBean bean = new com.srb.hibernate.SupplierPaymentBean();
			
	 		System.out.println("In helper");
			/*
			 * Long Txid=0l;
			 * 
			 * SupplierPaymentDao dao0=new SupplierPaymentDao(); List
			 * listtxid=dao0.getSupplierPaymentTxid();
			 * 
			 * if(listtxid.size()<=0) { Txid=1l; } else { for (int j = 0; j <
			 * listtxid.size(); j++) {
			 * 
			 * SupplierPaymentBean bean1=(SupplierPaymentBean) listtxid.get(i);
			 * Txid=bean1.getTxId(); Txid++; } }
			 */
			
			Date d1 = new Date();
			bean.setInsertDate(d1);
			String st = "store";
			
			//bean.setTxId(Txid);
			bean.setPaymentinventory(st);
			bean.setSupplier1(Long.parseLong(fkSupplierId));
			bean.setSupplier(supplierName);
			bean.setBillNo(Double.parseDouble(billNo));
			bean.setBillNo1(billNo);
			bean.setTotalAmount(Double.parseDouble(grossTotal)); 
			//bean.setBalance(Double.parseDouble(balanceAmount));
			bean.setCredit(Double.parseDouble("0"));
			bean.setBalance(Double.parseDouble(grossTotal));
			bean.setPaymentType("credit");
			bean.setPaymentMode("N/A");
			bean.setPersonname("N/A");
			bean.setPaidAmount(Double.parseDouble("0"));
			 bean.setBankName("N/A");
			 bean.setNameOnCheck("N/A");
			 bean.setAccNum(Long.parseLong("00"));
			 bean.setChequeNum("N/A");
			 bean.setCardNum(Long.parseLong("00"));
			 bean.setPayment(Double.parseDouble("00"));
			 bean.setTdsdetails("00");
			 bean.setDebitAmount("00");
			//bean.setTotalAmount(Double.parseDouble(totalAmounte));
			//bean.setb
			
			
			 /*if(bankName==null)
			 {
				 bean.setBankName("N/A");
			 }
			 else
			 {
				 bean.setBankName("N/A");
			 }*/
			
			 
			/* if(nameOnCheck==null)
			 {
				 bean.setNameOnCheck(nameOnCheck);
			 }
			 else
			 {
				 bean.setNameOnCheck("N/A");
			 }*/
	
			 /*if(accNum==null)
			 {
				 bean.setAccNum(Long.parseLong(accNum));
			 }
			 else
			 {
				 bean.setAccNum(Long.parseLong("00"));
			 }*/
			 
			/* if(chequeNum==null)
			 {
				 bean.setChequeNum(chequeNum);
			 }
			 else
			 {
				 bean.setChequeNum("N/A");
			 }
			 
			 if(cardNum==null)
			 {
				 bean.setCardNum(Long.parseLong(cardNum));
			 }
			 else
			 {
				 bean.setCardNum(Long.parseLong("00"));
			 }
			
			*/

			SupplierPaymentDao dao1 = new SupplierPaymentDao();
			dao1.regSupPayment(bean);
		
	 		}
	}
	
	// addding Sport Participiant Detaisl addStoreManagementParticipantDetails
	public void addStoreManagementParticipantDetails(HttpServletRequest request,
			HttpServletResponse response) {
		
		 Integer count = Integer.parseInt(request.getParameter("count"));
         System.out.println(count);
         for(int i =0 ; i<count;i++)
 		{
	        String PkSportGridid = request.getParameter("PkSportid"+i);
	        String firstName = request.getParameter("firstName"+i);
	        String middleName = request.getParameter("middleName"+i);
	
	        String LastName = request.getParameter("LastName"+i);
	        String Lose = request.getParameter("Lose"+i);
	        String win = request.getParameter("win"+i);
	    
	        String Award = request.getParameter("Award"+i);	
	        String SportParticipant = request.getParameter("SportParticipant");
	        String PkSportId = request.getParameter("PkSportId");
	        String startdate = request.getParameter("startdate");
	        String enddate = request.getParameter("enddate");
	        String fk_division_id = request.getParameter("fk_division_id");
	        String fk_class_id = request.getParameter("fk_class_id");
	        
	        
	        SportParticipantDetails b = new SportParticipantDetails();
	        
	    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD");
	    	Date stDate = null;
	    	Date enDate = null;
	    	
	    	try{
	    		stDate = format.parse(startdate);
	    		b.setStartdate(stDate);
	    		enDate = format.parse(startdate);
	    		b.setEnddate(enDate);
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
	    	/*	b.setSupplierName(supplierName1);*/
	    	b.setPkSportGridid(Long.parseLong(PkSportGridid));
	    	b.setFirstName(firstName);
	    	b.setMiddleName(middleName);
	    	b.setLastName(LastName);
	    	b.setLose(Lose);
	        b.setWin(win);
	        b.setAward(Award);
	        b.setSportParticipant(SportParticipant);
	        b.setPkSportid(Long.parseLong(PkSportId));
	        b.setFk_class_id(Long.parseLong(fk_class_id));
	        b.setFk_division_id(Long.parseLong(fk_division_id));
	    	
	 		
	 		Date d = new Date();
	 		b.setInsertdate(d);
	 		
	 		StoreManagementDAO dao = new StoreManagementDAO();
	 		dao.addSportAPrticipantDetails(b);
	 		}
	}
	
	

	//stock report between to date
	public List getStockdetailBetweenTwoDateForReport(HttpServletRequest request, HttpServletResponse response) 
	{
		String firstDate = request.getParameter("fdate");
		String lastDate = request.getParameter("sdate");
		
         Map<Long,StockManagementBean> map = new HashMap<Long,StockManagementBean>();
 		
         StoreManagementDAO dao = new StoreManagementDAO();
 		List<StockManagementBean> expList = dao.getStockDetailBetweenTwoDate(firstDate,lastDate);
 		
 		return expList;
	
	}
	//
	public List getStockdetailReport(HttpServletRequest request, HttpServletResponse response) 
	{
		String fkid = request.getParameter("fkid");

		Map<Long,StockManagementBean> map = new HashMap<Long,StockManagementBean>();
 		
         StoreManagementDAO dao = new StoreManagementDAO();
 		List<StockManagementBean> expList = dao.getStockDetail(fkid);
 		
 		return expList;
	
	}
	//
	public List gettransportBetweenTwoDateForReport(HttpServletRequest request, HttpServletResponse response) 
	{
		String firstDate = request.getParameter("fdate");
		String lastDate = request.getParameter("sdate");
		
         Map<Long,TrasnpotationSchollBus> map = new HashMap<Long,TrasnpotationSchollBus>();
 		
         StoreManagementDAO dao = new StoreManagementDAO();
 		List<TrasnpotationSchollBus> expList = dao.gettransportBetweenTwoDate(firstDate,lastDate);
 		
 		return expList;
	
	}
	//
	public List getempBetweenTwoDateForReport(HttpServletRequest request, HttpServletResponse response) 
	{
		String firstDate = request.getParameter("fdate");
		String lastDate = request.getParameter("sdate");
		
         Map<Long,TeacherLeavebean> map = new HashMap<Long,TeacherLeavebean>();
 		
         StoreManagementDAO dao = new StoreManagementDAO();
 		List<TeacherLeavebean> expList = dao.getemppBetweenTwoDate(firstDate,lastDate);
 		
 		return expList;
	
	}
	
	//hostel report ----
	public List gethostelStockdetailBetweenTwoDateForReport(HttpServletRequest request, HttpServletResponse response)
	{
		String firstDate = request.getParameter("fdate");
		String lastDate = request.getParameter("sdate");
		System.out.println("helper dates - "+firstDate+" "+lastDate);
         Map<Long,hostelmanagementbean> map = new HashMap<Long,hostelmanagementbean>();
 		
         StoreManagementDAO dao = new StoreManagementDAO();
 		List<hostelmanagementbean> expList = dao.gethostelStockDetailBetweenTwoDate(firstDate,lastDate);
 		
 		return expList;
	
	}
	
	
	
	//add hostel
	public void addinghostelManagement(HttpServletRequest request,HttpServletResponse response) {
		
		 Integer count = Integer.parseInt(request.getParameter("count"));
         System.out.println("count - "+count);
         for(int i =0 ; i<count;i++)
 		{
	        String productName = request.getParameter("productName"+i);
	        String billNo = request.getParameter("billNo");
	        String storeDate = request.getParameter("storeDate");
	
	        String buyPrice = request.getParameter("buyPrice"+i);
	        String quantity = request.getParameter("quantity"+i);
	        String gst = request.getParameter("gst"+i);
	        String gstamt = request.getParameter("gstamt"+i);
	        
	        String total = request.getParameter("total"+i);
	    
	        String grossTotal = request.getParameter("grossTotal");	
	        String fkSupplierId = request.getParameter("fkSupplierId");
	        String supplierName = request.getParameter("supplierName");
	        System.out.println("fkSupplierId "+fkSupplierId+" supplierName "+supplierName+" grossTotal "+grossTotal);
//	        StoreManagementHibernate b = new StoreManagementHibernate();
	        hostelmanagementhibernate b = new hostelmanagementhibernate();
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD");
	    	Date dateOfBirth = null;
	    	
	    	try{
	    		dateOfBirth = format.parse(storeDate);
	    		b.setStoreDate(dateOfBirth);
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
	    	/*	b.setSupplierName(supplierName1);*/
	    	
	    	b.setSupplierName(supplierName);
	       b.setSupplier1(Long.parseLong(fkSupplierId));
	       b.setGst(Double.parseDouble(gst));
	       b.setGstamt(Double.parseDouble(gstamt));
	 	
	
	    	b.setProductName(productName);
	 	
	 		b.setBuyPrice(Double.parseDouble(buyPrice));
	 		b.setQuantity(Double.parseDouble(quantity));
	 		b.setTotal(Double.parseDouble(total));
	 		b.setGrossTotal(Double.parseDouble(grossTotal));
	 		b.setBalanceAmount(Double.parseDouble(grossTotal));
	 		
	 		b.setBillNo(Double.parseDouble(billNo));
	 		
	 		Date d = new Date();
	 		b.setInsertDate(d);
	 		
	 		StoreManagementDAO dao = new StoreManagementDAO();
	 		dao.addStockhostelIntoDatabase(b);
	 		
	 		com.srb.hibernate.SupplierPaymentBean bean = new com.srb.hibernate.SupplierPaymentBean();
			
	 		System.out.println("In helper");
			/*
			 * Long Txid=0l;
			 * 
			 * SupplierPaymentDao dao0=new SupplierPaymentDao(); List
			 * listtxid=dao0.getSupplierPaymentTxid();
			 * 
			 * if(listtxid.size()<=0) { Txid=1l; } else { for (int j = 0; j <
			 * listtxid.size(); j++) {
			 * 
			 * SupplierPaymentBean bean1=(SupplierPaymentBean) listtxid.get(i);
			 * Txid=bean1.getTxId(); Txid++; } }
			 */
			
			Date d1 = new Date();
			bean.setInsertDate(d1);
			String st = "hostel";
			
			//bean.setTxId(Txid);
			bean.setPaymentinventory(st);
			bean.setSupplier1(Long.parseLong(fkSupplierId));
			bean.setSupplier(supplierName);
			bean.setBillNo(Double.parseDouble(billNo));
			bean.setBillNo1(billNo);
			bean.setTotalAmount(Double.parseDouble(grossTotal)); 
			//bean.setBalance(Double.parseDouble(balanceAmount));
			bean.setCredit(Double.parseDouble("0"));
			bean.setBalance(Double.parseDouble(grossTotal));
			bean.setPaymentType("credit");
			bean.setPaymentMode("N/A");
			bean.setPersonname("N/A");
			bean.setPaidAmount(Double.parseDouble("0"));
			 bean.setBankName("N/A");
			 bean.setNameOnCheck("N/A");
			 bean.setAccNum(Long.parseLong("00"));
			 bean.setChequeNum("N/A");
			 bean.setCardNum(Long.parseLong("00"));
			 bean.setPayment(Double.parseDouble("00"));
			 bean.setTdsdetails("00");
			 bean.setDebitAmount("00");
			//bean.setTotalAmount(Double.parseDouble(totalAmounte));
			//bean.setb
			
			
			 /*if(bankName==null)
			 {
				 bean.setBankName("N/A");
			 }
			 else
			 {
				 bean.setBankName("N/A");
			 }*/
			
			 
			/* if(nameOnCheck==null)
			 {
				 bean.setNameOnCheck(nameOnCheck);
			 }
			 else
			 {
				 bean.setNameOnCheck("N/A");
			 }*/
	
			 /*if(accNum==null)
			 {
				 bean.setAccNum(Long.parseLong(accNum));
			 }
			 else
			 {
				 bean.setAccNum(Long.parseLong("00"));
			 }*/
			 
			/* if(chequeNum==null)
			 {
				 bean.setChequeNum(chequeNum);
			 }
			 else
			 {
				 bean.setChequeNum("N/A");
			 }
			 
			 if(cardNum==null)
			 {
				 bean.setCardNum(Long.parseLong(cardNum));
			 }
			 else
			 {
				 bean.setCardNum(Long.parseLong("00"));
			 }
			
			*/

			SupplierPaymentDao dao1 = new SupplierPaymentDao();
			dao1.regSupPayment1(bean);
		
	 		}
	}
	
	//
	public void deletestrproduct(HttpServletRequest request, HttpServletResponse response ) {
		System.out.println("IN HELPER OF STORE MANAGEMENT");
		String strpro_id = request.getParameter("strpro_id");
		System.out.println(" ------------strpro_id----"+strpro_id);   
		StoreManagementDAO dao2 = new StoreManagementDAO();
		dao2.deletstreproductss(strpro_id);
		System.out.println("OUT OF HELPER");	
		}
	
	public Map getstoreDetailsForEdit1(Long fkTeacherId) {

	 	System.out.println("into helper class");
	 	StoreManagementDAO dao1 = new StoreManagementDAO();
		List catList = dao1.getAllstoreDetailsForEdit1(fkTeacherId);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			GetStoreManagementDetailBean b = new GetStoreManagementDetailBean();
			b.setProductName(o[0].toString());
			b.setBillNo(o[1].toString());
			b.setQuantity(o[2].toString());
			b.setBuyPrice(o[3].toString());
			b.setGst(Long.parseLong(o[4].toString()));
			b.setSupplierName(o[5].toString());
			//String d = o[6].toString();
			//String dt[] = d.split("-");
			//String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
			//b.setInsertDate(insertDate);
			b.setInsertDate(o[6].toString());
			map.put(b.getPkStoreManagementId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	
	}
	

	public void updatestoreInventoryInfoDetail(HttpServletRequest request,
			HttpServletResponse response) {
		Session session = null;
		String fkstoreId =request.getParameter("fkstoreId");
		String productName = request.getParameter("productName4");
		String billno = request.getParameter("billno4");
		String quantity = request.getParameter("quantity4");
		String buy_price = request.getParameter("buy_price4");
		String gst = request.getParameter("gst4");
		String gstamt = request.getParameter("gstamt4");
		String gross_total = request.getParameter("gross_total4");
		String supplierName=request.getParameter("supplierName4");
		String date=request.getParameter("date4");
		System.out.println("----------------------fkstoreId-----------------------"+fkstoreId);
		System.out.println("----------------------product name-----------------------"+productName);
		System.out.println("----------------------bill no-----------------------"+billno);
		System.out.println("----------------------quantity-----------------------"+quantity);
		System.out.println("-------------------------gst------------------"+gst);
		System.out.println("----------------------gst amt-----------------------"+gstamt);
		System.out.println("----------------------buy price-----------------------"+buy_price);
		System.out.println("----------------------groos total-----------------------"+gross_total);
		System.out.println("----------------------supplierName-----------------------"+supplierName);
		System.out.println("----------------------date-----------------------"+date);
		com.srb.utility.HibernateUtility hbu=null;
		Transaction transaction = null;
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Long pkStoreManagementId1=Long.parseLong(fkstoreId);
		StoreManagementHibernate det = (StoreManagementHibernate) session.load(StoreManagementHibernate.class, pkStoreManagementId1);
		det.setProductName(productName);
		det.setSupplierName(supplierName);
		det.setBuyPrice(Double.parseDouble(buy_price));
		det.setQuantity(Double.parseDouble(quantity));
		if(!"".equals(date)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(date);
				det.setStoreDate(joiningDate);
				//det.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   "+det.getStoreDate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
		det.setTotal(Double.parseDouble(gross_total));
		det.setGrossTotal(Double.parseDouble(gross_total));
		det.setBalanceAmount(Double.parseDouble(gross_total));
		det.setBillNo(Double.parseDouble(billno));
		det.setSupplier1((long) 1);
		det.setGst(Double.parseDouble(gst));
		det.setGstamt(Double.parseDouble(gstamt));
		System.out.println("updated in store manager bean");
		com.srb.utility.HibernateUtility hbu2=null;
		//Session session = null;
		 session.saveOrUpdate(det);
			transaction.commit();
		
		}
	
	// Hostel Inventory Edit/update
	
	public Map getHostelDetailsForEdit1(String fkTeacherId) {

	 	System.out.println("into helper class");
	 	StoreManagementDAO dao1 = new StoreManagementDAO();
		List catList = dao1.getHostelDetailsForEdit1(fkTeacherId);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			gethostelmanagementdetailbean b = new gethostelmanagementdetailbean();
			b.setPkhostelid(Long.parseLong(o[0].toString()));
			b.setBillNo(o[1].toString());
			b.setSupplierName(o[2].toString());
			/*String d = o[3].toString();
			String dt[] = d.split("-");
			String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
			b.setInsertDate(insertDate);*/
			b.setInsertDate(o[3].toString());
			b.setProductName(o[4].toString());
			b.setBuyPrice(o[5].toString());
			b.setQuantity(o[6].toString());
			b.setTotal(Double.parseDouble(o[7].toString()));
			b.setGrossTotal(Double.parseDouble(o[8].toString()));
			map.put(b.getProductName(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	
	}
	// update hostel inventory
	public void updatehostelInventoryInfoDetail(HttpServletRequest request,
			HttpServletResponse response) {
		Session session = null;
		String fkhostelreId=request.getParameter("fkhostelreId");
		String productName2 = request.getParameter("productName2");
		String billno2 = request.getParameter("billno2");
		String quantity2 = request.getParameter("quantity2");
		String buy_price2 = request.getParameter("buy_price2");
		String total2 = request.getParameter("total2");
		String supplierName2=request.getParameter("supplierName2");
		String date2=request.getParameter("date2");
		String hostelid=request.getParameter("hostelid");
		System.out.println("------------hostelleeerrrrrr----------------------------------"+fkhostelreId);
		System.out.println("----------------------storeid-----------------------"+hostelid);
		System.out.println("----------------------product name-----------------------"+productName2);
		System.out.println("----------------------bill no-----------------------"+billno2);
		System.out.println("----------------------quantity-----------------------"+quantity2);
		System.out.println("----------------------buy price-----------------------"+buy_price2);
		System.out.println("----------------------groos total-----------------------"+total2);
		System.out.println("----------------------supplierName-----------------------"+supplierName2);
		System.out.println("----------------------date-----------------------"+date2);
		com.srb.utility.HibernateUtility hbu=null;
		Transaction transaction = null;
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		 Long pkKitchenInvId= Long.parseLong(hostelid);
		 System.out.println("Store id"+pkKitchenInvId);
		 hostelmanagementhibernate det = (hostelmanagementhibernate) session.load(hostelmanagementhibernate.class, pkKitchenInvId);
		det.setPkhostelid(pkKitchenInvId);
		det.setProductName(productName2);
		det.setSupplierName(supplierName2);
		det.setBillNo(Double.parseDouble(billno2));
		if(!"".equals(date2)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(date2);
				det.setStoreDate(joiningDate);
				det.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   ");
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
		det.setBuyPrice(Double.parseDouble(buy_price2));
		det.setQuantity(Double.parseDouble(quantity2));
		det.setTotal(Double.parseDouble(total2));
		det.setGrossTotal(Double.parseDouble(total2));
		
		System.out.println("updated kitchen hibernate  bean");
		com.srb.utility.HibernateUtility hbu2=null;
		//Session session = null;
		 session.saveOrUpdate(det);
		transaction.commit();
		
		}
			
			
	}