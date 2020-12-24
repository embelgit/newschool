
package com.srb.dao;



import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

//import com.srb.hibernate.ExamTimeTableHibernate;
//import com.srb.hibernate.BookIssueHibernate;
import com.srb.utility.HibernateUtility;
import com.srb.bean.BookReturnBean;

public class bookreturnDao {
public void BookReturnBean(BookReturnBean bib){
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
			System.out.println("In tacher DAO");
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		
		session.save(bib);
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

public List getbookReturnlist()
{
	
	HibernateUtility hbu=null;
	Session session=null;
	List<BookReturnBean> supList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	//Query query = session.createSQLQuery("select b.insert_date,CONCAT(s.first_name,' ',s.middle_name,' ',s.last_name) AS StudentName,b.BookReturneDate_new as ActualDate,c.class_name ,d.division_name,b.book_name from division_master d,class_master c,book_issue_master b,student_master s where c.pk_class_id =b.fk_class_id AND d.pk_division_id=b.fk_div_id  and s.pk_student_id=b.fk_student_id");

	//Query query=session.createSQLQuery("select CONCAT(s.first_name,' ',s.middle_name,' ',s.last_name) AS StudentName,b.BookReturneDate_new,c.class_name as className,d.division_name from division_master d,class_master c,book_issue_master b,student_master s where c.pk_class_id =b.fk_class_id AND d.pk_division_id=b.fk_div_id");
	Query query=session.createSQLQuery("select DISTINCT CONCAT(s.first_name,' ',s.middle_name,' ',s.last_name) AS Student_Name,b.BookReturneDate_Return,c.class_name,d.division_name from division_master d,class_master c,book_return b,student_master s where c.pk_class_id =b.fk_class_id AND d.pk_division_id=b.fk_div_id");
	List<Object[]> list = query.list();
	supList= new ArrayList<BookReturnBean>(0);

for (Object[] o : list) 
{	
	BookReturnBean b = new BookReturnBean();
	System.out.println("result :- " + Arrays.toString(o));
	
	b.setStudentName(o[0].toString());
	b.setActualDate(o[1].toString());
	b.setClassName(o[2].toString());
	b.setDivisionName(o[3].toString());
	
	System.out.println(b.getStudentName());
	System.out.println(b.getActualDate());
	System.out.println(b.getClassName());
	System.out.println(b.getDivisionName());
	
	
	supList.add(b);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return supList;
}
}
/*public void delBookDetails(String TransportId1) {
	Long pk_Book_Issue_Id = Long.parseLong(TransportId1);
	HibernateUtility hbu = null ;
	Transaction tx = null; 
	Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 tx = session.beginTransaction();
			Query query = session.createSQLQuery("DELETE FROM division_master WHERE pk_Book_Issue_Id =:pk_Book_Issue_Id");
			query.setParameter("pk_Book_Issue_Id",pk_Book_Issue_Id);
			int seletedRecords = query.executeUpdate();
			//System.out.println("Number of credit Cusr deleted = = "+seletedRecords);
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
	 }*/
	











