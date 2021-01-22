package com.srb.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetBookDetails;
import com.srb.bean.GetLibraryManagementDetails;
import com.srb.bean.StockBean;
import com.srb.dao.LibraryManagementDao;
import com.srb.dao.LibraryPaymentDao;
import com.srb.dao.SupplierPaymentDao;
import com.srb.hibernate.BookIssueHibernate;
import com.srb.hibernate.BookReturnHibernate;
import com.srb.hibernate.BookStockHibernate;
import com.srb.hibernate.LibraryManagementHibernate;
//import com.srb.hibernate.TeacherBookIssueHibernate;
import com.srb.utility.HibernateUtility;

public class LibraryManagementHelper {
	String Status = "Y";
	public GetLibraryManagementDetails getGridForLibraryManagement(String bookName) {
		GetLibraryManagementDetails bean = new GetLibraryManagementDetails();
			
			bean.setBookName(bookName);
			return bean;
	
	}
	/*public List getGridForLibraryManagement(
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String itemName = request.getParameter("itemName");
		System.out.println(" hi this  is Item name is ----====="+itemName);
		String ChallanNo = request.getParameter("challanNo");
		System.out.println(" hi this is Challan No is ========-----"+ChallanNo);
		String bookName = request.getParameter("bookName");
		
		
		LibraryManagementDao dao = new LibraryManagementDao();
		// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
		 List<GetLibraryManagementDetails> expL= dao.getgetGridForLibraryManagementNew(bookName);
		 return expL;
		

		 	
			 
		
		
	
	}*/

	//add book entry
			public void addingBookDetails(HttpServletRequest request,
					HttpServletResponse response) {
				 Integer count = Integer.parseInt(request.getParameter("count"));
		        System.out.println(count);
		        
		        for(int i =0 ; i<count;i++)
				{
		           String bookName = request.getParameter("bookName"+i);
			       String authorName = request.getParameter("authorName"+i);
			       String publisherName = request.getParameter("publisherName"+i);
			       String buyPrice = request.getParameter("buyPrice"+i);
			       String quantity = request.getParameter("quantity"+i);
			       String total = request.getParameter("total"+i);
			       String fk_Supplier_id = request.getParameter("fk_Supplier_id");
			       String supplierName = request.getParameter("supplierName");
			       String billNo = request.getParameter("billNo");
			       String grossTotal = request.getParameter("grossTotal");	
			       String Total = request.getParameter("grossTotal");
			       String balanceamount = request.getParameter("grossTotal");
			       
			       LibraryManagementHibernate b = new LibraryManagementHibernate();
					
			        b.setBookName(bookName);
					b.setAuthorName(authorName);
					b.setPublisherName(publisherName);
					b.setSupplierName(supplierName);
					b.setBuyPrice(Double.parseDouble(buyPrice));
					b.setQuantity(Long.parseLong(quantity));
					b.setTotalAmount(Double.parseDouble(total));
					b.setGrossTotal(Double.parseDouble(grossTotal));
					b.setFkSupplierId(Long.parseLong(fk_Supplier_id));
					b.setBillNo(Long.parseLong(billNo));
					b.setTotal(Double.parseDouble(Total));
					b.setBalanceamount(Double.parseDouble(balanceamount));
					
					
					Date d = new Date();
					b.setInsertDate(d);
					
					LibraryManagementDao dao = new LibraryManagementDao();
					dao.addBookIntoDatabase(b);
				
					
					com.srb.hibernate.LibraryPaymentBean bean = new com.srb.hibernate.LibraryPaymentBean();
					
					Date d1 = new Date();
					bean.setInsertDate(d1);
					
					
					bean.setSupplier1(Long.parseLong(fk_Supplier_id));
					bean.setSupplier(supplierName);
					bean.setBillNo(Double.parseDouble(billNo));
					bean.setBillNo1(billNo);
					bean.setTotalAmount(Double.parseDouble(Total)); 
					//bean.setBalance(Double.parseDouble(balanceAmount));
					bean.setCredit(Double.parseDouble("0"));
					bean.setBalance(Double.parseDouble(grossTotal));
					bean.setPaymentType("credit");
					bean.setPaymentMode("N/A");
					bean.setPersonname(supplierName);
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

					LibraryPaymentDao dao1 = new LibraryPaymentDao();
					dao1.regSupPayment(bean);
				
				
				//for stock
				LibraryManagementDao bookDao = new LibraryManagementDao();
				List bookList  = bookDao.getAllBookStockEntry1(bookName,authorName,publisherName);
				 
			    System.out.println("size of data == "+bookList.size());
				//if table is empty for strok table
				if(bookList.size() == 0){
					BookStockHibernate bookStockBean = new BookStockHibernate();
					bookStockBean.setBookName(bookName);
					System.out.println("hi this is kishor size is zero**********"+bookList);
					bookStockBean.setQuantity(Long.parseLong(quantity));
					bookStockBean.setSupplierName(supplierName);
					bookStockBean.setPublisherName(publisherName);
					bookStockBean.setAuthorName(authorName);
					bookStockBean.setStatus(Status);
					
					LibraryManagementDao emptyStockdao = new LibraryManagementDao();
					emptyStockdao.addBookStok(bookStockBean);
				}
				
				//if table is not empty
				else{
					for(int j=0;j<bookList.size();j++){
					 BookStockHibernate notEmptyBean =(BookStockHibernate)bookList.get(j);
					 
					 Long quantityFromTable = notEmptyBean.getQuantity();
					 
					
					 Long pkBookStockTableId = notEmptyBean.getPkBookStockId();
					 
					 Long addeduantity = quantityFromTable + Long.parseLong(quantity);
					 
		       		 HibernateUtility hbu = HibernateUtility.getInstance();
		       		 Session session = hbu.getHibernateSession();
		       		 Transaction transaction = session.beginTransaction();
		       		 
		       		 BookStockHibernate updateStock = (BookStockHibernate) session.get(BookStockHibernate.class, new Long(pkBookStockTableId));
		       		 updateStock.setQuantity(addeduantity);
		       		 
		       		 session.saveOrUpdate(updateStock);
		       		 transaction.commit();
					}
					 /*for(int j=0;j<bookList.size();j++){
						 

						 BookStockHibernate notEmptyBean =(BookStockHibernate)bookList.get(j);
						 
						 String bookNameForTable = notEmptyBean.getBookName();
						 
						 String authorFromTable = notEmptyBean.getAuthorName();
						 
						 String publiherFromtable = notEmptyBean.getPublisherName();
						 
						 String supplierFromTable = notEmptyBean.getSupplierName();
						 
						 Long quantityFromTable = notEmptyBean.getQuantity();
						 
						
						 Long pkBookStockTableId = notEmptyBean.getPkBookStockId();
						
						 //if book name already exist then update quantity
						 if(bookNameForTable.equals(bookName) )
						 {
							 System.out.println("1");
							 if(authorFromTable.equals(authorName))
							 {
								 System.out.println("2");
								 if(publiherFromtable.equals(publisherName))

								 {
									 System.out.println("3");
									 if(supplierFromTable.equals(supplierName))
									 {
										 System.out.println("in side if");
										 Long addeduantity = quantityFromTable + Long.parseLong(quantity);
										 
					            		 HibernateUtility hbu = HibernateUtility.getInstance();
					            		 Session session = hbu.getHibernateSession();
					            		 Transaction transaction = session.beginTransaction();
					            		 
					            		 BookStockHibernate updateStock = (BookStockHibernate) session.get(BookStockHibernate.class, new Long(pkBookStockTableId));
					            		 updateStock.setQuantity(addeduantity);
					            		 
					            		 session.saveOrUpdate(updateStock);
					            		 transaction.commit();
					            			
									 }
									 
								 }
							 }
							 
		            		
						 }
						 
						 //if book name is not present
						 else{
							 System.out.println("hi this is kishor isside else statement ");
								BookStockHibernate bookNotPresentBean = new BookStockHibernate();	
								bookNotPresentBean.setBookName(bookName);
							
								bookNotPresentBean.setQuantity(Long.parseLong(quantity));
								bookNotPresentBean.setSupplierName(supplierName);
								bookNotPresentBean.setPublisherName(publisherName);
								bookNotPresentBean.setAuthorName(authorName);
								
								LibraryManagementDao bookNotPresentdao = new LibraryManagementDao();
								bookNotPresentdao.addBookStok(bookNotPresentBean);
								break;
							
						 }
						 
					 } */
					
				}
				
				
				}
			}
		
