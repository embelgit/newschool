package com.srb.helper;



import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;

import com.srb.bean.GestSupplyerDetailsForCashBook;
import com.srb.bean.LibraryPayment;
import com.srb.bean.SupplierPayemnt;
import com.srb.hibernate.LibraryPaymentBean;
import com.srb.hibernate.StoreManagementHibernate;

public class SupplierAccountBankHelper {
	
	

	// get all vendor bill no by vendor name
		public Map getAllVendorBillNo(String fk_supplier_id) {

			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getAllVendorBillNo(fk_supplier_id);
			Map map = new HashMap();
			
			for (int i = 0; i < list.size(); i++) 
			{
				Object[] o = (Object[]) list.get(i);
			
				StoreManagementHibernate bean = new StoreManagementHibernate();
				
				bean.setBillNo((Double.parseDouble(o[0].toString())));
				bean.setGrossTotal(Double.parseDouble(o[1].toString()));
				
				map.put(bean.getBillNo(), bean);
				

				/*
				 * String pendingBal = o[0].toString(); if
				 * (pendingBal.equals("0.0")) { continue;
				 * 
				 * }
				 */ /* else { */
				
				/* } */
				// bean.setTotalAmount((Double)o[1]);
			
			}
			return map;
		}
		
		// total amount on cashbook for vendor
		public Map getTotalAmtByBillNo( String supplierId) 
		{
			Double totbalAmt = 0.0;
			Double totAmt = 0.0;
			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getTotalAmtByBillNoForCustomer( supplierId);
			Map map = new HashMap();
			SupplierPayemnt bean = new SupplierPayemnt();
			for (int i = 0; i < list.size(); i++) 
			{
				Object[] o = (Object[]) list.get(i);
			
				//SupplierPayemnt bean = new SupplierPayemnt();
				
				String newTotal = (o[0].toString());
				Double newTotal1 = Double.valueOf(newTotal);
				 //Double newBalance = newTotal1 + newTotal1 +newTotal1 ;
				//System.out.println("newTotal1==="+newTotal1);
				//System.out.println("newBalance==="+newBalance);
				
				/*bean.setBalanceamount(Double.parseDouble(o[0].toString()));
				System.out.println(" hit this is BAlance==  "+i+" "+(o[0].toString()));
				bean.setTotal(Double.parseDouble(o[1].toString()));
				System.out.println(" hit this is Total== "+i+" "+(o[1].toString()));*/
				
				totbalAmt = totbalAmt + Double.parseDouble(o[0].toString());
				bean.setBalanceamount(totbalAmt);
				totAmt = totAmt + Double.parseDouble(o[1].toString());
				bean.setTotal(totAmt);
				//map.put(bean.getSupid(), bean);
			}
			map.put(bean.getSupid(), bean);
			return map;
		}
		
		
		//Library total amount
		public Map getLibraryTotalAmtByBillNo( String supplierId) 
		{
			Double totbalAmt = 0.0;
			Double totAmt = 0.0;
			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getLibraryTotalAmtByBillNoForCustomer( supplierId);
			Map map = new HashMap();
			LibraryPayment bean1 = new LibraryPayment();
			for (int i = 0; i < list.size(); i++) 
			{
				Object[] o = (Object[]) list.get(i);
			
				//SupplierPayemnt bean = new SupplierPayemnt();
				
				String newTotal = (o[0].toString());
				Double newTotal1 = Double.valueOf(newTotal);
				
				
				totbalAmt = totbalAmt + Double.parseDouble(o[0].toString());
				bean1.setBalanceamount(totbalAmt);
				totAmt = totAmt + Double.parseDouble(o[1].toString());
				bean1.setTotal(totAmt);
				//map.put(bean.getSupid(), bean);
			}
			map.put(bean1.getSupid(), bean1);
			return map;
		}
		
		
		
		
		// Get payment all By Employee Details
		public Map getTotalAmtByBillNoEmployee(String fk_teacher_id) 
		{

			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getTotalAmtByBillNoEmployee(fk_teacher_id);
			Map map = new HashMap();

			for (int i = 0; i < list.size(); i++) 
			{
				Object[] o = (Object[]) list.get(i);
			
				StoreManagementHibernate bean = new StoreManagementHibernate();
				
				String newTotal = (o[1].toString());
				Double newTotal1 = Double.valueOf(newTotal);
				
				bean.setBalanceAmount(Double.parseDouble(o[1].toString()));
				bean.setTotal(Double.parseDouble(o[1].toString()));
				
				map.put(bean.getGrossTotal(), bean);
			}
			return map;
		}
		
/*		// remaining balance by  supplier by kishor
		public Map getRemainingAmtByBillNo(String billNo, String fk_supplier_id, String totalAmount) {

			System.out.println("bill no = " + billNo);
			System.out.println("supplier = " + fk_supplier_id);

			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getbalanceAmtByBillNo(billNo, fk_supplier_id);
			Map map = new HashMap();
			// System.out.println(list.size()+"LIST SIZE");
			int sic = list.size();
			if (sic == 0) {
				
				 * GetSupplierDetails bean = new GetSupplierDetails(); Double
				 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
				 * map.put(bean.getBalance(),bean);
				 

				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
				Double totalAmt = dao.getTotalAmt(billNo, fk_supplier_id);
				bean.setBalance(totalAmt);
				map.put(bean.getBalance(), bean);
			} else {
				for (int i = 0; i < list.size(); i++) {
					Object[] o = (Object[]) list.get(i);
					GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
					Double newBal = (Double.parseDouble(o[0].toString()));
					System.out.println("hi this is new bala++++++++++++++++++" + (o[0].toString()));

					// Double newBal1 = Double.valueOf(newBal);
					System.out.println(newBal + "NEW BALANCE");

					bean.setBalance(newBal);

					System.out.println("***************" + o[0]);
					map.put(bean.getBalance(), bean);
				}
			}

			return map;
		}*/
	// Remaining Balance By Supplierwise By Kishor
		public Map getBalanceAmtBySupplierWise(String supplierId) {

			//System.out.println("bill no = " + billNo);
			//System.out.println("supplier = " + fk_supplier_id);

			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getbalanceAmtByBillNo(supplierId);
			Map map = new HashMap();
			// System.out.println(list.size()+"LIST SIZE");
			int sic = list.size();
			if (sic == 0) {
				/*
				 * GetSupplierDetails bean = new GetSupplierDetails(); Double
				 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
				 * map.put(bean.getBalance(),bean);
				 */

				SupplierPayemnt bean = new SupplierPayemnt();
				Double totalAmt = dao.getTotalAmt(supplierId);
				bean.setBalanceamount(totalAmt);
				map.put(bean.getBalanceamount(), bean);
			} else {
				for (int i = 0; i < list.size(); i++) {
					System.out.println("in firsrt for");
					System.out.println("this is i value   " + i + "and list size " + list.size());
				//	Object[] o = (Object[]) list.get(i);
					GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
					String str = list.get(i).toString();
					Double newBal = Double.valueOf(str);
					System.out.println("new Bal in helper====="+newBal);
					/*Double totalamount = (Double.parseDouble(o[2].toString()));*/

					/*
					 * if (supplier.equals(supplier)) {
					 * System.out.println("hi this is kishor in if "); total =
					 * newBal + totalamount;
					 * 
					 * bean.setBalance(total);
					 * 
					 * 
					 * 
					 * 
					 * } else {
					 */
					System.out.println("hi this is kishor in else   ");

					bean.setBalance(newBal);

					/* } */
				//	System.out.println("***************" + o[0]);
					map.put(bean.getBalance(), bean);
				}
			}

			return map;
		}
	
		
		
