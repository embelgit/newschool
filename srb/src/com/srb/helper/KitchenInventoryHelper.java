package com.srb.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.KitchenInventoryBean;
import com.srb.bean.ProductDetailsBean;
import com.srb.bean.StockManagementBean;
import com.srb.dao.KitchenInventoryDao;
import com.srb.dao.ProductDetailsDao;
import com.srb.dao.StoreManagementDAO;
import com.srb.dao.SupplierPaymentDao;
import com.srb.hibernate.KitchenInventoryHibernate;
import com.srb.hibernate.SupplierPaymentBean;
import com.srb.utility.HibernateUtility;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class KitchenInventoryHelper 
{
	
		// get Grid for kitchen inventory	
		public List getGridForKitchenInventory(String productName, String fkProductId)
		{
			/*String productName = request.getParameter("productName");
			String fkProductId = request.getParameter("fkProductId");
			*/
			Map<String, ProductDetailsBean> map = new HashMap<String, ProductDetailsBean>();
			ProductDetailsDao dao = new ProductDetailsDao();
			
			List<ProductDetailsBean> exp1List = dao.getProductDetails(productName,fkProductId);

			return exp1List;
			
		}
		
		
		// add kitchen inventory
		public void addKitchenInventory(HttpServletRequest request, HttpServletResponse response) 
		{
			String cut = request.getParameter("count");
			
			int count = Integer.parseInt(cut);
			for(int i=0;i<count;i++)
			{
				String productName = request.getParameter("productName"+i);
				String unit = request.getParameter("unit"+i);
				String quantity = request.getParameter("quantity"+i);
				String buyPrice = request.getParameter("buyPrice"+i);
				String total = request.getParameter("grossTotal");
				System.out.println("hi this is total =="+total);
				
				
				String fksupplierId = request.getParameter("fksupplierId");
				String billNo = request.getParameter("billNo");
				String storeDate = request.getParameter("storeDate");
				String supplierName = request.getParameter("supplierName");
				String grossTotal = request.getParameter("grossTotal");
				String subTotal = request.getParameter("subTotal");
				String gst = request.getParameter("gst");
				String gstAmount = request.getParameter("gstAmount");
				
				String fkProductId = request.getParameter("fkProductId");
				
				
		
		/*		System.out.println("------------------productName--------------------  ::  "+productName);
				System.out.println("-------------------unit-------------------  ::  "+unit);
				System.out.println("------------------quantity--------------------  ::  "+quantity);
				System.out.println("-------------------buyPrice-------------------  ::  "+buyPrice);
				System.out.println("--------------------total------------------  ::  "+total);
				System.out.println("--------------------billNo------------------  ::  "+billNo);
				System.out.println("--------------------storeDate------------------  ::  "+storeDate);
				System.out.println("--------------------supplierName------------------  ::  "+supplierName);
				System.out.println("--------------------grossTotal------------------  ::  "+grossTotal);
				System.out.println("--------------------subTotal------------------  ::  "+subTotal);
				System.out.println("--------------------gst------------------  ::  "+gst);
				System.out.println("--------------------gstAmount------------------  ::  "+gstAmount);
				System.out.println("--------------------fksupplierId------------------  ::  "+fksupplierId);
	*/			
				
				KitchenInventoryHibernate kih = new KitchenInventoryHibernate();
				
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
				
			
				kih.setDate(sDate);
				
				kih.setFkProductId(Long.parseLong(fkProductId));
				
				kih.setProductName(productName);
				kih.setUnit(unit);
				kih.setQuantity(Long.parseLong(quantity));
				kih.setBuyPrice(Double.parseDouble(buyPrice));
				kih.setTotal(Double.parseDouble(total));
				kih.setBillNo(billNo);
				kih.setSuppilerName(supplierName);
				kih.setFkSupplierId(Long.parseLong(fksupplierId));
				kih.setSubTotal(Double.parseDouble(subTotal));
				kih.setGst(Long.parseLong(gst));
				kih.setGstAmount(Double.parseDouble(gstAmount));
				kih.setGrossTotal(Double.parseDouble(grossTotal));
				kih.setBalanceAmount(Double.parseDouble(grossTotal));
				
				KitchenInventoryDao kiDao = new KitchenInventoryDao();
				kiDao.addKitchenInventory(kih);
				
				
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
				String kit = "kitchen";
				Date d1 = new Date();
				bean.setInsertDate(d1);
				
				
				//bean.setTxId(Txid);
				bean.setPaymentinventory(kit);
				bean.setSupplier1(Long.parseLong(fksupplierId));
				bean.setSupplier(supplierName);
				bean.setBillNo(Double.parseDouble(billNo));
				bean.setBillNo1(billNo);
				bean.setTotalAmount(Double.parseDouble(grossTotal)); 
				bean.setPersonname("N/A");
				bean.setBalance(Double.parseDouble(grossTotal));
				//bean.setBalance(Double.parseDouble(balanceAmount));
				 bean.setCredit(Double.parseDouble("0"));
				 bean.setPaymentType("credit");
				 bean.setPaymentMode("N/A");
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
		
		
		//kitchen inventory report between to date
		public List getkitchenInventoryDetailsBetweenTwoDate(HttpServletRequest request, HttpServletResponse response) 
		{
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
	         Map<Long,KitchenInventoryBean> map = new HashMap<Long,KitchenInventoryBean>();
	 		
	         KitchenInventoryDao dao = new KitchenInventoryDao();
	 		List<KitchenInventoryBean> expList = dao.getKitchenInventoryDetailBetweenTwoDate(startDate,endDate);
	 		
	 		return expList;
		
		}
//
		public void deletekitchenproduct(HttpServletRequest request, HttpServletResponse response ) {
			
			String kitpro_id = request.getParameter("kitpro_id");
			   
			KitchenInventoryDao dao2 = new KitchenInventoryDao();
			dao2.deletkitchenproductss(kitpro_id);
				
			}
//
		public void deletehosproduct(HttpServletRequest request, HttpServletResponse response ) {
			
			String hostel_id = request.getParameter("hostel_id");
			   System.out.println("id - "+hostel_id);
			KitchenInventoryDao dao2 = new KitchenInventoryDao();
			dao2.delethostelproductss(hostel_id);
				
			}
		
		public Map getkitchenDetailsForEdit1(String fkTeacherId) {

		 	System.out.println("into helper class");
		 	KitchenInventoryDao dao1 = new KitchenInventoryDao();
			List catList = dao1.getAllkitchenDetailsForEdit1(fkTeacherId);
			
			Map  map =  new HashMap();
			for(int i=0;i<catList.size();i++)
			{
				Object[] o = (Object[])catList.get(i);
			
				KitchenInventoryBean b = new KitchenInventoryBean();
				b.setProductName(o[0].toString());
				b.setBillNo(o[1].toString());
				b.setQuantity(o[2].toString());
				b.setBuyPrice(o[3].toString());
				b.setGst(o[4].toString());
				b.setSupplierName(o[5].toString());
				/*String d = o[6].toString();
				String dt[] = d.split("-");
				String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
				b.setDate(insertDate);*/
				b.setDate(o[6].toString());
				b.setPk_store_management_id(Long.parseLong(o[7].toString()));
				map.put(b.getProductName(),b);
			}
			System.out.println("out of helper return map : "+map);
			return map;
		
		
		}

		
		public void updatKitchenInventoryInfoDetail(HttpServletRequest request,
				HttpServletResponse response) {
			Session session = null;
			String fkstoreId =request.getParameter("fkstoreId1");
			String productName = request.getParameter("productName1");
			String billno = request.getParameter("billno1");
			String quantity = request.getParameter("quantity1");
			String buy_price = request.getParameter("buy_price1");
			String gst = request.getParameter("gst1");
			String gstamt = request.getParameter("gstamt1");
			String gross_total = request.getParameter("gross_total1");
			String supplierName=request.getParameter("supplierName1");
			String date=request.getParameter("date1");
			String storeid=request.getParameter("storeid");
			System.out.println("----------------------storeid-----------------------"+storeid);
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
			 Long pkKitchenInvId= Long.parseLong(storeid);
			 System.out.println("Store id"+pkKitchenInvId);
			KitchenInventoryHibernate det = (KitchenInventoryHibernate) session.load(KitchenInventoryHibernate.class, pkKitchenInvId);
			det.setPkKitchenInvId(pkKitchenInvId);
			det.setBillNo(billno);
			if(!"".equals(date)) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		//		Date dateOfBirth = null;
				Date joiningDate = null;
				try{
			//		dateOfBirth = format.parse(dob);
			//		det.setDob(dateOfBirth);
					joiningDate = format.parse(date);
					//det.setStoreDate(joiningDate);
					det.setDate(joiningDate);
					System.out.println("det.getJdate() -   ");
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				}
			det.setSuppilerName(supplierName);
			det.setProductName(productName);	
			det.setQuantity(Long.parseLong(quantity));
			det.setBuyPrice(Double.parseDouble(buy_price));
			det.setTotal(Double.parseDouble(gross_total));
			det.setGrossTotal(Double.parseDouble(gross_total));
			det.setSubTotal(Double.parseDouble(gross_total));
			det.setGst(Long.parseLong(gst));
			det.setGstAmount(Double.parseDouble(gstamt));
			det.setBalanceAmount(Double.parseDouble(gross_total));
			System.out.println("updated kitchen hibernate  bean");
			com.srb.utility.HibernateUtility hbu2=null;
			//Session session = null;
			 session.saveOrUpdate(det);
			transaction.commit();
			
			}
				
		}