		// get all teacher Name Drop Name Wise for return 
		
		public Map getAllBookNameForDropdownForReturnTeacherBook(String studentId) {

			int count = 1;
			LibraryManagementDao dao = new LibraryManagementDao();
			List list= dao.getAllBookNameForDropdownForReturnTeacherBook(studentId);
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				GetBookDetails bean = new GetBookDetails();
				bean.setBookName(o[0].toString());
				bean.setAuthorName(o[1].toString());
				bean.setPublisherName(o[2].toString());
				bean.setSupplierName(o[3].toString());
				bean.setQuantity(o[4].toString());
				bean.setPkBookId(o[5].toString());
				//bean.setTotalAmount((Double)o[1]);
				System.out.println("***************"+o[0]);
				map.put(bean.getPkBookId(),bean);
				count++;
			}
			return map;
		}
		// get all book Issue For teacher getBookDetailForReturnGridTeacher
		public Map getBookDetailForReturnGridTeacher(String bookNameId) {
			LibraryManagementDao dao = new LibraryManagementDao();
			List list = dao.getBookdetailForReturnTeacher(bookNameId);
			System.out.println(list.size());
			Map  map1 =  new HashMap();
			
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				GetBookDetails bean = new GetBookDetails();
				bean.setBookName(o[0].toString());
				bean.setAuthorName(o[1].toString());
				bean.setPublisherName(o[2].toString());
				bean.setSupplierName(o[3].toString());
				bean.setPkBookId(o[4].toString());
				bean.setQuantityInGrid(1l);
				bean.setQuantity(o[5].toString());
				map1.put(bean.getPkBookId(),bean);
			}
			return map1;
			
	//String outwardchallanno = request.getParameter("outwardchallanno");
			
	  /* String bookNameId = request.getParameter("bookNameId");

	   LibraryManagementDao dao = new LibraryManagementDao();
			// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
			 List<GetBookDetails> expL= dao.getBookdetailForReturnTeacher(bookNameId);
			 return expL;*/
		
		}
		

		// get Book return For Teacher Deatails
		public void TeacheraddBookIssueDetailsReturn(HttpServletRequest request,
				HttpServletResponse response) {


			Integer count = Integer.parseInt(request.getParameter("count"));
	      System.out.println(count);
	      for(int i =0 ; i<count;i++)
			{
	   	   
		   	     // String fkDivId = request.getParameter("fk_div_id");
		   	      //String fkCatId = request.getParameter("fk_cat_id");
		   	      //String studentId = request.getParameter("studentId");
		   	      String TeacherId = request.getParameter("fk_teacher_idReturn");
		   	      System.out.println("hi this is ID =="+TeacherId);
		   	  
		   //	String LateCharges = request.getParameter("LateCharges");
		   	String BookReturneDateNew = request.getParameter("employeebookNameForReturnEMployee");
			      String bookName = request.getParameter("bookName"+i);
			      String authorName = request.getParameter("authorName"+i);
			      String publisherName = request.getParameter("publisherName"+i);
			      String supplierName = request.getParameter("supplierName"+i);
			      String quantity = request.getParameter("quantityInGrid"+i);
			      String BookissueDateReturn = request.getParameter("BookIssuedate"+i);
				  String BookReturneDateReturn = request.getParameter("BookReturnDate"+i);
				  String status = request.getParameter("status"+i);
			     
			      BookReturnHibernate b = new BookReturnHibernate();
					b.setBookName(bookName);
					b.setAuthorName(authorName);
					b.setPublisherName(publisherName);
					b.setSupplierName(supplierName);
					b.setQuantity(Long.parseLong(quantity));
					//b.setFkDivId(Long.parseLong(fkDivId));
					//b.setFkCatId(Long.parseLong(fkCatId));
					//b.setStudentId(Long.parseLong(studentId));
					b.setBookissueDateReturn(BookissueDateReturn);
					b.setBookReturneDateReturn(BookReturneDateReturn);
					b.setTeacherIssueReturnId(Long.parseLong(TeacherId));
					//b.setLateCharges(LateCharges);
					b.setStatus(status);
					Date d = new Date();
					b.setInsertDate(d);
			
			LibraryManagementDao dao = new LibraryManagementDao();
			dao.addBookReturnIntoDatabase(b);
			
			// update (minus stock from book stock)
			HibernateUtility hbu = HibernateUtility.getInstance();
			 Session session = hbu.getHibernateSession();
			 Transaction transaction = session.beginTransaction();
			try
			{
			 Query query = session.createSQLQuery("SELECT quantity,book_name,pk_book_stock_id FROM book_stock WHERE book_name ='"+bookName+"' AND author_name ='"+authorName+"' AND publisher_name ='"+publisherName+"' AND supplier_name ='"+supplierName+"'");
			 List<Object[]> list = query.list();
			  for (Object[] object : list) {
				Long auantityFromStock = Long.parseLong(object[0].toString());
				String pkBookStockId = object[2].toString();
			    Long updatequantity = (long)(auantityFromStock +  Long.parseLong(quantity));
				System.out.println("after return qunt : "+ quantity);
				BookStockHibernate updateStock = (BookStockHibernate) session.get(BookStockHibernate.class, new Long(pkBookStockId));
		       
		        updateStock.setQuantity(updatequantity);
		 
		        session.saveOrUpdate(updateStock);
		        transaction.commit();
			  }
			}
			  catch(RuntimeException e){
					try{
						transaction.rollback();
					}catch(RuntimeException rbe)
					{
						e.printStackTrace();
					}	
				}finally{
					hbu.closeSession(session);
				}
			
				 Session session1 = hbu.getHibernateSession();

				Query query=session1.createSQLQuery("SELECT quantity,book_name,pk_book_issue_id,isStudentActive FROM book_issue_master WHERE book_name ='"+bookName+"' AND author_name ='"+authorName+"' AND publisher_name ='"+publisherName+"' AND supplier_name ='"+supplierName+"'");

				 List<Object[]> list1 = query.list();
				  for (Object[] object : list1) {
					Long auantityFromStock = Long.parseLong(object[0].toString());
					System.out.println(" hi this Quantity == "+auantityFromStock);
					String pk_book_issue_id = object[2].toString();

					System.out.println(" hi this Quantity == "+pk_book_issue_id);
				  
					//set student active status to n to cancel admission afetr generating LC
					Transaction transaction1 = session1.beginTransaction();
					BookIssueHibernate s = (BookIssueHibernate) session1.get(BookIssueHibernate.class, new Long(pk_book_issue_id));
					s.setIsStudentActive("N");
					session1.saveOrUpdate(s);
					transaction1.commit();
			
				  }
			}
		}
		
		// Employee Book Return By Kishor 
		public List getBookDetailForEmployeeReturnGrid(HttpServletRequest request, HttpServletResponse response) {
			//String Currentdate = BookReturneDateNew;
			//String DateDifference;
			//Long oneDay = 0.0;
			
			/*SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy ");

			Date cldate=null;
			
			cldate = format.parse(BookReturneDateNew);*/
			
			//System.out.println("In Helper BookReturneDateNew Parsing=="+BookReturneDateNew);
			
	    // String outwardchallanno = request.getParameter("outwardchallanno");
	     String fk_teacher_idReturn = request.getParameter("fk_teacher_idReturn");
			
	     LibraryManagementDao dao = new LibraryManagementDao();
			// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
			 List<GetBookDetails> expL= dao.getBookdetailForReturnForEmployeeGrid(fk_teacher_idReturn);
			 return expL;
			
			/*LibraryManagementDao dao = new LibraryManagementDao();
			List list = dao.getBookdetailForReturnForEmployeeGrid(fk_teacher_idReturn);
			System.out.println(list.size());
			
			Map  map1 =  new HashMap();
			
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				GetBookDetails bean = new GetBookDetails();
				bean.setBookName(o[0].toString());
				bean.setAuthorName(o[1].toString());
				bean.setPublisherName(o[2].toString());
				bean.setSupplierName(o[3].toString());
				bean.setPkBookId(o[4].toString());
				bean.setQuantityInGrid(1l);
				bean.setBookIssuedate(o[6].toString());
				bean.setBookReturnDate(o[7].toString());*/
				
				/*SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

				Date cldate=null;
				
				cldate = format.parse(BookReturneDateNew);
				System.out.println("BookReturneDateNew After Parsing=="+cldate);*/
				
				/*Date d = new Date();
				bean.setInsertDate(d);
				System.out.println("Current Date Is "+d);
				
				Date date1=null;
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				date1 = dateFormat.parse(o[6].toString());
				System.out.println("BookIssueDate after parsing =="+date1);
				
				Date date2=null;
				SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
				date2 = dateFormat2.parse(o[7].toString());
				System.out.println("Bookreturndate after Parsing==="+date2);
				
				long diff = d.getTime() - date2.getTime();
				
				long diffDays = diff / (24 * 60 * 60 * 1000);
				System.out.print(diffDays + " days by kishor , ");
				
				
				long Days = 7;
				long fix = 2;
				long NewTotal = diffDays * fix;
				System.out.println("New LateCharges Is ==="+NewTotal);
				if(NewTotal > 0)
				{
					System.out.println("diffDays Is Positive=="+NewTotal);
					bean.setDateDifference(NewTotal);
				}
				else if(NewTotal < 0)
				{
					System.out.println("diffDays Is Negative=="+NewTotal);
					bean.setDateDifference(0l);
				}*/
				/*if(diffDays >= +7)
				{
					
				}
				else{
					
				}*/
				
				//Currentdate = BookReturnDate - BookIssuedate;
				//long  oneDay = (long) (24*60*60*1000); // hours*minutes*seconds*milliseconds
				//Long diffDays = Math.round(Math.abs((BookReturn.getTime() - BookIssue.getTime())/(oneDay)));
				//Long diffInDays1 = (Long) ((BookReturn.getTime() - BookIssue.getTime()) / (1000 * 60 * 60 * 24));
				
				//bean.setBookIssuedate(o[6].toString());
				//bean.setBookReturnDate(o[7].toString());
				//System.out.println("BookReturneDateNew====="+BookReturneDateNew);
				
				
			/*	map1.put(bean.getPkBookId(),bean);
			}
			return map1;*/
		
		}
		
		//teacher Book name Drop Down
		 
		public Map getAllBookNameForDropdownForReturnTeacher(String studentId) {

			int count = 1;
			LibraryManagementDao dao = new LibraryManagementDao();
			List list= dao.getAllBookNameForDropdownForReturnTeacher(studentId);
			
			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				GetBookDetails bean = new GetBookDetails();
				bean.setBookName(o[0].toString());
				bean.setAuthorName(o[1].toString());
				bean.setPublisherName(o[2].toString());
				bean.setSupplierName(o[3].toString());
				bean.setQuantity(o[4].toString());
				bean.setPkBookId(o[5].toString());
				//bean.setTotalAmount((Double)o[1]);
				System.out.println("***************"+o[0]);
				map.put(bean.getPkBookId(),bean);
				count++;
			}
			return map;
		}
		
		
		// adding Teacher Book Issue In 
		public void TeacheraddBookIssueDetails(HttpServletRequest request,
				HttpServletResponse response) {

			 Integer count = Integer.parseInt(request.getParameter("count"));
	       System.out.println(count);
	       for(int i =0 ; i<count;i++)
			{
	    	   
	    	      //String fkDivId = request.getParameter("fk_div_id");
	    	     // String fkCatId = request.getParameter("fk_cat_id");
	    	      String TeacherIssueID = request.getParameter("fk_teacher_id");
	    	      System.out.println("teacherid== "+TeacherIssueID);
			      String bookName = request.getParameter("bookName"+i);
			    // System.out.println("teacherid== "+bookName);
			      String authorName = request.getParameter("authorName"+i);
			      //System.out.println("authorName== "+authorName);
			      String publisherName = request.getParameter("publisherName"+i);
			      //System.out.println("publisherName== "+publisherName);
			      String supplierName = request.getParameter("supplierName"+i);
			      //System.out.println("supplierName== "+supplierName);
			      String quantity = request.getParameter("quantityInGrid"+i);
			      //System.out.println("quantity== "+quantity);
			      String pkBookId = request.getParameter("pkBookId"+i);
			      System.out.println("pkBookId== "+pkBookId);
			      String dateOfBookIssue = request.getParameter("TeacherBookIssueDateNew");
			      
			      String BookissueDate = request.getParameter("TeacherBookIssueDateNew");
			      //System.out.println(" hi this is Book Isssue Date dateOfBookIssue== "+dateOfBookIssue);
			      String BookReturneDate = request.getParameter("TeacherBookReturneDateNew");
			      //System.out.println(" hi this is Book Isssue Date BookReturneDate== "+BookReturneDate);


			      BookIssueHibernate b = new BookIssueHibernate();
			      
			      System.out.println(" date before parsing" +dateOfBookIssue);
			      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date dateOfBirth = null;
					
					try{
						dateOfBirth = format.parse(dateOfBookIssue);
						b.setDateOfBookIssue(dateOfBirth);
						System.out.println(" date dateOfBirth parsing" +dateOfBirth);
					}
					catch(Exception e){
						e.printStackTrace();
						System.out.println("Exception in date parsing");
					}
			   /*   SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
					Date BookissueDateNew = null;
					Date BookReturneDateNew = null;
					try{
						BookissueDateNew = format1.parse(BookissueDate);
						System.out.println("=="+BookissueDate);
						b.setBookissueDate(BookissueDateNew);
						BookReturneDateNew = format1.parse(BookReturneDate);
						System.out.println("=="+BookReturneDate);
						b.setBookReturneDate(BookReturneDateNew);
					}
					catch(Exception e){
						e.printStackTrace();
						System.out.println("Exception in date parsing");
					}*/
			      
					b.setBookissueDate(BookissueDate);
					b.setBookReturneDate(BookReturneDate);
					b.setBookName(bookName);
					b.setAuthorName(authorName);
					b.setPublisherName(publisherName);
					b.setSupplierName(supplierName);
					b.setQuantity(Long.parseLong(quantity));
					//b.setFkDivId(Long.parseLong(fkDivId));
					//b.setFkCatId(Long.parseLong(fkCatId));
					//b.setTeacherid(Long.parseLong(teacherid));
					b.setTeacherIssueId(Long.parseLong(TeacherIssueID));
					Date d = new Date();
					b.setInsertDate(d);
					b.setIsStudentActive("Y");
			
			LibraryManagementDao dao = new LibraryManagementDao();
			dao.addBookIssueIntoDatabase(b);
			
			// update (minus stock from book stock)
			HibernateUtility hbu = HibernateUtility.getInstance();
			 Session session = hbu.getHibernateSession();
			 Transaction transaction = session.beginTransaction();
			try
			{
			 Query query = session.createSQLQuery("SELECT quantity,book_name FROM book_stock WHERE pk_book_stock_id ="+pkBookId);
			 List<Object[]> list = query.list();
			  for (Object[] object : list) {
				Long auantityFromStock = Long.parseLong(object[0].toString());
			    Long updatequantity = (long)(auantityFromStock -  Long.parseLong(quantity));
				System.out.println("after minus qunt : "+ quantity);
				BookStockHibernate updateStock = (BookStockHibernate) session.get(BookStockHibernate.class, new Long(pkBookId));
		       
		        updateStock.setQuantity(updatequantity);
		 
		        session.saveOrUpdate(updateStock);
		        transaction.commit();
			  }
			}
			  catch(RuntimeException e){
					try{
						transaction.rollback();
					}catch(RuntimeException rbe)
					{
						e.printStackTrace();
					}	
				}finally{
					hbu.closeSession(session);
				}
			}
			}

	//get book name for dropdwon
	public Map getAllBookNameForDropdown() {
		int count = 1;
		LibraryManagementDao dao = new LibraryManagementDao();
		List list= dao.getAllBookNameForDropDown();
		System.out.println("in helper"+list.size());
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetBookDetails bean = new GetBookDetails();
			bean.setBookName(o[0].toString());
			bean.setAuthorName(o[1].toString());
			bean.setPublisherName(o[2].toString());
			bean.setSupplierName(o[3].toString());
			bean.setQuantity(o[4].toString());
			bean.setPkBookId(o[5].toString());
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(bean.getPkBookId(),bean);
			count++;
		}
		return map;

	}
	
	//get book details into grid for book issue
	public Map getBookDetailForIssueGrid(String bookNameId) {
		LibraryManagementDao dao = new LibraryManagementDao();
		List list = dao.getBookdetailForIssue(bookNameId);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{

			Object[] o = (Object[])list.get(i);
			GetBookDetails bean = new GetBookDetails();
			System.out.println("result - "+Arrays.toString(o));
			bean.setBookName(o[0].toString());
			bean.setAuthorName(o[1].toString());
			bean.setPublisherName(o[2].toString());
			bean.setSupplierName(o[3].toString());
			bean.setPkBookId(o[4].toString());
			bean.setQuantityInGrid(1l);
			bean.setQuantity(Long.parseLong(o[5].toString()));
			map1.put(bean.getPkBookId(),bean);
		}
		return map1;
	}

	//adding book issue
	public void addingBookIssueDetails(HttpServletRequest request,
			HttpServletResponse response) {

		 Integer count = Integer.parseInt(request.getParameter("count"));
       System.out.println(count);
       for(int i =0 ; i<count;i++)
		{
    	   
    	      String fkDivId = request.getParameter("fk_div_id");
    	      String fkCatId = request.getParameter("fk_cat_id");
    	      String studentId = request.getParameter("studentId");
		      String bookName = request.getParameter("bookName"+i);
		      String authorName = request.getParameter("authorName"+i);
		      String publisherName = request.getParameter("publisherName"+i);
		      String supplierName = request.getParameter("supplierName"+i);
		      String quantity = request.getParameter("quantityInGrid"+i);
		      System.out.println("quantity"+quantity);
		      String pkBookId = request.getParameter("pkBookId"+i);
		      System.out.println("hi this is Std ID IS pkBookId=="+pkBookId);
		      String dateOfBookIssue = request.getParameter("dateOfBookIssue");
		      
		      String BookissueDate = request.getParameter("BookissueDate");
		      System.out.println(" hi this is Book Isssue Date BookissueDate== "+BookissueDate);
		      String BookReturneDate = request.getParameter("BookReturneDate");
		      System.out.println(" hi this is Book Isssue Date BookReturneDate== "+BookReturneDate);


		      BookIssueHibernate b = new BookIssueHibernate();
		      
		      System.out.println(" date before parsing" +dateOfBookIssue);
		      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date dateOfBirth = null;
				
				try{
					dateOfBirth = format.parse(dateOfBookIssue);
					b.setDateOfBookIssue(dateOfBirth);
					System.out.println(" date dateOfBirth parsing" +dateOfBirth);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
		   /*   SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				Date BookissueDateNew = null;
				Date BookReturneDateNew = null;
				try{
					BookissueDateNew = format1.parse(BookissueDate);
					System.out.println("=="+BookissueDate);
					b.setBookissueDate(BookissueDateNew);
					BookReturneDateNew = format1.parse(BookReturneDate);
					System.out.println("=="+BookReturneDate);
					b.setBookReturneDate(BookReturneDateNew);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}*/
		      
				b.setBookissueDate(BookissueDate);
				b.setBookReturneDate(BookReturneDate);
				b.setBookName(bookName);
				b.setAuthorName(authorName);
				b.setPublisherName(publisherName);
				b.setSupplierName(supplierName);
				b.setQuantity(Long.parseLong(quantity));
				b.setFkDivId(Long.parseLong(fkDivId));
				b.setFkCatId(Long.parseLong(fkCatId));
				b.setStudentId(Long.parseLong(studentId));
				Date d = new Date();
				b.setInsertDate(d);
				b.setIsStudentActive("Y");
		
		LibraryManagementDao dao = new LibraryManagementDao();
		dao.addBookIssueIntoDatabase(b);
		
		// update (minus stock from book stock)
		HibernateUtility hbu = HibernateUtility.getInstance();
		 Session session = hbu.getHibernateSession();
		 Transaction transaction = session.beginTransaction();
		try
		{
		 Query query = session.createSQLQuery("SELECT quantity,book_name FROM book_stock WHERE pk_book_stock_id ="+pkBookId);
		 List<Object[]> list = query.list();
		  for (Object[] object : list) {
			Long auantityFromStock = Long.parseLong(object[0].toString());
		    Long updatequantity = (long)(auantityFromStock -  Long.parseLong(quantity));
			System.out.println("after minus qunt : "+ quantity);
			BookStockHibernate updateStock = (BookStockHibernate) session.get(BookStockHibernate.class, new Long(pkBookId));
	       
	        updateStock.setQuantity(updatequantity);
	 
	        session.saveOrUpdate(updateStock);
	        transaction.commit();
		  }
		}
		  catch(RuntimeException e){
				try{
					transaction.rollback();
				}catch(RuntimeException rbe)
				{
					e.printStackTrace();
				}	
			}finally{
				hbu.closeSession(session);
			}
		}
	}

	//book details for drop down for return from book issue table
	public Map getAllBookNameForDropdownForReturn(String studentId) {

		int count = 1;
		LibraryManagementDao dao = new LibraryManagementDao();
		List list= dao.getAllBookNameForDropDownForReturn(studentId);
		
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetBookDetails bean = new GetBookDetails();
			bean.setBookName(o[0].toString());
			bean.setAuthorName(o[1].toString());
			bean.setPublisherName(o[2].toString());
			bean.setSupplierName(o[3].toString());
			bean.setQuantity(o[4].toString());
			bean.setPkBookId(o[5].toString());
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(bean.getPkBookId(),bean);
			count++;
		}
		return map;
	}

	//book details for return for return from book return table