		//Library balance amount
		public Map getLibraryBalanceAmtBySupplierWise(String supplierId) {

			//System.out.println("bill no = " + billNo);
			//System.out.println("supplier = " + fk_supplier_id);

			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getLibrarybalanceAmtByBillNo(supplierId);
			Map map = new HashMap();
			// System.out.println(list.size()+"LIST SIZE");
			int sic = list.size();
			if (sic == 0) {
				/*
				 * GetSupplierDetails bean = new GetSupplierDetails(); Double
				 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
				 * map.put(bean.getBalance(),bean);
				 */

				LibraryPayment bean = new LibraryPayment();
				Double totalAmt = dao.getLibraryTotalAmt(supplierId);
				bean.setBalanceamount(totalAmt);
				map.put(bean.getBalanceamount(), bean);
			} else {
				for (int i = 0; i < list.size(); i++) {
					System.out.println("in firsrt for");
					System.out.println("this is i value   " + i + "and list size " + list.size());
				//	Object[] o = (Object[]) list.get(i);
					GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
					String str = list.get(i).toString();
					Double newBal = Double.valueOf(str);
					System.out.println("new Bal in helper====="+newBal);
					/*Double totalamount = (Double.parseDouble(o[2].toString()));*/

					/*
					 * if (supplier.equals(supplier)) {
					 * System.out.println("hi this is kishor in if "); total =
					 * newBal + totalamount;
					 * 
					 * bean.setBalance(total);
					 * 
					 * 
					 * 
					 * 
					 * } else {
					 */
					System.out.println("hi this is kishor in else   ");

					bean.setBalance(newBal);

					/* } */
				//	System.out.println("***************" + o[0]);
					map.put(bean.getBalance(), bean);
				}
			}

			return map;
		}
		
		
		
		//get all Employee Details 
		public Map getRemainingAllBillsforemployee(String supplierId) {

			//System.out.println("bill no = " + billNo);
			System.out.println("supplier = " + supplierId);

			SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
			List list = dao.getbalanceAmtByEmployee(supplierId);
			Map map = new HashMap();
			// System.out.println(list.size()+"LIST SIZE");
			int sic = list.size();
			if (sic == 0) {
				/*
				 * GetSupplierDetails bean = new GetSupplierDetails(); Double
				 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
				 * map.put(bean.getBalance(),bean);
				 */

				SupplierPayemnt bean = new SupplierPayemnt();
				Double totalAmt = dao.getTotalAmtEmployee(supplierId);
				bean.setBalanceamount(totalAmt);
				map.put(bean.getBalanceamount(), bean);
			} else {
				for (int i = 0; i < list.size(); i++) {
					System.out.println("in firsrt for");
					System.out.println("this is i value   " + i + "and list size " + list.size());
					Object[] o = (Object[]) list.get(i);
					GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
					//String str = list.get(i).toString();
					//Double newBal = Double.valueOf(str);
					//System.out.println("new Bal in helper====="+newBal);
					Double balamt  = (Double.parseDouble(o[0].toString()));
					System.out.println("hi thius is ===="+(o[0].toString()));
					Double totalamount = (Double.parseDouble(o[1].toString()));
					System.out.println("hi thius is ===="+(o[1].toString()));

					/*
					 * if (supplier.equals(supplier)) {
					 * System.out.println("hi this is kishor in if "); total =
					 * newBal + totalamount;
					 * 
					 * bean.setBalance(total);
					 * 
					 * 
					 * 
					 * 
					 * } else {
					 */
					System.out.println("hi this is kishor in else   ");

					bean.setBalanceamount(balamt);

					/* } */
				//	System.out.println("***************" + o[0]);
					map.put(bean.getBalanceamount(), bean);
				}
			}

			return map;
		}
}
