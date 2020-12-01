package com.srb.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetBookDetails;
import com.srb.bean.GetLibraryManagementDetails;
import com.srb.bean.StockBean;
import com.srb.hibernate.BookIssueHibernate;
import com.srb.hibernate.BookReturnHibernate;
import com.srb.hibernate.BookStockHibernate;
import com.srb.hibernate.ClassInfoHibernate;
import com.srb.hibernate.LibraryManagementHibernate;
import com.srb.hibernate.SubjectInfoHibernate;
import com.srb.hibernate.SupplierPaymentBean;
//import com.srb.hibernate.TeacherBookIssueHibernate;
import com.srb.utility.HibernateUtility;
public class LibraryManagementDao {

	//add book detail into table
	public void addBookIntoDatabase(LibraryManagementHibernate b) {
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

	
	public List getAllMainSupplierpayment()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List<SupplierPaymentBean> list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from SupplierPaymentBean ");
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
				return list;
		
	}
	//get book stock
	public List getAllBookStockEntry() {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from BookStockHibernate");
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
	
	// get Book FOr Stock details FOr teacher getBookdetailForReturnTeacher
		public List getBookdetailForReturnTeacher(String bookNameId) {

			HibernateUtility hbu=null;
			Session session=null;
			List list=null;
			//List<GetBookDetails> list  = null;
				
				try{
				 hbu=HibernateUtility.getInstance();
				 session=hbu.getHibernateSession();

				//Query query=session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,pk_book_issue_id,quantity FROM book_issue_master WHERE pk_book_issue_id='"+bookNameId+"' AND isStudentActive ='Y'" );
				Query query=session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,pk_book_stock_id,quantity FROM book_stock WHERE pk_book_stock_id='"+bookNameId+"'  and quantity != 0 and quantity > 0" );
				 
				 list = query.list();
				
				/*List<Object[]> list1 = query.list();
				list = new ArrayList<GetBookDetails>(0);
				for (Object[] o : list1) {
					//OutwardBean poJqgrid = new OutwardBean();

					GetBookDetails bean = new GetBookDetails();
					bean.setBookName(o[0].toString());
					bean.setAuthorName(o[1].toString());
					bean.setPublisherName(o[2].toString());
					bean.setSupplierName(o[3].toString());
					bean.setPkBookId(o[4].toString());
					bean.setQuantityInGrid(1l);
					bean.setQuantity(Long.parseLong(o[5].toString()));
					System.out.println("hi this is Quantity==="+(o[5].toString()));
				

					list.add(bean);
				}*/
				System.out.println(list.size()+"in return grid dao*************");
				}catch(RuntimeException e){
					
				e.printStackTrace();
			}finally{
					if(session!=null){
						
						hbu.closeSession(session);
					}
					
				}
			
			return list;
		}
		
		
		// Employee Book Return by kishor getBookdetailForReturnForEmployeeGrid 
		public List getBookdetailForReturnForEmployeeGrid( String fk_teacher_idReturn) {

			HibernateUtility hbu=null;
			Session session=null;
			//List list=null;
			List<GetBookDetails> list  = null;
				
				try{
				 hbu=HibernateUtility.getInstance();
				 session=hbu.getHibernateSession();

				Query query=session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,pk_book_issue_id,quantity,BookissueDate_new,BookReturneDate_new   FROM book_issue_master WHERE TeacherIssue_Id='"+fk_teacher_idReturn+"' AND isStudentActive ='Y'" );
				 
				 //list = query.list();
				List<Object[]> list1 = query.list();
				list = new ArrayList<GetBookDetails>(0);
				for (Object[] o : list1) {
					
					
					
					GetBookDetails bean = new GetBookDetails();
					bean.setBookName(o[0].toString());
					bean.setAuthorName(o[1].toString());
					bean.setPublisherName(o[2].toString());
					bean.setSupplierName(o[3].toString());
					bean.setPkBookId(o[4].toString());
					bean.setQuantityInGrid(1l);
					bean.setBookIssuedate(o[6].toString());
					bean.setBookReturnDate(o[7].toString());
				
					
					
					
					
					

					list.add(bean);
				}
				
				
				 
				System.out.println(list.size()+"in return grid dao*************");
				}catch(RuntimeException e){
					
				e.printStackTrace();
			}finally{
					if(session!=null){
						
						hbu.closeSession(session);
					}
					
				}
			
			return list;
		}
		
		// get all teacher for return 
		public List getAllBookNameForDropdownForReturnTeacherBook(String studentId) {
			HibernateUtility hbu = null ;
			 Session session = null;
			 List list  = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
					//Query query = session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,quantity,pk_book_issue_id from book_issue_master WHERE fk_student_id='"+studentId+"'  ");
				 Query query = session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,quantity,pk_book_issue_id FROM book_issue_master WHERE isStudentActive='Y' and TeacherIssue_Id = '"+studentId+"' ");	
				 list = query.list();
					
			} catch (Exception e) {
				e.printStackTrace();
			}
			 finally
			 {
				 if (session!=null) {
					hbu.closeSession(session);
				}
			 }
				return list;
		
		}
	
