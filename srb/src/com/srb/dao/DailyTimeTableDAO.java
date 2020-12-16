package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.BookEntryDetalBean;
import com.srb.bean.GetDailyTimeTableBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.hibernate.DailyTimeTableHibernate;
import com.srb.utility.HibernateUtility;

public class DailyTimeTableDAO {

	public void dailyTimeTableDetails(DailyTimeTableHibernate cdst) {
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
	try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		 session.save(cdst);
		 transaction.commit();
	}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				rbe.printStackTrace();
			}	
		}finally{
		hbu.closeSession(session);
	}
	
		
	}
	
//  GEt All Reports For Book Reports
	public List<BookEntryDetalBean> getBookEntryDetailsReports(String fkSupplierId
			 ) {
		Double totalWithGST = 0.0;
		HibernateUtility hbu=null;
		Session session=null;
		List<BookEntryDetalBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ="+fkDivId );
			Query query = session.createSQLQuery("select pk_book_entry_id,bill_no,supplier_name,insert_date,book_name,author_name,publisher_name,buy_price,quantity,total from book_entry_master where fk_supplier_id = :fkSupplierId " );
			
			query.setParameter("fkSupplierId", fkSupplierId);
			//query.setParameter("fkDivId", fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<BookEntryDetalBean>(0);
			
			
			for (Object[] object : list) {
				
				BookEntryDetalBean s = new BookEntryDetalBean();
				String day = object[0].toString();
				/*if(day.equals("Monday")){
					s.setStartTime(object[1].toString());
					s.setEndTime(object[2].toString());
					s.setSubjetName(object[3].toString());
					s.setTeacherName(object[4].toString());
					
				}*/
				s.setPkBookEntryManagementId(Long.parseLong(object[0].toString()));
				System.out.println("hi this is kishor "+object[0].toString());
				s.setBillNo(Long.parseLong(object[1].toString()));
				s.setSupplierName(object[2].toString());
				s.setInsertDate(object[3].toString());
				s.setBookName(object[4].toString());
				s.setAuthorName(object[5].toString());
				s.setPublisherName(object[6].toString());
				s.setBuyPrice(Double.parseDouble(object[7].toString()));
				s.setQuantity(Long.parseLong(object[8].toString()));
				s.setTotal(Double.parseDouble(object[9].toString()));
				
				
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	}
	// Get Book Issue Student Details Reports getBookIssueDetailsReportsForStudents
	
	public List<GetDailyTimeTableBean> getBookIssueDetailsReportsForStudents(String fk_Student_id ) {
		System.out.println("In Dao fk_Student_id == "+fk_Student_id);
		Double totalWithGST = 0.0;
		HibernateUtility hbu=null;
		Session session=null;
		List<GetDailyTimeTableBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ="+fkDivId );
			Query query = session.createSQLQuery("Select BookissueDate_new,BookReturneDate_new,book_name,author_name,publisher_name,quantity,sm.first_name,sm.middle_name,sm.last_name from book_issue_master join student_master sm on fk_student_id = sm.pk_student_id where fk_student_id = '"+fk_Student_id+"' and isStudentActive = 'Y' " );
			
			//query.setParameter("fkClassId", fkClassId);
			//query.setParameter("fkDivId", fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetDailyTimeTableBean>(0);
			
			
			for (Object[] object : list) {
				
				GetDailyTimeTableBean s = new GetDailyTimeTableBean();
				//String day = object[0].toString();
				/*if(day.equals("Monday")){
					s.setStartTime(object[1].toString());
					s.setEndTime(object[2].toString());
					s.setSubjetName(object[3].toString());
					s.setTeacherName(object[4].toString());
					
				}*/
				s.setBookIssueDate(object[0].toString());
				System.out.println("hi this is kishor "+object[0].toString());
				s.setBookReturnDate(object[1].toString());
				s.setBookName(object[2].toString());
				s.setAutherName(object[3].toString());
				s.setPublisherName(object[4].toString());
				s.setQuantity(object[5].toString());
				s.setFirstName(object[6].toString());
				s.setMiddleName(object[7].toString());
                s.setLastName(object[8].toString());				
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	}
	// get Sudent Detils Reports for return  getBookReturnDetailsReports by Kishor 
	public List<GetDailyTimeTableBean> getBookReturnDetailsReports(String fk_Student_id ) {
		System.out.println("In Dao fk_Student_id == "+fk_Student_id);
		Double totalWithGST = 0.0;
		HibernateUtility hbu=null;
		Session session=null;
		List<GetDailyTimeTableBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ="+fkDivId );
			Query query = session.createSQLQuery("Select BookissueDate_Return,BookReturneDate_Return,book_name,author_name,publisher_name,quantity,sm.first_name,sm.middle_name,sm.last_name from book_return join student_master sm on fk_student_id = sm.pk_student_id where fk_student_id = '"+fk_Student_id+"'  " );
			
			//query.setParameter("fkClassId", fkClassId);
			//query.setParameter("fkDivId", fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetDailyTimeTableBean>(0);
			
			
			for (Object[] object : list) {
				
				GetDailyTimeTableBean s = new GetDailyTimeTableBean();
				//String day = object[0].toString();
				/*if(day.equals("Monday")){
					s.setStartTime(object[1].toString());
					s.setEndTime(object[2].toString());
					s.setSubjetName(object[3].toString());
					s.setTeacherName(object[4].toString());
					
				}*/
				s.setBookIssueDate(object[0].toString());
				System.out.println("hi this is kishor "+object[0].toString());
				s.setBookReturnDate(object[1].toString());
				s.setBookName(object[2].toString());
				s.setAutherName(object[3].toString());
				s.setPublisherName(object[4].toString());
				s.setQuantity(object[5].toString());
				s.setFirstName(object[6].toString());
				s.setMiddleName(object[7].toString());
                s.setLastName(object[8].toString());				
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	}
	
	// GEt all Employee Details Reports 
	public List<BookEntryDetalBean> getEmployeeBookEntryDetails(String fkSupplierId
			 ) {
		Double totalWithGST = 0.0;
		HibernateUtility hbu=null;
		Session session=null;
		List<BookEntryDetalBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ="+fkDivId );
			Query query = session.createSQLQuery("select pk_book_issue_id,tm.first_name,tm.middle_name,tm.last_name,BookissueDate_new,BookReturneDate_new,book_name,author_name,publisher_name,quantity  from book_issue_master join teacher_master tm where TeacherIssue_Id =:fkSupplierId and isStudentActive = 'Y' and TeacherIssue_Id = tm.pk_teacher_id " );
			
			query.setParameter("fkSupplierId", fkSupplierId);
			//query.setParameter("fkDivId", fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<BookEntryDetalBean>(0);
			
			int i = 0;
			for (Object[] object : list) {
				i++;
				BookEntryDetalBean s = new BookEntryDetalBean();
				String day = object[0].toString();
				/*if(day.equals("Monday")){
					s.setStartTime(object[1].toString());
					s.setEndTime(object[2].toString());
					s.setSubjetName(object[3].toString());
					s.setTeacherName(object[4].toString());
					
				}*/
				s.setPkBookEntryManagementId(Long.parseLong(object[0].toString()));
				System.out.println("hi this is kishor "+object[0].toString());
				s.setFirstName(object[1].toString());
				s.setMiddleName(object[2].toString());
				s.setLastName(object[3].toString());
				s.setBookIssueDate(object[4].toString());
				s.setBookRetutndate(object[5].toString());
				//s.setInsertDate(object[6].toString());
				s.setBookName(object[6].toString());
				s.setAuthorName(object[7].toString());
				s.setPublisherName(object[8].toString());
				//s.setBuyPrice(Double.parseDouble(object[7].toString()));
				s.setQuantity(Long.parseLong(object[9].toString()));
				//s.setTotal(Double.parseDouble(object[9].toString()));
				s.setSrNo(i);
				
				
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	}
	
	//get Edit Grid 
	public List getSubjectAndTeacherAndStartTimeAndEndTimeForDailyTimeTableDetailEdit(String fkSubjectId, String fkTeacherId,String fk_class_id1, String fk_division_id,String academicYear)  {

		//System.out.println("hi this is New Date Is BookReturneDateNew == "+BookReturneDateNew);
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List<DailyTimeTableHibernate> list  = null;
		String DateDifference;
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

//			Query query=session.createSQLQuery("SELECT start_time,end_time,subject_name,teacher_name,fk_subject_id,fk_teacher_id  from daily_time_table WHERE fk_class_id = '"+fk_class_id1+"' AND fk_division_id = '"+fk_division_id+"' AND academic_year = '"+academicYear+"' AND fk_subject_id = '"+fkSubjectId+"' and fk_teacher_id = '"+fkTeacherId+"'" );
				Query query=session.createSQLQuery("SELECT start_time,end_time,subject_name,teacher_name,fk_subject_id,fk_teacher_id  from daily_time_table WHERE fk_class_id = '"+fk_class_id1+"' AND fk_division_id = '"+fk_division_id+"' AND fk_subject_id = '"+fkSubjectId+"' and fk_teacher_id = '"+fkTeacherId+"'" );		 
			 //list = query.list();
			

			List<Object[]> list1 = query.list();
			list = new ArrayList<DailyTimeTableHibernate>(0);
			for (Object[] o : list1) {
				System.out.println("result grid - "+Arrays.toString(o));
				DailyTimeTableHibernate bean = new DailyTimeTableHibernate();
				bean.setStartTime(o[0].toString());
				bean.setEndTime(o[1].toString());
				bean.setSubjetName(o[2].toString());
				bean.setTeacherName(o[3].toString());
				bean.setFkSubjectId(Long.parseLong(o[4].toString()));
				bean.setFkTeacherId(Long.parseLong(o[5].toString()));
				
				
				
			
			

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
	
	// Get All Employee Book Return Details
	public List<BookEntryDetalBean> getEmployeeBookReturnDetails(String fkSupplierId
			 ) {
		Double totalWithGST = 0.0;
		HibernateUtility hbu=null;
		Session session=null;
		List<BookEntryDetalBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ="+fkDivId );
			Query query = session.createSQLQuery("select pk_book_return_id,tm.first_name,tm.middle_name,tm.last_name,BookissueDate_Return,BookReturneDate_Return,book_name,author_name,publisher_name,quantity from book_return join teacher_master tm  on TeacherIssueReturn_Id = tm.pk_teacher_id WHERE TeacherIssueReturn_Id = :fkSupplierId   " );
			
			query.setParameter("fkSupplierId", fkSupplierId);
			//query.setParameter("fkDivId", fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<BookEntryDetalBean>(0);
			
			int i = 0;
			for (Object[] object : list) {
				i++;
				
				BookEntryDetalBean s = new BookEntryDetalBean();
				String day = object[0].toString();
				/*if(day.equals("Monday")){
					s.setStartTime(object[1].toString());
					s.setEndTime(object[2].toString());
					s.setSubjetName(object[3].toString());
					s.setTeacherName(object[4].toString());
					
				}*/
				s.setPkBookEntryManagementId(Long.parseLong(object[0].toString()));
				System.out.println("hi this is kishor "+object[0].toString());
				s.setFirstName(object[1].toString());
				s.setMiddleName(object[2].toString());
				s.setLastName(object[3].toString());
				s.setBookIssueDate(object[4].toString());
				s.setBookRetutndate(object[5].toString());
				//s.setInsertDate(object[6].toString());
				s.setBookName(object[6].toString());
				s.setAuthorName(object[7].toString());
				s.setPublisherName(object[8].toString());
				//s.setBuyPrice(Double.parseDouble(object[7].toString()));
				s.setQuantity(Long.parseLong(object[9].toString()));
				//s.setTotal(Double.parseDouble(object[9].toString()));
				s.setSrNo(i);
				
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	}

	//report- daily time table
	public List<GetDailyTimeTableBean> getDailyTimeTableInfo(String fkClassId,
			String fkDivId) {
		Double totalWithGST = 0.0;
		HibernateUtility hbu=null;
		Session session=null;
		List<GetDailyTimeTableBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id ='"+fkClassId+"' AND fk_division_id ="+fkDivId );
			Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id =:fkClassId AND fk_division_id =:fkDivId ORDER BY day DESC " );
			
			query.setParameter("fkClassId", fkClassId);
			query.setParameter("fkDivId", fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetDailyTimeTableBean>(0);
			
			
			for (Object[] object : list) {
				
				GetDailyTimeTableBean s = new GetDailyTimeTableBean();
				String day = object[0].toString();
				/*if(day.equals("Monday")){
					s.setStartTime(object[1].toString());
					s.setEndTime(object[2].toString());
					s.setSubjetName(object[3].toString());
					s.setTeacherName(object[4].toString());
					
				}*/
				s.setWeekDay(object[0].toString());
				System.out.println("hi this is kishor "+object[0].toString());
				s.setStartTime(object[1].toString());
				s.setEndTime(object[2].toString());
				s.setSubjetName(object[3].toString());
				s.setTeacherName(object[4].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	



	}

	public List<GetDailyTimeTableBean> getDayWiseDailyTimeTableInfo(
			String fkClassId, String fkDivId, String day) {
		HibernateUtility hbu=null;
		Session session=null;
		List<GetDailyTimeTableBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT day,start_time,end_time,subject_name,teacher_name FROM daily_time_table WHERE fk_class_id ='"+fkClassId+"'AND day ='"+day+"' AND fk_division_id ="+fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GetDailyTimeTableBean>(0);
			
			for (Object[] object : list) {
				
				GetDailyTimeTableBean s = new GetDailyTimeTableBean();
			
				s.setWeekDay(object[0].toString());
				s.setStartTime(object[1].toString());
				s.setEndTime(object[2].toString());
				s.setSubjetName(object[3].toString());
				s.setTeacherName(object[4].toString());
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
	public List getAllclass()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from DailyTimeTableHibernate group by className");
		 list = query.list();
		}catch(Exception e){	
			System.out.println("error in getAllSchoolName");
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return list;
	}
	
	
	//
	public List getDivisionNameByClassNamedel(String classId, String className)
	{
	
		HibernateUtility hbu = null ;
		Session session = null;
		List list  = null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
//			Query query = session.createSQLQuery("SELECT d.pk_division_id, d.division_name, c.class_name FROM division_master d INNER JOIN class_master c ON pk_class_id = fk_cat_id WHERE fk_cat_id = '"+classId+"' and class_name = '"+className+"'");
			Query query = session.createSQLQuery("select fk_division_id, division_name from daily_time_table WHERE fk_class_id = '"+classId+"'");		
			list = query.list();
	
			System.out.println("----- LIST -DAO---- jsp  ::  "+list.size());
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	
		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		
		System.out.println("----- LIST --LAST--- jsp  ::  "+list.size());

		return list;
		
		
	}
	
	//
	
	public void deletediv(String fk_class_id, String division,String examid) {
		
		
		System.out.println("In delete grid data method of temp DAO tempID is --- >  "+fk_class_id);
		
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		Transaction transaction = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
				Query query = session.createSQLQuery("delete from daily_time_table where fk_class_id = '"+fk_class_id+"' AND division_name = '"+division+"'AND pk_daily_time_table_id='"+examid+"'");
				 query.executeUpdate();
				 transaction.commit();
			//	System.out.println("Number of credit Cusr deleted == + =   "+seletedRecord);
				 System.out.println("deleted from daily time table+++++++++ +++++++++++++++ +++++++++++++ ");
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
	
}
