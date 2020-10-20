package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.dao.GoodsReceiveDao;
import com.srb.dao.KitchenInventoryDao;
import com.srb.dao.LibraryPaymentDao;
import com.srb.dao.StoreManagementDAO;
import com.srb.dao.SupplierPaymentDao;
import com.srb.hibernate.KitchenInventoryHibernate;
import com.srb.hibernate.LibraryPaymentBean;
import com.srb.hibernate.StoreManagementHibernate;
import com.srb.hibernate.SupplierPaymentBean;
import com.srb.utility.HibernateUtility;



public class SupplierCashBankHelper {
	



	
	
	Double newBal;
	Double balan;
	Double finalpayamt;
	private String pk_vendor_payment_id;
	
	//long customerBill =101l;
	String customerBill="";
	public void regSupplierCashBank(HttpServletRequest request, HttpServletResponse response)
	{
		    System.out.println("In helper");
		    Long Txid=0l;
			
			SupplierPaymentDao dao1=new SupplierPaymentDao();
			List listtxid=dao1.getSupplierPaymentTxid();
			
			if(listtxid.size()<=0)
			{
				Txid=1l;
			}
			else
			{
			for (int i = 0; i < listtxid.size(); i++) {
				
			SupplierPaymentBean bean=(SupplierPaymentBean) listtxid.get(i);
			Txid=bean.getTxId();
			Txid++;
			}
		}
		    String fk_supplier_id = request.getParameter("supplierId");
		    System.out.println("hi this is fksuppler id is ====="+fk_supplier_id);
		    String supplier = request.getParameter("supplier");
		   // String billNo = request.getParameter("billNo");
		    //System.out.println("hi this is BIll No=== "+billNo);
			String totalAmount = request.getParameter("totalAmount");
			String balanceAmount = request.getParameter("balanceAmount");
			String paymentType = request.getParameter("paymentType");
			String paymentMode = request.getParameter("paymentMode");
			String personname = request.getParameter("personname");
			String paidAmount = request.getParameter("paidAmount");
			System.out.println("hi this is PAid amount IS ===="+paidAmount);
			finalpayamt= Double.valueOf(paidAmount);
			
			String totalAmounte = request.getParameter("totalAmounte");
			String balanceAmounte = request.getParameter("balanceAmounte");
			
			String bankName = request.getParameter("bankName");
			String nameOnCheck = request.getParameter("nameOnCheck");
			String accNum = request.getParameter("accNum");
			String chequeNum = request.getParameter("chequeNum");
			String cardNum = request.getParameter("cardNum");
			
			System.out.println(("bankName "+bankName+"  cardNum "+cardNum+"  accNum  "+accNum+"  nameOnCheck  "+nameOnCheck+"  chequeNum  "+chequeNum));
			
		/*	System.out.println("--------JSP-----------fk_supplier_id---------------------  ::"+fk_supplier_id);
			System.out.println("--------JSP----------Supplier Name----------------------  ::"+supplier);
			
			
			
			System.out.println("-------------------billNo---------------------  ::"+billNo);
			System.out.println("-----------------totalAmount-----------------------  ::"+totalAmount);
			System.out.println("----------------balanceAmount------------------------  ::"+balanceAmount);
			System.out.println("--------------------paymentType--------------------  ::"+paymentType);
			System.out.println("--------------------paymentMode--------------------  ::"+paymentMode);
			System.out.println("-----------------personname-----------------------  ::"+personname);
			System.out.println("-----------------paidAmount-----------------------  ::"+paidAmount);
			
		*/	
			Double balAmount = Double.parseDouble(balanceAmount);
			Double pdAmount = Double.parseDouble(paidAmount);
			
			Double amount = balAmount - pdAmount;
			System.out.println(" After PAid amount payment AMount is ====="+amount);
		
			/*StoreManagementDAO amDao = new StoreManagementDAO();
			List list22 = amDao.getAllSupplier();
			
			
			for (int j = 0; j < list22.size(); j++) 
			{
				
				
				StoreManagementHibernate bean = (StoreManagementHibernate) list22.get(j);
				
				String supName = bean.getSupplierName();
				//Double billNum = bean.getBillNo();
				Long supFkId = bean.getSupplier1();
				
				if(supName.equals(supplier) && billNum.equals(Double.parseDouble(billNo)) && supFkId.equals(Long.parseLong(fk_supplier_id)))
				if(supName.equals(supplier) && supFkId.equals(Long.parseLong(fk_supplier_id)))
				{
					
					HibernateUtility hbu = HibernateUtility.getInstance();
					Session session2 = hbu.getHibernateSession();
					Transaction transaction = session2.beginTransaction();
			
					
					//Query query2 = session2.createSQLQuery("update store_management set balance_amount ="+amount+" where  fk_supplier_id ="+fk_supplier_id+" and bill_no ="+billNo);
					Query query2 = session2.createSQLQuery("update store_management set balance_amount ="+amount+" where  fk_supplier_id ="+fk_supplier_id+" ");
					int count = query2.executeUpdate();
					
					transaction.commit();
					break;
				
					
					}
					else
					{
						
					KitchenInventoryDao kDao = new KitchenInventoryDao();
					List list222 = kDao.getAllSupplierKitchenInv();
					
					for(int k = 0; k < list222.size(); k++) 
					{
					
						KitchenInventoryHibernate beanKin = (KitchenInventoryHibernate) list222.get(j);
						
						String supNameKic = beanKin.getSuppilerName();
						System.out.println("hi this kitchen Supplier supNameKic== "+supNameKic);
						String billNumK = beanKin.getBillNo();
						System.out.println("hi this kitchen billNumK==  "+billNumK);
						//Double billNumKic = Double.parseDouble(billNumK);
						//System.out.println("hi this kitchen billNumKic==  "+billNumKic);
						Long supKicFkId = beanKin.getFkSupplierId();
						System.out.println("hi this is Kitchen supKicFkId=="+supKicFkId);
						
						
						if(supNameKic.equals(supplier) && billNumKic.equals(Double.parseDouble(billNo)) && supKicFkId.equals(Long.parseLong(fk_supplier_id)))
						if(supNameKic.equals(supplier)  && supKicFkId.equals(Long.parseLong(fk_supplier_id)))
						{
							
							HibernateUtility hbu = HibernateUtility.getInstance();
							Session session2 = hbu.getHibernateSession();
							Transaction transaction = session2.beginTransaction();
					
							
							//Query query22 = session2.createSQLQuery("update kitchen_inventory set balance_amount ="+amount+" where  fk_supplier_id ="+fk_supplier_id+" and bill_no ="+billNo);
							Query query22 = session2.createSQLQuery("update kitchen_inventory set balance_amount ="+amount+" where  fk_supplier_id ="+fk_supplier_id+" ");
							int count2 = query22.executeUpdate();
							
							transaction.commit();
							break;
							
						}
					}
					
				}
				
			}*/
			
			com.srb.hibernate.SupplierPaymentBean bean = new com.srb.hibernate.SupplierPaymentBean();
			
			bean.setSupplier1(Long.parseLong(fk_supplier_id));
			bean.setTxId(Txid);
			bean.setSupplier(supplier);
			//bean.setBillNo(Double.parseDouble(billNo));
			bean.setTotalAmount(Double.parseDouble(totalAmount)); 
			//bean.setBalance(Double.parseDouble(balanceAmount));
			bean.setBalance((amount));
			bean.setPaymentType(paymentType);
			bean.setPaymentMode(paymentMode);
			bean.setPersonname(personname);
			bean.setPaidAmount(Double.parseDouble(paidAmount));
			//bean.setTotalAmount(Double.parseDouble(totalAmounte));
			//bean.setb
			
			
			 if(!"".equals(bankName))
			 {
				 bean.setBankName(bankName);
			 }
			 else
			 {
				 bean.setBankName("N/A");
			 }
			
			 
			 if(!"".equals(nameOnCheck))
			 {
				 bean.setNameOnCheck(nameOnCheck);
			 }
			 else
			 {
				 bean.setNameOnCheck("N/A");
			 }
	
			 if(!"".equals(accNum))
			 {
				 bean.setAccNum(Long.parseLong(accNum));
			 }
			 else
			 {
				 bean.setAccNum(Long.parseLong("00"));
			 }
			 
			 if(!"".equals(chequeNum))
			 {
				 bean.setChequeNum(chequeNum);
			 }
			 else
			 {
				 bean.setChequeNum("N/A");
			 }
			 
			 if(!"".equals(cardNum))
			 {
				 bean.setCardNum(Long.parseLong(cardNum));
			 }
			 else
			 {
				 bean.setCardNum(Long.parseLong("00"));
			 }
			
			 
			 
			 
			 HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				
				//Query to get latest paid amount
				/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
				//Query query = session.createSQLQuery("SELECT balance ,bill_no from vendor_payment WHERE  fk_supplier_id =:fk_supplier_id group by bill_no ;");
				Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  fk_supplier_id =:fk_supplier_id group by bill_no ;");
				query.setParameter("fk_supplier_id",fk_supplier_id);
				List<Object[]> list = query.list();
				
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] objects = (Object[]) iterator.next();
					String billno = objects[1].toString();
					System.out.println("hi this is kishor1111111111111111155555555555555++++++++++++"+billno);
					
