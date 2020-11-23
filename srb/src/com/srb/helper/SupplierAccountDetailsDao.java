package com.srb.helper;

import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;

import com.srb.bean.GestSupplyerDetailsForCashBook;
import com.srb.bean.SupplierPayemnt;
import com.srb.hibernate.StoreManagementHibernate;
import com.srb.utility.HibernateUtility;



public class SupplierAccountDetailsDao {

	
	//get BIll no  for vemdor getAllVendorBillNo 
	
		public List getAllVendorBillNo(String fk_supplier_id)
		{
			
			HibernateUtility hbu = null;
			Session session = null;
			List list = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
			
				/*Query query = session.createSQLQuery("select bill_no,gross_total,pk_store_management_id from store_management where fk_supplier_id='" + fk_supplier_id + "'");*/
			
				Query query = session.createSQLQuery("select  bill_no,gross_total from store_management where fk_supplier_id = '"+fk_supplier_id+"' UNION SELECT bill_no, gross_total FROM kitchen_inventory WHERE fk_supplier_id='"+fk_supplier_id+"'");
				list = query.list();
		
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}

			finally {
				if (session != null) {
					hbu.closeSession(session);
				}
			}
			return list;
			
		}
		
//Remaining balance 
		
		public List getbalanceAmtByEmployee(String supplierId) {
			
			System.out.println("hi this is In dao==="+supplierId);
			HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List list  = null;
	    	 try {
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession();
	    		 Query query = session.createSQLQuery("SELECT balanceAmounte, totalAmounte from teacher_payment WHERE  fk_teacher_id ='"+supplierId+"' ORDER BY pk_teacher_payment_id DESC LIMIT 1");
	 			//query.setParameter("billNo",billNo);
	 			//query.setParameter("supplierId",supplierId);
	 			list = query.list();
	 			
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
				return list;
		}

/*		public List getbalanceAmtByBillNo(String supplierId) {
			HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List list  = null;
	    	 try {
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession();
	    		 Query query = session.createSQLQuery("SELECT balance , total_amount from supplier_payment WHERE  fk_supplier_id =:supplierId ORDER BY pk_supplier_payment_id DESC LIMIT 1");
	 			//query.setParameter("billNo",billNo);
	 			query.setParameter("supplierId",supplierId);
	 			list = query.list();
	 			
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
				return list;
		}*/
		
		// balane get by the vendor wise 
		public List getbalanceAmtByBillNo(String supplierId) {
			HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List list45  = new ArrayList();
	    	 Double balance = 0.0;
	   
	    	 try {
	    		
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession();
	    		 String credit="credit";
				Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  fk_supplier_id =:supplierId group by bill_no ;");
				query.setParameter("supplierId",supplierId);
				List<Object[]> list = query.list();
				
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object[] objects = (Object[]) iterator.next();
					String billno = objects[1].toString();
					System.out.println("hi this is kishor1111111111111111155555555555555++++++++++++"+billno);
					
					Session session1 = hbu.getHibernateSession();
					
					
					Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from supplier_payment WHERE   bill_no =:billno ORDER BY  pk_supplier_payment_id  DESC LIMIT 1");
					query1.setParameter("billno",billno);
					List<Object[]> list1 = query1.list();
					
					for (Iterator iterator1 = list1.iterator(); iterator1.hasNext();) {
						Object[] objects1 = (Object[]) iterator1.next();
						String newBal1 = objects1[0].toString();
						
						String bill_no= String.valueOf(objects1[1].toString());
						String tot = objects1[0].toString();
						System.out.println("balance   ==  "+newBal1);
							
						 Double bal= Double.valueOf(newBal1);
						
						 balance = balance + bal;
						 
			         
					}
						
		         
				}
				
				list45.add(balance);
	 			
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
				return list45;
		}
		
					
					
		//Library balance amount
					public List getLibrarybalanceAmtByBillNo(String supplierId) {
						HibernateUtility hbu = null ;
				    	 Session session = null;
				    	 List list45  = new ArrayList();
				    	 Double balance = 0.0;
				   
				    	 try {
				    		
				    		 hbu = HibernateUtility.getInstance();
				    		 session = hbu.getHibernateSession();
				    		 String credit="credit";
							Query query = session.createSQLQuery("SELECT balance ,bill_no from library_payment WHERE  fk_supplier_id =:supplierId group by bill_no ;");
							query.setParameter("supplierId",supplierId);
							List<Object[]> list = query.list();
							
							for (Iterator iterator = list.iterator(); iterator.hasNext();) {
								Object[] objects = (Object[]) iterator.next();
								String billno = objects[1].toString();
								System.out.println("hi this is kishor1111111111111111155555555555555++++++++++++"+billno);
								
								Session session1 = hbu.getHibernateSession();
								
								
								Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from library_payment WHERE   bill_no =:billno ORDER BY  pk_supplier_payment_id  DESC LIMIT 1");
								query1.setParameter("billno",billno);
								List<Object[]> list1 = query1.list();
								
								for (Iterator iterator1 = list1.iterator(); iterator1.hasNext();) {
									Object[] objects1 = (Object[]) iterator1.next();
									String newBal1 = objects1[0].toString();
									
									String bill_no= String.valueOf(objects1[1].toString());
									String tot = objects1[0].toString();
									System.out.println("balance   ==  "+newBal1);
										
									 Double bal= Double.valueOf(newBal1);
									
									 balance = balance + bal;
									 
						         
								}
									
					         
							}
							
							list45.add(balance);
				 			
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
							return list45;
					}
					
		// get all vendor wise payment 
		
		
		public Double getTotalAmt(String supplierId) {
					
					HibernateUtility hbu = null ;
			    	 Session session = null;
			    	 List<Object[]> list  = null;
			    	 Double totalAmt = null;
			    	 List<SupplierPayemnt> itemlist = null;
			    	 try {
			    		 hbu = HibernateUtility.getInstance();
			    		 session = hbu.getHibernateSession(); 
			 			//Query query = session.createSQLQuery("select gross_total,pk_store_management_id from store_management where bill_no=:billNo And fk_supplier_id=:fk_supplier_id GROUP BY bill_no");
			 			Query query = session.createSQLQuery(" select  sum(total_amount),sum(total_amount) from supplier_payment where fk_supplier_id = :supplierId and payment = 0 ");
			    		
			 			// Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where  b.creditcustomer=:supplier");
			 			//query.setParameter("billNo",billNo);
			 		query.setParameter("supplierId",supplierId);
			 			System.out.println("hi this s000000+++++++++"+supplierId);
			 			list = query.list();
			 			 itemlist = new ArrayList<SupplierPayemnt>(0);
			 			 
			 			 for (Object[] objects : list) {
			 				 
			 				SupplierPayemnt bean = new SupplierPayemnt();
			 				 
			 				String newBal = (objects[0].toString());
			 				System.out.println("hi this is kishor 55555555+++++++++++++++++"+newBal);
			 				totalAmt = Double.valueOf(newBal);
			 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+totalAmt);
			 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+newBal);
							
			 				itemlist.add(bean);
			 				}
			 			
			 			
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
						return totalAmt;
			    	
				}
		
		
		//Library balance amount
		public Double getLibraryTotalAmt(String supplierId) {
			
			HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List<Object[]> list  = null;
	    	 Double totalAmt = null;
	    	 List<SupplierPayemnt> itemlist = null;
	    	 try {
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession(); 
	 			//Query query = session.createSQLQuery("select gross_total,pk_store_management_id from store_management where bill_no=:billNo And fk_supplier_id=:fk_supplier_id GROUP BY bill_no");
	 			Query query = session.createSQLQuery(" select  sum(total_amount),sum(total_amount) from library_payment where fk_supplier_id = :supplierId and payment = 0 ");
	    		
	 			// Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where  b.creditcustomer=:supplier");
	 			//query.setParameter("billNo",billNo);
	 		query.setParameter("supplierId",supplierId);
	 			System.out.println("hi this s000000+++++++++"+supplierId);
	 			list = query.list();
	 			 itemlist = new ArrayList<SupplierPayemnt>(0);
	 			 
	 			 for (Object[] objects : list) {
	 				 
	 				SupplierPayemnt bean = new SupplierPayemnt();
	 				 
	 				String newBal = (objects[0].toString());
	 				System.out.println("hi this is kishor 55555555+++++++++++++++++"+newBal);
	 				totalAmt = Double.valueOf(newBal);
	 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+totalAmt);
	 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+newBal);
					
	 				itemlist.add(bean);
	 				}
	 			
	 			
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
				return totalAmt;
	    	
		}
		
		
		
		//Get  Total AMount Employee

		public Double getTotalAmtEmployee(String supplierId) {
					
					HibernateUtility hbu = null ;
			    	 Session session = null;
			    	 List<Object[]> list  = null;
			    	 Double totalAmt = null;
			    	 List<SupplierPayemnt> itemlist = null;
			    	 try {
			    		 hbu = HibernateUtility.getInstance();
			    		 session = hbu.getHibernateSession(); 
			 			//Query query = session.createSQLQuery("select gross_total,pk_store_management_id from store_management where bill_no=:billNo And fk_supplier_id=:fk_supplier_id GROUP BY bill_no");
			 			Query query = session.createSQLQuery(" select Salary,Salary from teacher_master WHERE pk_teacher_id ='"+supplierId+"'");
			    		
			 			// Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where  b.creditcustomer=:supplier");
			 			//query.setParameter("billNo",billNo);
			 	//	query.setParameter("supplierId",supplierId);
			 			System.out.println("hi this s000000+++++++++"+supplierId);
			 			list = query.list();
			 			 itemlist = new ArrayList<SupplierPayemnt>(0);
			 			 
			 			 for (Object[] objects : list) {
			 				 
			 				SupplierPayemnt bean = new SupplierPayemnt();
			 				 
			 				String newBal = (objects[0].toString());
			 				System.out.println("hi this is kishor 55555555+++++++++++++++++"+newBal);
			 				totalAmt = Double.valueOf(newBal);
			 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+totalAmt);
			 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+newBal);
							
			 				itemlist.add(bean);
			 				}
			 			
			 			
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
						return totalAmt;
			    	
				}
		
		
		public List getTotalAmtByBillNoForCustomer( String supplierId) 
		{
			
			 HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List list  = null;

	    	 try 
	    	 {
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession();
	 			 /*Query query = session.createSQLQuery("select gross_total,total from store_management  where bill_no=:billNo GROUP BY bill_no");*/
	 			 
	    		 //Query query = session.createSQLQuery("select balance_amount,total from store_management WHERE bill_no="+billNo+" AND fk_supplier_id = '"+supplierId+"' UNION SELECT balance_amount, total FROM kitchen_inventory where bill_no="+billNo+" AND fk_supplier_id='"+supplierId+"' GROUP BY bill_no");
	    		
	    		// Query query = session.createSQLQuery("select balance_amount,sum(total)  from store_management WHERE  fk_supplier_id = '"+supplierId+"' UNION SELECT balance_amount, sum( total)  FROM kitchen_inventory where fk_supplier_id='"+supplierId+"' ");
	    		 //Query query = session.createSQLQuery("select  pk_supplier_payment_id, total_amount,balance, fk_supplier_id from supplier_payment where fk_supplier_id = '"+supplierId+"' and payment = 0 group by total_amount");
	    		 Query query = session.createSQLQuery("select  pk_supplier_payment_id, sum(total_amount),balance, fk_supplier_id from supplier_payment where fk_supplier_id = '"+supplierId+"' and payment = 0");
	    		 //Query query = session.createSQLQuery("select  pk_supplier_payment_id, MIN(total_amount),MIN(balance) from supplier_payment where fk_supplier_id = '"+supplierId+"'  Order By total_amount Asc");
	    		 list = query.list();
	    		
	    		 
				} catch (Exception e) {
					e.printStackTrace();
					
				}
				
	    	   finally
			   {
				  if (session!=null)  
				  {
				 	hbu.closeSession(session);
				  }
			   }
	    	 	
	    	 return list;
		}
		
		
		//Library Total amount
		public List getLibraryTotalAmtByBillNoForCustomer( String supplierId) 
		{
			
			 HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List list  = null;

	    	 try 
	    	 {
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession();
	 			 /*Query query = session.createSQLQuery("select gross_total,total from store_management  where bill_no=:billNo GROUP BY bill_no");*/
	 			 
	    		 //Query query = session.createSQLQuery("select balance_amount,total from store_management WHERE bill_no="+billNo+" AND fk_supplier_id = '"+supplierId+"' UNION SELECT balance_amount, total FROM kitchen_inventory where bill_no="+billNo+" AND fk_supplier_id='"+supplierId+"' GROUP BY bill_no");
	    		
	    		// Query query = session.createSQLQuery("select balance_amount,sum(total)  from store_management WHERE  fk_supplier_id = '"+supplierId+"' UNION SELECT balance_amount, sum( total)  FROM kitchen_inventory where fk_supplier_id='"+supplierId+"' ");
	    		 Query query = session.createSQLQuery("select  pk_supplier_payment_id, total_amount from library_payment where fk_supplier_id = '"+supplierId+"' and payment = 0 group by total_amount");
	    		 list = query.list();
	    		
	    		 
				} catch (Exception e) {
					e.printStackTrace();
					
				}
				
	    	   finally
			   {
				  if (session!=null)  
				  {
				 	hbu.closeSession(session);
				  }
			   }
	    	 	
	    	 return list;
		}
		
		// get all payment by employee Deatils 
		public List getTotalAmtByBillNoEmployee(String fk_teacher_id) 
		{
			
			 HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List list  = null;

	    	 try 
	    	 {
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession();
	 			 /*Query query = session.createSQLQuery("select gross_total,total from store_management  where bill_no=:billNo GROUP BY bill_no");*/
	 			 
	    		 Query query = session.createSQLQuery("select pk_teacher_id,Salary from teacher_master WHERE pk_teacher_id ='"+fk_teacher_id+"'");
	    		 list = query.list();
	    		
	    		 
				} catch (Exception e) {
					e.printStackTrace();
					
				}
				
	    	   finally
			   {
				  if (session!=null)  
				  {
				 	hbu.closeSession(session);
				  }
			   }
	    	 	
	    	 return list;
		}
}