/*	public Map getBookDetailForReturnGrid(String bookNameId) {
		LibraryManagementDao dao = new LibraryManagementDao();
		List list = dao.getBookdetailForReturn(bookNameId);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetBookDetails bean = new GetBookDetails();
			bean.setBookName(o[0].toString());
			bean.setAuthorName(o[1].toString());
			bean.setPublisherName(o[2].toString());
			bean.setSupplierName(o[3].toString());
			bean.setPkBookId(o[4].toString());
			bean.setQuantityInGrid(1l);
			map1.put(bean.getPkBookId(),bean);
		}
		return map1;
	
	}*/
	public List getBookDetailForReturnGrid(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		//String Currentdate = BookReturneDateNew;
		String DateDifference;
		//Long oneDay = 0.0;
		
		/*SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy ");

		Date cldate=null;
		
		cldate = format.parse(BookReturneDateNew);*/
		
		String StudentNameId = request.getParameter("studName_return");
		String BookReturneDateNew = request.getParameter("BookReturneDateNew");
		
		
		LibraryManagementDao dao = new LibraryManagementDao();
		// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
		 List<GetBookDetails> expL= dao.getBookdetailForReturn(StudentNameId,BookReturneDateNew);
		 return expL;
		
	/*	System.out.println("In Helper BookReturneDateNew Parsing=="+BookReturneDateNew,BookReturneDateNew);
		LibraryManagementDao dao = new LibraryManagementDao();
		List list = dao.getBookdetailForReturn(StudentNameId);
		System.out.println(list.size());
		
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetBookDetails bean = new GetBookDetails();
			bean.setBookName(o[0].toString());
			bean.setAuthorName(o[1].toString());
			bean.setPublisherName(o[2].toString());
			bean.setSupplierName(o[3].toString());
			bean.setPkBookId(o[4].toString());
			bean.setQuantityInGrid(1l);
			bean.setBookIssuedate(o[6].toString());
			bean.setBookReturnDate(o[7].toString());*/
			
			/*SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

			Date cldate=null;
			
			cldate = format.parse(BookReturneDateNew);
			System.out.println("BookReturneDateNew After Parsing=="+cldate);*/
			
			/*Date d = new Date();
			bean.setInsertDate(d);
			System.out.println("Current Date Is "+d);
			
			Date date1=null;
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			date1 = dateFormat.parse(o[6].toString());
			System.out.println("BookIssueDate after parsing =="+date1);
			
			Date date2=null;
			SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
			date2 = dateFormat2.parse(o[7].toString());
			System.out.println("Bookreturndate after Parsing==="+date2);
			
			long diff = d.getTime() - date2.getTime();
			
			long diffDays = diff / (24 * 60 * 60 * 1000);
			System.out.print(diffDays + " days by kishor , ");
			
			
			long Days = 7;
			long fix = 2;
			long NewTotal = diffDays * fix;
			System.out.println("New LateCharges Is ==="+NewTotal);
			if(NewTotal > 0)
			{
				System.out.println("diffDays Is Positive=="+NewTotal);
				bean.setDateDifference(NewTotal);
			}
			else if(NewTotal < 0)
			{
				System.out.println("diffDays Is Negative=="+NewTotal);
				bean.setDateDifference(0l);
			}*/
			/*if(diffDays >= +7)
			{
				
			}
			else{
				
			}*/
			
			//Currentdate = BookReturnDate - BookIssuedate;
			//long  oneDay = (long) (24*60*60*1000); // hours*minutes*seconds*milliseconds
			//Long diffDays = Math.round(Math.abs((BookReturn.getTime() - BookIssue.getTime())/(oneDay)));
			//Long diffInDays1 = (Long) ((BookReturn.getTime() - BookIssue.getTime()) / (1000 * 60 * 60 * 24));
			
			//bean.setBookIssuedate(o[6].toString());
			//bean.setBookReturnDate(o[7].toString());
			//System.out.println("BookReturneDateNew====="+BookReturneDateNew);
			
			
			/*map1.put(bean.getPkBookId(),bean);
		}
		return map1;*/
	
	}

	//adding book return
	public void addingBookReturnDetails(HttpServletRequest request,
			HttpServletResponse response) {

String NewStatus = "Y";
Long NEwQuantity =  (long) 0;
		Integer count = Integer.parseInt(request.getParameter("count"));
      System.out.println(count);
      for(int i =0 ; i<count;i++)
		{
   	   
	   	      String fkDivId = request.getParameter("fk_div_id");
	   	      String fkCatId = request.getParameter("fk_cat_id");
	   	      String studentId = request.getParameter("studentId");
	   	      
	   	    String BookissueDateReturn = request.getParameter("BookissueDateReturn");
	    	String BookReturneDateReturn = request.getParameter("BookReturneDateReturn");
	   	//String LateCharges = request.getParameter("LateCharges");
	      	String BookReturneDateNew = request.getParameter("BookReturneDateNew");
		      String bookName = request.getParameter("bookName"+i);
		      String authorName = request.getParameter("authorName"+i);
		      String publisherName = request.getParameter("publisherName"+i);
		      String supplierName = request.getParameter("supplierName"+i);
		      String quantity = request.getParameter("quantityInGrid"+i);
		      
		      String BookIssuedate = request.getParameter("BookIssuedate"+i);
		      System.out.println("hi this is Grid BookIssuedate ===="+BookIssuedate);
		      String BookReturnDate = request.getParameter("BookReturnDate"+i);
		      System.out.println("hi this is Grid BookReturnDate  ===="+BookReturnDate);
		      String LateCharges = request.getParameter("DateDifference"+i);
		      String Status = request.getParameter("Status"+i);
		      String pkBookissueId =  request.getParameter("pkBookId"+i);
		      System.out.println("hi this is Pk pkBookissueId======------------=========== "+pkBookissueId);

		      	NewStatus =String.valueOf(Status);
		      	System.out.println("Hi this is NewStatus========="+NEwQuantity);
		      	
		      	
		      
		     
		      
		      System.out.println(" hi this is Status===="+Status);
		     
		      BookReturnHibernate b = new BookReturnHibernate();
				b.setBookName(bookName);
				b.setAuthorName(authorName);
				b.setPublisherName(publisherName);
				b.setSupplierName(supplierName);
				
				b.setFkDivId(Long.parseLong(fkDivId));
				b.setFkCatId(Long.parseLong(fkCatId));
				b.setStudentId(Long.parseLong(studentId));
				b.setBookissueDateReturn(BookIssuedate);
				b.setBookReturneDateReturn(BookReturnDate);
				b.setPkBookIssueId(Long.parseLong(pkBookissueId));
				b.setLateCharges(LateCharges);
				if((NewStatus).equals(Status))
					{
						b.setStatus("Y");
					}
				else
				if(Status =="" || Status ==null || Status !=null )
		      	{
		      		b.setStatus("N");
		      	}
				
				if(NEwQuantity.equals(quantity) && (NewStatus).equals(Status) )
				{
					b.setQuantity(Long.parseLong(quantity));
					System.out.println("hi this is Quantity====---===="+quantity);
				}
				else 
				{
					b.setQuantity(Long.parseLong("0"));
				}
				
				
				Date d = new Date();
				b.setInsertDate(d);
		
		LibraryManagementDao dao = new LibraryManagementDao();
		dao.addBookReturnIntoDatabase(b);
		
		// update (minus stock from book stock)
		
		HibernateUtility hbu = HibernateUtility.getInstance();
		 Session session2 = hbu.getHibernateSession();
		 Transaction transaction = session2.beginTransaction();
		 
		LibraryManagementDao bookDao1 = new LibraryManagementDao();
		List bookList1  = bookDao1.getAllBookStockEntry3(bookName,authorName,publisherName,supplierName);
		
		
		
		System.out.println("size of data == "+bookList1.size());
		//if table is empty for strok table
		if(bookList1.size() == 0){
			/*BookIssueHibernate bookStockBean = new BookIssueHibernate();
			bookStockBean.setBookName(bookName);
			System.out.println("hi this is kishor size is zero**********"+bookList);
			//bookStockBean.setQuantity(Long.parseLong(quantity));
			bookStockBean.setSupplierName(supplierName);
			bookStockBean.setPublisherName(publisherName);
			bookStockBean.setAuthorName(authorName);
			LibraryManagementDao emptyStockdao = new LibraryManagementDao();
			emptyStockdao.addBookStok2(bookStockBean);*/
		}
		
		//if table is not empty
		else{
			for(int j=0;j<bookList1.size();j++){
				BookStockHibernate notEmptyBean =(BookStockHibernate)bookList1.get(j);
			 
			 Long pkBookStock= notEmptyBean.getPkBookStockId();
			 String pkBookStockId =String.valueOf(pkBookStock);
			 String BOOkName =notEmptyBean.getBookName(); 
			 String AutherNAme = notEmptyBean.getAuthorName();
			 String publisher_name = notEmptyBean.getPublisherName();
			 String supplier_name = notEmptyBean.getSupplierName();
			 String OLDACTIVE = notEmptyBean.getStatus();
			// String isshuDate =notEmptyBean.getBookissueDate();
			// String ReturnDate =notEmptyBean.getBookReturneDate();
			 Long auantityFromStock =notEmptyBean.getQuantity();
				//Long auantityFromStock = Long.parseLong(object[0].toString());
				//String pkBookStockId = object[2].toString();
			    Long updatequantity = (long)(auantityFromStock +  Long.parseLong(quantity));
				System.out.println("after return qunt : "+ quantity);
			 
			 //String npkBookIssueId = String.valueOf(pkbookIssueId);
			 //System.out.println("hi this si PkBookIssueId==---==="+npkBookIssueId);
			 //System.out.println(" hi this isshuDate == "+isshuDate);
				//System.out.println(" hi this publisher_name == "+ReturnDate);
			 
				/*Date date = new Date();
				 DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd ");
				 String strDate = dateFormat.format(isshuDate);
				 System.out.println(" hi this strDate strDate == "+strDate);*/
				System.out.println(" hi this author_name Stock == "+AutherNAme);
				System.out.println(" hi this publisher_name Stock == "+publisher_name);
				System.out.println(" hi this supplier_name Stock== "+supplier_name);
				System.out.println(" hi this book_name == Stock"+BOOkName);
				System.out.println(" hi this fk_student_id Stock == "+pkBookStockId);
				System.out.println(" hi this OLDACTIVE Stock == "+OLDACTIVE);
			
			 //Long PKBookIssueId = notEmptyBean.getPkBookIssueId();
			 //String OLDACTIVE = notEmptyBean.getIsStudentActive();
			 
			// System.out.println(" hi this OLDACTIVE == "+OLDACTIVE);
			
			// boolean NewSt = isStatusActive == Status;
			 
			 //Long addeduantity = quantityFromTable + Long.parseLong(quantity);
			 
       		// HibernateUtility hbu1 = HibernateUtility.getInstance();
       		 Session session = hbu.getHibernateSession();
       		 Transaction transaction2 = session.beginTransaction();
       		 
       		BookStockHibernate updateStock = (BookStockHibernate) session.get(BookStockHibernate.class, new Long(pkBookStockId));
       		//updateStock.setIsStudentActive("N");
       		
       	
       		
       	/* if(OLDACTIVE.equals(Status)  && BOOkName.equals(bookName) && isshuDate.equals(BookIssuedate) && ReturnDate.equals(BookReturnDate) && npkBookIssueId.equals(pkBookissueId))
		 {*/
       		if(OLDACTIVE.equals(Status)  && BOOkName.equals(bookName) && AutherNAme.equals(authorName) &&  publisher_name.equals(publisherName) && supplier_name.equals(supplierName))
       				{
       		updateStock.setQuantity(updatequantity);
       				}
		/* }*/
       		/*if(BOOkName.equals(bookName) && AutherNAme.equals(authorName) &&  publisher_name.equals(publisherName) && supplier_name.equals(supplierName)  && OLDACTIVE.equals(Status) && StudentID.equals(studentId) )
			{
				
				
				updateStock.setIsStudentActive("N");
				
				
			}*/
       		/*else{
       			updateStock.setIsStudentActive("Y");
       		}*/
			
       		 
       		 session.saveOrUpdate(updateStock);
       		 transaction2.commit();
			}
			 
		}
		
		/*HibernateUtility hbu = HibernateUtility.getInstance();
		 Session session = hbu.getHibernateSession();
		 Transaction transaction = session.beginTransaction();
		try
		{
		 Query query = session.createSQLQuery("SELECT quantity,book_name,pk_book_stock_id FROM book_stock WHERE book_name ='"+bookName+"' AND author_name ='"+authorName+"' AND publisher_name ='"+publisherName+"' AND supplier_name ='"+supplierName+"'");
		 List<Object[]> list = query.list();
		  for (Object[] object : list) {
			Long auantityFromStock = Long.parseLong(object[0].toString());
			String pkBookStockId = object[2].toString();
		    Long updatequantity = (long)(auantityFromStock +  Long.parseLong(quantity));
			System.out.println("after return qunt : "+ quantity);
			BookStockHibernate updateStock = (BookStockHibernate) session.get(BookStockHibernate.class, new Long(pkBookStockId));
	       
			
	        updateStock.setQuantity(updatequantity);
	 
	        session.saveOrUpdate(updateStock);
	        transaction.commit();
		  }
		}
		  catch(RuntimeException e){
				try{
					transaction.rollback();
				}catch(RuntimeException rbe)
				{
					e.printStackTrace();
				}	
			}finally{
				hbu.closeSession(session);
			}*/
		
			/* Session session1 = hbu.getHibernateSession();

			Query query=session1.createSQLQuery("SELECT quantity,book_name,pk_book_issue_id,isStudentActive,author_name,publisher_name,supplier_name,fk_student_id FROM book_issue_master WHERE book_name ='"+bookName+"' AND author_name ='"+authorName+"' AND publisher_name ='"+publisherName+"' AND supplier_name ='"+supplierName+"'");

			 List<Object[]> list1 = query.list();
			  for (Object[] object : list1) {
				///Object[] object1 = null;
				Long auantityFromStock = Long.parseLong(object[0].toString());
				System.out.println(" hi this Quantity == "+auantityFromStock);
				String book_name =  object[1].toString();
				String pk_book_issue_id = object[2].toString();
				String isStatusActive = object[3].toString();
				String author_name = object[4].toString();
				String publisher_name = object[5].toString();
				String supplier_name = object[6].toString();
				String fk_student_id = object[7].toString();
				
				System.out.println(" hi this Quantity == "+pk_book_issue_id);
				
				System.out.println(" hi this isStatusActive == "+isStatusActive);
				System.out.println(" hi this author_name == "+author_name);
				System.out.println(" hi this publisher_name == "+publisher_name);
				System.out.println(" hi this supplier_name == "+supplier_name);
				System.out.println(" hi this book_name == "+book_name);
				System.out.println(" hi this fk_student_id == "+fk_student_id);
				
				
				String StatusYes = "Y";
				String StatusNo = "N";
			
		
				
				
				
			  
				//set student active status to n to cancel admission afetr generating LC
				Transaction transaction1 = session1.beginTransaction();
				BookIssueHibernate s = (BookIssueHibernate) session1.get(BookIssueHibernate.class, new Long(pk_book_issue_id));
				//s.setIsStudentActive("N");
				//s.setIsStudentActive(StatusYes);
				//s.setIsStudentActive(StatusNo);
				if(book_name ==bookName && author_name == authorName &&  publisher_name == publisherName && supplier_name == supplierName && fk_student_id ==studentId && isStatusActive ==Status)
				{
					System.out.println("hi this boooo"+book_name);
					System.out.println("hi this boooo"+bookName);
					
					
					System.out.println("hi this boooo"+isStatusActive);
					System.out.println("hi this boooo"+bookName);
					s.setIsStudentActive(StatusNo);
					System.out.println("hi this is StatusNo=="+Status);
					
				}
				else if(isStatusActive == Status)
				{
					s.setIsStudentActive(StatusYes);
					System.out.println("hi this is StatusYes=="+StatusYes);
				}
				if(fk_student_id ==studentId && isStatusActive ==Status )
				{
					
				}
				
				session1.saveOrUpdate(s);
				transaction1.commit();
		
			  }*/
		//for stock
		LibraryManagementDao bookDao = new LibraryManagementDao();
		List bookList  = bookDao.getAllBookStockEntry2(bookName,authorName,publisherName,supplierName,studentId);
		 
	    System.out.println("size of data == "+bookList.size());
		//if table is empty for strok table
		if(bookList.size() == 0){
			/*BookIssueHibernate bookStockBean = new BookIssueHibernate();
			bookStockBean.setBookName(bookName);
			System.out.println("hi this is kishor size is zero**********"+bookList);
			//bookStockBean.setQuantity(Long.parseLong(quantity));
			bookStockBean.setSupplierName(supplierName);
			bookStockBean.setPublisherName(publisherName);
			bookStockBean.setAuthorName(authorName);
			LibraryManagementDao emptyStockdao = new LibraryManagementDao();
			emptyStockdao.addBookStok2(bookStockBean);*/
		}
		
		//if table is not empty
		else{
			for(int j=0;j<bookList.size();j++){
				BookIssueHibernate notEmptyBean =(BookIssueHibernate)bookList.get(j);
			 
			 Long StudentID= notEmptyBean.getStudentId();
			 //String StudentIDBookIssueId =Long.valueOf(StudentID);
			 String BOOkName =notEmptyBean.getBookName(); 
			 String AutherNAme = notEmptyBean.getAuthorName();
			 String publisher_name = notEmptyBean.getPublisherName();
			 String supplier_name = notEmptyBean.getSupplierName();
			 String isshuDate =notEmptyBean.getBookissueDate();
			 String ReturnDate =notEmptyBean.getBookReturneDate();
			 Long pkbookIssueId =notEmptyBean.getPkBookIssueId();
			 
			 String npkBookIssueId = String.valueOf(pkbookIssueId);
			 System.out.println("hi this si PkBookIssueId==---==="+npkBookIssueId);
			 System.out.println(" hi this isshuDate == "+isshuDate);
				System.out.println(" hi this publisher_name == "+ReturnDate);
			 
				/*Date date = new Date();
				 DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd ");
				 String strDate = dateFormat.format(isshuDate);
				 System.out.println(" hi this strDate strDate == "+strDate);*/
				System.out.println(" hi this author_name == "+AutherNAme);
				System.out.println(" hi this publisher_name == "+publisher_name);
				System.out.println(" hi this supplier_name == "+supplier_name);
				System.out.println(" hi this book_name == "+BOOkName);
				System.out.println(" hi this fk_student_id == "+StudentID);
			
			 Long PKBookIssueId = notEmptyBean.getPkBookIssueId();
			 String OLDACTIVE = notEmptyBean.getIsStudentActive();
			 
			 System.out.println(" hi this OLDACTIVE == "+OLDACTIVE);
			
			// boolean NewSt = isStatusActive == Status;
			 
			 //Long addeduantity = quantityFromTable + Long.parseLong(quantity);
			 
       		// HibernateUtility hbu1 = HibernateUtility.getInstance();
       		 Session session1 = hbu.getHibernateSession();
       		 Transaction transaction1 = session1.beginTransaction();
       		 
       		BookIssueHibernate updateStock = (BookIssueHibernate) session1.get(BookIssueHibernate.class, new Long(PKBookIssueId));
       		//updateStock.setIsStudentActive("N");
       		
       		
       	 if(OLDACTIVE.equals(Status)  && BOOkName.equals(bookName) && isshuDate.equals(BookIssuedate) && ReturnDate.equals(BookReturnDate) && npkBookIssueId.equals(pkBookissueId))
		 {
       		updateStock.setIsStudentActive("N");
		 }
       		/*if(BOOkName.equals(bookName) && AutherNAme.equals(authorName) &&  publisher_name.equals(publisherName) && supplier_name.equals(supplierName)  && OLDACTIVE.equals(Status) && StudentID.equals(studentId) )
			{
				
				
				updateStock.setIsStudentActive("N");
				
				
			}*/
       		/*else{
       			updateStock.setIsStudentActive("Y");
       		}*/
			
       		 
       		 session1.saveOrUpdate(updateStock);
       		 transaction1.commit();
			}
			 
		}  
		}
	}
	
	//Get Stock List
	public List getAllStockDetails(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, StockBean> map = new HashMap<Long, StockBean>();
		LibraryManagementDao dao = new LibraryManagementDao();
		List<StockBean> exp1List = dao.getStockList();
		
		System.out.println("IN HELPER--------------==== :  "+exp1List.size());
		return exp1List;
	}
	
	//delete Library Payment
public void deletesLibraryPaymentDetails(HttpServletRequest request, HttpServletResponse response ) {
		
		String LibraryPayId = request.getParameter("LibraryPayId");
		LibraryManagementDao dao2 = new LibraryManagementDao();
		dao2.deletLibPaymentDetails(LibraryPayId);
			
		}
	
	
}