					Session session1 = hbu.getHibernateSession();
					
					//Query to get latest paid amount
					/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
					//Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from vendor_payment WHERE   bill_no =:billno ORDER BY  pk_vendor_payment_id  DESC LIMIT 1;");
					Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from supplier_payment WHERE   bill_no =:billno ORDER BY  pk_supplier_payment_id  DESC LIMIT 1;");
					query1.setParameter("billno",billno);
					List<Object[]> list1 = query1.list();
					
					for (Iterator iterator1 = list1.iterator(); iterator1.hasNext();) {
						Object[] objects1 = (Object[]) iterator1.next();
						String newBal1 = objects1[0].toString();
						String bill_no =String.valueOf(objects1[1].toString());
						//Long bill_no= Long.valueOf(objects1[1].toString());
						String tot = objects1[0].toString();
						System.out.println("balance   ==  "+newBal1);
							
						 Double bal= Double.valueOf(newBal1);
						// bal= Double.valueOf(newBal1);
						 if(bal == 0.00 || bal == 0.0 || bal == 0 ){
							 System.out.println("hi this kishor =");
						
						 }else if(bal<=finalpayamt){
							 Double balamt = finalpayamt - bal;
							 finalpayamt = balamt;
							 
							 bean.setBalance(0.0);
							 bean.setBillNo(Double.parseDouble((bill_no)));
							 bean.setPaymentType(paymentType);
							 bean.setCredit(bal);
							 bean.setTotalAmount(Double.valueOf(tot));
							 
							 SupplierPaymentDao dao = new SupplierPaymentDao();
							 dao.regSupPayment(bean);
							 
						 }
						 else if(finalpayamt==0.0){
							 System.out.println("hi this kishor =");
						 }else{
							 Double balamt = bal - finalpayamt;
							/* finalpayamt = 0.0;*/
							 
							 bean.setBalance(balamt);
							 bean.setBillNo(Double.parseDouble(bill_no));
							 bean.setPaymentType(paymentType);
							 bean.setCredit(finalpayamt);
							 bean.setTotalAmount(Double.valueOf(tot));
							 
							 SupplierPaymentDao dao = new SupplierPaymentDao();
							 dao.regSupPayment(bean);
							 
							 finalpayamt = 0.0;
						 }
						 
						 
			         
					}
						
		         
				}
			

			/*SupplierPaymentDao dao = new SupplierPaymentDao();
			dao.regSupPayment(bean);*/
			
			
		/*	
			bean.setSupplier(supplier);
			bean.setSupplier1(Long.parseLong(fk_supplier_id));
			bean.setBillNo(Double.parseDouble(billNo));
			bean.setPersonname(personname);
			
			//payment details
			if(paymentMode==null){
				bean.setPaymentMode("N/A");
			}
			else{
				bean.setPaymentMode(paymentMode);
			}

			if(paymentMode.equals("cheque"))
			{
			
			 if(chequeNum==null){
					bean.setChequeNum("N/A");
				}
				else{
					bean.setChequeNum(chequeNum);
				}
			 
			 if(nameOnCheck==null){
					bean.setNameOnCheck("N/A");
				}
				else{
					bean.setNameOnCheck(nameOnCheck);
				}
			 }
			else if(paymentMode.equals("card")){
			
			int cardNumLength = cardNum.length();
			 if(cardNumLength > 0){
					
					bean.setCardNum(Long.parseLong(cardNum));
				}
				else{
					bean.setCardNum(null);
				}
			}
	
			else if(paymentMode.equals("neft")){
			 if(bankName==null){
					bean.setBankName("N/A");
				}
				else{
					bean.setBankName(bankName);
				}
			 
			 int accNumLength = accNum.length();
			 if(accNumLength > 0){
				 bean.setAccNum(Long.parseLong(accNum));	
				
				}
				else{
					 bean.setAccNum(null);
				}
			}	
		 
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dateobj = new Date();
			System.out.println(dateFormat1.format(dateobj));
		
			bean.setInsertDate(dateobj);
			
			
			HibernateUtility hbu = HibernateUtility.getInstance();
			Session session = hbu.getHibernateSession();
			
			//Query to get latest paid amount
			Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");
			query.setParameter("billNo",billNo);
			List<Object[]> list = query.list();
			
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				Object[] objects = (Object[]) iterator.next();
				String newBal = objects[0].toString();
				System.out.println("hi this is kishor11111111111111111++++++++++++"+newBal);
					//BigDecimal bigDecimal = new BigDecimal(newBal);
	                bal= Double.valueOf(newBal);
	           
				System.out.println(bal);
			}
			
	
		
			if (bal==null) {
				
				Double balance = Double.parseDouble(totalAmount);
				
				if(paymentType.equals("credit"))
				{
					Double newBal = balance - Double.parseDouble(paidAmount);
					
            		 Transaction transaction = session.beginTransaction();
            		 
					
					bean.setBalance(newBal);
					bean.setPaymentType(paymentType);
					bean.setCredit(Double.parseDouble(paidAmount));
					
					//this method get data from billDetail table using CustomerBillBean1 through this (getAllPurschaseEntry) method
					GoodsReceiveDao dao1 = new GoodsReceiveDao();
			        List stkList2  = dao1.getAllPurschaseEntry();
			        
			        System.out.println("List size"+stkList2.size());
					
			        for(int j=0;j<stkList2.size();j++){
			        	
			        	StoreManagementHibernate st = (StoreManagementHibernate)stkList2.get(j);
					Double bill=st.getBillNo();
					Long pk_goods_receive_id=st.getPkStoreManagementId();
					
					if(billNo.equals(bill)){
					
					System.out.println("inside if");
						
					StoreManagementHibernate updateStock = (StoreManagementHibernate) session.get(StoreManagementHibernate.class, new Long(pk_goods_receive_id));
					updateStock.setGrossTotal(newBal);
            		 
            		session.saveOrUpdate(updateStock);
            		transaction.commit();
            		
					}
					}
				}	
				
				else
				{
					if(paymentType.equals("debit"))
					{
						Double newBal = balance + Double.parseDouble(paidAmount);
						//Double newbal1 =balance + Double.parseDouble(supPay);
						
					 
						
						 Transaction transaction = session.beginTransaction();
						
						bean.setBalance(newBal);
						bean.setPaymentType(paymentType);
						bean.setCredit(Double.parseDouble(paidAmount));
						
						GoodsReceiveDao dao1 = new GoodsReceiveDao();
				        List stkList2  = dao1.getAllPurschaseEntry();
				        
				        System.out.println("List size"+stkList2.size());
						
				        for(int j=0;j<stkList2.size();j++){
				        	
				        	StoreManagementHibernate st = (StoreManagementHibernate)stkList2.get(j);
				        	Double bill=st.getBillNo();
							Long pk_goods_receive_id=st.getPkStoreManagementId();
						
						if(billNo.equals(bill)){
						
						System.out.println("inside if");
							
						StoreManagementHibernate updateStock = (StoreManagementHibernate) session.get(StoreManagementHibernate.class, new Long(pk_goods_receive_id));
						updateStock.setGrossTotal(newBal);
	            		 
	            		session.saveOrUpdate(updateStock);
	            		transaction.commit();
						}
				        }
					}
					else{
					
					bean.setCredit(0.0);
					}
				}
				
				
				
					bean.setTotalAmount(Double.parseDouble(totalAmount));
					
					SupplierPaymentDao dao = new SupplierPaymentDao();
					dao.regSupPayment(bean);
			}
			
			else{
				
				Double balance = Double.parseDouble(totalAmount);
				
				
				
				if(paymentType.equals("credit"))
				{
					Double newBal = bal - Double.parseDouble(paidAmount);
					
					bean.setBalance(newBal);
					bean.setPaymentType(paymentType);
					bean.setCredit(Double.parseDouble(paidAmount));
					
					 Transaction transaction = session.beginTransaction();
					
					GoodsReceiveDao dao1 = new GoodsReceiveDao();
			        List stkList2  = dao1.getAllPurschaseEntry();
			        
			        System.out.println("List size"+stkList2.size());
					
			        for(int j=0;j<stkList2.size();j++){
			        	
			        	StoreManagementHibernate st = (StoreManagementHibernate)stkList2.get(j);
			        	Double bill=st.getBillNo();
						Long pk_goods_receive_id=st.getPkStoreManagementId();
					
					if(billNo.equals(bill)){
					
					System.out.println("inside if By VK");
						
					StoreManagementHibernate updateStock = (StoreManagementHibernate) session.get(StoreManagementHibernate.class, new Long(pk_goods_receive_id));
					updateStock.setGrossTotal(newBal);
            		 
            		session.saveOrUpdate(updateStock);
            		transaction.commit();
					}
			       }
				}
				else{
					if(paymentType.equals("debit"))
					{
						Double newBal = bal + Double.parseDouble(paidAmount);
						System.out.println("debit balance = "+supPay);
						System.out.println("current balace = "+balance);
						System.out.println("debit balance = " +newBal);
						bean.setBalance(newBal);
						bean.setPaymentType(paymentType);
						bean.setCredit(Double.parseDouble(paidAmount));
						
						Transaction transaction = session.beginTransaction();
						
						GoodsReceiveDao dao1 = new GoodsReceiveDao();
				        List stkList2  = dao1.getAllPurschaseEntry();
				        
				        System.out.println("List size"+stkList2.size());
						
				        for(int j=0;j<stkList2.size();j++){
				        	
				        	StoreManagementHibernate st = (StoreManagementHibernate)stkList2.get(j);
				        	Double bill=st.getBillNo();
							Long pk_goods_receive_id=st.getPkStoreManagementId();
						
						if(billNo.equals(bill)){
						
						System.out.println("inside if By VK");
							
						StoreManagementHibernate updateStock = (StoreManagementHibernate) session.get(StoreManagementHibernate.class, new Long(pk_goods_receive_id));
						updateStock.setGrossTotal(newBal);
	            		session.saveOrUpdate(updateStock);
	            		transaction.commit();
						}
				        }
				       }
					else{
					
					bean.setCredit(0.0);
					}
				}

				bean.setTotalAmount(Double.parseDouble(totalAmount));
				bean.setBalance(Double.parseDouble(totalAmount));
				
				
	*/			
				
			}
			

	
	//Library Registeration
			
	public void regLibraryCashBank(HttpServletRequest request, HttpServletResponse response)
	{
		    System.out.println("In helper");
		
		    Long Txidl=0l;
		  
		    LibraryPaymentDao dao1=new LibraryPaymentDao(); 
		    List listtxid=dao1.getlibraryPaymentTxid();
		  
		    if(listtxid.size()<=0) {
		    	Txidl=1l; 
		    } 
		    else { 
		    	for (int i = 0; i < listtxid.size(); i++) 
		    	{
		  
		    		LibraryPaymentBean bean=(LibraryPaymentBean) listtxid.get(i);
		    		Txidl=bean.getTxId(); 
		    		Txidl++; 
		    	} 
		    }
		 System.out.println("IN HELPER tx id -  "+Txidl);
		 
		    String fk_supplier_id = request.getParameter("supplierId1");
		    System.out.println("hi this is fksuppler id is ====="+fk_supplier_id);
		    String supplier = request.getParameter("supplier");
		   // String billNo = request.getParameter("billNo");
		    //System.out.println("hi this is BIll No=== "+billNo);
			String totalAmount = request.getParameter("totalAmountl");
			String balanceAmount = request.getParameter("balanceAmountl");
			String paymentType = request.getParameter("paymentTypel");
			String paymentMode = request.getParameter("paymentModel");
			String personname = request.getParameter("personnamel");
			String paidAmount = request.getParameter("paidAmountl");
			System.out.println("hi this is PAid amount IS ===="+paidAmount);
			finalpayamt= Double.valueOf(paidAmount);
			
			String totalAmounte = request.getParameter("totalAmountel");
			String balanceAmounte = request.getParameter("balanceAmountel");
			
			String bankName = request.getParameter("bankNamel");
			String nameOnCheck = request.getParameter("nameOnCheckl");
			String accNum = request.getParameter("accNuml");
			String chequeNum = request.getParameter("chequeNuml");
			String cardNum = request.getParameter("cardNuml");
			
			
		/*	System.out.println("--------JSP-----------fk_supplier_id---------------------  ::"+fk_supplier_id);
			System.out.println("--------JSP----------Supplier Name----------------------  ::"+supplier);
			
			
			
			System.out.println("-------------------billNo---------------------  ::"+billNo);
			System.out.println("-----------------totalAmount-----------------------  ::"+totalAmount);
			System.out.println("----------------balanceAmount------------------------  ::"+balanceAmount);
			System.out.println("--------------------paymentType--------------------  ::"+paymentType);
			System.out.println("--------------------paymentMode--------------------  ::"+paymentMode);
			System.out.println("-----------------personname-----------------------  ::"+personname);
			System.out.println("-----------------paidAmount-----------------------  ::"+paidAmount);
			
		*/	
			Double balAmount = Double.parseDouble(balanceAmount);
			Double pdAmount = Double.parseDouble(paidAmount);
			
			Double amount = balAmount - pdAmount;
			System.out.println(" After PAid amount payment AMount is ====="+amount);
		
			
			
			com.srb.hibernate.LibraryPaymentBean bean = new com.srb.hibernate.LibraryPaymentBean();
			
			bean.setSupplier1(Long.parseLong(fk_supplier_id));
			bean.setTxId(Txidl);
			bean.setSupplier(supplier);
			//bean.setBillNo(Double.parseDouble(billNo));
			bean.setTotalAmount(Double.parseDouble(totalAmount)); 
			//bean.setBalance(Double.parseDouble(balanceAmount));
			bean.setBalance((amount));
			bean.setPaymentType(paymentType);
			bean.setPaymentMode(paymentMode);
			bean.setPersonname(personname);
			bean.setPaidAmount(Double.parseDouble(paidAmount));
			//bean.setTotalAmount(Double.parseDouble(totalAmounte));
			//bean.setb
			 System.out.println("when data not present tx id - "+bean.getTxId());
			
				SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date dateobj = new Date();
				System.out.println(dateFormat1.format(dateobj));
				String date = dateFormat1.format(dateobj);
				System.out.println("string date - "+date);
				bean.setInsertDate1(date);
//				bean.setInsertDate1(dateobj);
//				bean.setInsertDate(dateobj);
//				bean.setInsertDate(dateobj);
			 
				System.out.println("1st - =--------------- "+bean.getInsertDate1());
				
			 if(bankName==null)
			 {
				 bean.setBankName(bankName);
			 }
			 else
			 {
				 bean.setBankName("N/A");
			 }
			
			 
			 if(nameOnCheck==null)
			 {
				 bean.setNameOnCheck(nameOnCheck);
			 }
			 else
			 {
				 bean.setNameOnCheck("N/A");
			 }
	
			 if(accNum==null)
			 {
				 bean.setAccNum(Long.parseLong(accNum));
			 }
			 else
			 {
				 bean.setAccNum(Long.parseLong("00"));
			 }
			 
			 if(chequeNum==null)
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
			
	//		 bean.setTxId(0l);
			 
			 
			 HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				
				//Query to get latest paid amount
				/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
				//Query query = session.createSQLQuery("SELECT balance ,bill_no from vendor_payment WHERE  fk_supplier_id =:fk_supplier_id group by bill_no ;");
				Query query = session.createSQLQuery("SELECT balance ,bill_no from library_payment WHERE  fk_supplier_id =:fk_supplier_id group by bill_no ;");
				query.setParameter("fk_supplier_id",fk_supplier_id);
				List<Object[]> list = query.list();
				
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] objects = (Object[]) iterator.next();
					String billno = objects[1].toString();
					System.out.println("hi this is kishor1111111111111111155555555555555++++++++++++"+billno);
					
					Session session1 = hbu.getHibernateSession();
					
					//Query to get latest paid amount
					/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
					//Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from vendor_payment WHERE   bill_no =:billno ORDER BY  pk_vendor_payment_id  DESC LIMIT 1;");
					Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from library_payment WHERE   bill_no =:billno ORDER BY  pk_supplier_payment_id  DESC LIMIT 1;");
					query1.setParameter("billno",billno);
					List<Object[]> list1 = query1.list();
					
					for (Iterator iterator1 = list1.iterator(); iterator1.hasNext();) {
						Object[] objects1 = (Object[]) iterator1.next();
						String newBal1 = objects1[0].toString();
						String bill_no =String.valueOf(objects1[1].toString());
						//Long bill_no= Long.valueOf(objects1[1].toString());
						String tot = objects1[0].toString();
						System.out.println("balance   ==  "+newBal1);
							
						 Double bal= Double.valueOf(newBal1);
						// bal= Double.valueOf(newBal1);
						 if(bal == 0.00 || bal == 0.0 || bal == 0 ){
							 System.out.println("hi this kishor =");
						
						 }else if(bal<=finalpayamt){
							 Double balamt = finalpayamt - bal;
							 finalpayamt = balamt;
							 
							 bean.setBalance(0.0);
							 bean.setBillNo(Double.parseDouble((bill_no)));
							 bean.setPaymentType(paymentType);
							 bean.setCredit(bal);
							 bean.setTotalAmount(Double.valueOf(tot));
							 bean.setTxId(Txidl);
							 System.out.println("when data present tx id - "+bean.getTxId());
							 LibraryPaymentDao dao = new LibraryPaymentDao();
							 dao.regSupPayment(bean);
							 
						 }
						 else if(finalpayamt==0.0){
							 System.out.println("hi this kishor =");
						 }else{
							 Double balamt = bal - finalpayamt;
							/* finalpayamt = 0.0;*/
							 
							 bean.setBalance(balamt);
							 bean.setBillNo(Double.parseDouble(bill_no));
							 bean.setPaymentType(paymentType);
							 bean.setCredit(finalpayamt);
							 bean.setTotalAmount(Double.valueOf(tot));
							 
							 LibraryPaymentDao dao = new LibraryPaymentDao();
							 dao.regSupPayment(bean);
							 
							 finalpayamt = 0.0;
						 }
						 
						 
			         
					}
						
		         
				}
			
				
			}
	
	
	
}