	// get All Book Name Stock
	
	public List getAllBookStockEntry3(String bookName, String authorName, String publisherName,String supplierName) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		
		 Query query = session.createQuery("from BookStockHibernate where bookName='"+bookName+"' AND authorName='"+authorName+"' AND publisherName='"+publisherName+"' AND supplierName = '"+supplierName+"'");
		/* query.setParameter("bookName", bookName);
		 query.setParameter("authorName", authorName);
		 query.setParameter("publisherName", publisherName);*/
		 System.out.println("query ======"+query);
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
	
	// Book Name DropDown For Kishor
	public List getAllBookNameForDropdownForReturnTeacher(String studentId) {
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				//Query query = session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,quantity,pk_book_issue_id from book_issue_master WHERE fk_student_id='"+studentId+"'  ");
			 Query query = session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,quantity,pk_book_stock_id FROM book_stock  ");	
			 list = query.list();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			return list;
	
	}
	
	// get Saying Status to Y By 
	
			public List getAllBookStockEntry2(String bookName, String authorName, String publisherName,String supplierName,String studentId) {
				HibernateUtility hbu=null;
				Session session=null;
				List list=null;
				try{
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				
				 Query query = session.createQuery("from BookIssueHibernate where bookName='"+bookName+"' AND authorName='"+authorName+"' AND publisherName='"+publisherName+"' AND supplierName = '"+supplierName+"' AND studentId='"+studentId+"'");
				/* query.setParameter("bookName", bookName);
				 query.setParameter("authorName", authorName);
				 query.setParameter("publisherName", publisherName);*/
				 System.out.println("query ======"+query);
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
/*	// Get Grid Library MAnagement Data By Kishor 
	public List getgetGridForLibraryManagementNew(String bookName) {

		
		System.out.println(" hi this is kishor Item Name is-======="+bookName);
		//System.out.println(" hi this is Kishor Challan No is 000-======"+ChallanNo);
		
		HibernateUtility hbu = null ;
		Session session = null;
		List<GetLibraryManagementDetails> list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Challan No Is By Vikas"+ChallanNo);
			//System.out.println("ProDct Nam Is By Vikas"+itemName);
			//Query query = session.createSQLQuery("select p.product_name,p.buy_price,p.hsn from product_details p where p.product_name='"+itemName+"'");
			//Query query = session.createSQLQuery("SELECT  p.productname, p.rate, ifnull(hsn,0) As hsn, p.operation,p.dup_quantity,p.challan_No FROM inwand_details p WHERE p.challan_No='"+ChallanNo+"' AND p.productname='"+itemName+"' " );
			Query query = session.createSQLQuery("SELECT FROM  WHERE ='"+bookName+"' " );
			
			
			//list = query.list();
			List<Object[]> list1 = query.list();
			list = new ArrayList<GetLibraryManagementDetails>(0);
			for (Object[] o : list1) {
				GetLibraryManagementDetails poJqgrid = new GetLibraryManagementDetails();

				poJqgrid.setBookName(o[0].toString());
				poJqgrid.setBuyPrice(Double.parseDouble(o[1].toString()));
				poJqgrid.setHsn(o[2].toString());
				poJqgrid.setOperationName(o[3].toString());
				poJqgrid.setDupQuantity((o[4].toString()));
				poJqgrid.setChallanno((o[5].toString()));
				poJqgrid.setOkquantity(0d);
				poJqgrid.setRejectedquantity(0d);
				poJqgrid.setUnprocessquantity(0d);
				
				//bean.setTotalAmount((Double)o[1]);
				System.out.println("***************"+o[0]);
				//map.put(bean.getBuyPrice(),bean);

				list.add(poJqgrid);
			
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
		return list;
	}*/
	//get book stock
		public List getAllBookStockEntry1(String bookName, String authorName, String publisherName) {
			HibernateUtility hbu=null;
			Session session=null;
			List list=null;
			try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			
			 Query query = session.createQuery("from BookStockHibernate where bookName='"+bookName+"' AND authorName='"+authorName+"' AND publisherName='"+publisherName+"'");
			/* query.setParameter("bookName", bookName);
			 query.setParameter("authorName", authorName);
			 query.setParameter("publisherName", publisherName);*/
			 System.out.println("query ======"+query);
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

	//add book stock
	public void addBookStok(BookStockHibernate bookStockBean) {

		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		session.save(bookStockBean);
		transaction.commit();
		}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(Exception rbe)
			{
				rbe.printStackTrace();
			}	
		}finally{
		hbu.closeSession(session);
		}
		
	
		
	}
//get book name for dropdown
	public List getAllBookNameForDropDown() {
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,quantity,pk_book_stock_id FROM book_stock where quantity!=0");
				list = query.list();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			return list;
	}

	//book issue grid
	public List getBookdetailForIssue(String bookNameId) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

	//		Query query=session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,pk_book_stock_id,quantity FROM book_stock WHERE pk_book_stock_id='"+bookNameId+"'  and quantity > 0 and quantity !=0");
			Query query=session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,pk_book_stock_id,quantity FROM book_stock where pk_book_stock_id='"+bookNameId+"'  and quantity > 0 and quantity !=0");
			 list = query.list();
			 
			System.out.println(list.size()+"*************");
			}catch(RuntimeException e){
				
			e.printStackTrace();
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
		
		return list;


	}
//adding book issue
	public void addBookIssueIntoDatabase(BookIssueHibernate b) {
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		session.save(b);
		transaction.commit();
		System.out.println("In dao...book issue added");
		}
		catch(RuntimeException e){
			
				e.printStackTrace();
			}	
		
		finally{
		hbu.closeSession(session);
		}
	}

	//adding book return
		public void addBookReturnIntoDatabase(BookReturnHibernate b) {
			HibernateUtility hbu=null;
			Session session=null;
			Transaction transaction=null;
			try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
			session.save(b);
			transaction.commit();
			System.out.println("In dao...book issue added");
			}
			catch(RuntimeException e){
				
					e.printStackTrace();
				}	
			
			finally{
			hbu.closeSession(session);
			}
		}
	
	//book details for dropdown for return from book issue table
	public List getAllBookNameForDropDownForReturn(String studentId) {
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,quantity,pk_book_issue_id from book_issue_master WHERE fk_student_id='"+studentId+"' and isStudentActive='Y' ");
				list = query.list();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			return list;
	
	}
//get book detail in return grid from issue table
	/*public List getBookdetailForReturn(String bookNameId) {

		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,pk_book_issue_id,quantity FROM book_issue_master WHERE pk_book_issue_id="+bookNameId);
			 
			 list = query.list();
			 
			System.out.println(list.size()+"in return grid dao*************");
			}catch(RuntimeException e){
				
			e.printStackTrace();
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
		
		return list;
	}*/
	public List getBookdetailForReturn(String StudentNameId, String BookReturneDateNew) throws ParseException {

		System.out.println("hi this is New Date Is BookReturneDateNew == "+BookReturneDateNew);
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List<GetBookDetails> list  = null;
		String DateDifference;
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT book_name,author_name,publisher_name,supplier_name,pk_book_issue_id,quantity,BookissueDate_new,BookReturneDate_new,DATEDIFF( BookReturneDate_new ,BookissueDate_new) - 7, pk_book_issue_id   FROM book_issue_master WHERE fk_student_id='"+StudentNameId+"' AND isStudentActive ='Y'" );
			 
			 //list = query.list();
			

			List<Object[]> list1 = query.list();
			list = new ArrayList<GetBookDetails>(0);
			for (Object[] o : list1) {
				GetBookDetails bean = new GetBookDetails();
				bean.setBookName(o[0].toString());
				bean.setAuthorName(o[1].toString());
				bean.setPublisherName(o[2].toString());
				bean.setSupplierName(o[3].toString());
				bean.setPkBookId(o[4].toString());
				System.out.println("hi this is New Id----==="+(o[4].toString()));
				bean.setQuantityInGrid(1l);
				bean.setBookIssuedate(o[6].toString());
				bean.setBookReturnDate(o[7].toString());
				bean.setPkbookissueid(Long.parseLong(o[8].toString()));
				System.out.println("hi this is Id Is====="+(Long.parseLong(o[8].toString())));
				
				
				Date d = new Date();
				bean.setInsertDate(d);
				System.out.println("Current Date Is "+d);
				
				
				Date date3=null;
				SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy-MM-dd");
				date3 = dateFormat3.parse(BookReturneDateNew);
				System.out.println("BookReturneDateNew after parsing =="+date3);
				
				
				/*
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
					}*/
				
				
				Date date1=null;
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				date1 = dateFormat.parse(o[6].toString());
				System.out.println("BookIssueDate after parsing =="+date1);
				
				Date date2=null;
				SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
				date2 = dateFormat2.parse(o[7].toString());
				System.out.println("Bookreturndate after Parsing==="+date2);
				
				//long diff = d.getTime() - date2.getTime();
				long diff = date3.getTime() - date2.getTime();
				
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
				}
				
			

				list.add(bean);
			}
			 
			System.out.println(list.size()+"in return grid dao*************");
			}catch(RuntimeException e){
				
			e.printStackTrace();
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
		
		return list;
	}

	//get Stock List
	public List getStockList()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		List<StockBean> stockList = null;
 		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT book_name, quantity, author_name,publisher_name from book_stock");
			List<Object[]> list = query.list();
			
			System.out.println("size After Query   LIST-----------======  :  "+list.size());
			
			stockList = new ArrayList<StockBean>(0);
			
			int i=0;
			
			for(Object[] o : list)
			{
				i++;
				StockBean report = new StockBean();
				
				report.setBookName(o[0].toString());;
				report.setQuantity(Long.parseLong(o[1].toString()));
				report.setAuthorName(o[2].toString());
				report.setPublisherName(o[3].toString());
				report.setSrNo(i);

				stockList.add(report);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
 		
 		System.out.println("size LAST-----------======  :  "+stockList.size());
		
		return stockList;
		
	}
	
	//delete Library Payment List
	public void deletLibPaymentDetails(String TransportId1) {
		Long pk_supplier_payment_id = Long.parseLong(TransportId1);
		HibernateUtility hbu = null ;
		Transaction tx = null; 
		Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 tx = session.beginTransaction();
				Query query = session.createSQLQuery("DELETE FROM library_payment WHERE pk_supplier_payment_id =:pk_supplier_payment_id");
				query.setParameter("pk_supplier_payment_id",pk_supplier_payment_id);
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

}
