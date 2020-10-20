package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.EmployeeLeaveBean;
import com.srb.bean.ExpenditureBean;
import com.srb.bean.GetSchoolDetailBean;
import com.srb.hibernate.ExpenditureDetailsBean;
import com.srb.utility.HibernateUtility;

public class ExpenditureDetailsDao {

	public void addExpenseDetails(ExpenditureDetailsBean bean) {

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();

			System.out.println("Tx started");
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {
			try {
				transaction.rollback();
			} catch (RuntimeException rbe) {
				Log.error("Couldn't roll back tranaction", rbe);
			}
		} finally {
			hbu.closeSession(session);
		}

	}

	public List getAllExpenseName() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("from ExpenditureDetailsBean");
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}
	
	// List of Employee Leave
			public List getEmployeeLeaveList(){
				
				HibernateUtility hbu=null;
				Session session=null;
				List<EmployeeLeaveBean> empList=null;
			try{	

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				Query query=session.createSQLQuery("select  tm.first_name,tm.middle_name,tm.last_name,First_Date, Last_Date, Leave_Type, Description, ApprovedBy from teacher_leave JOIN teacher_master tm on Fk_Teacher_id = tm.pk_teacher_id");
				List<Object[]> list = query.list();
				
				System.out.println("list Size:======================= ---------   ::   "+list.size());


				empList= new ArrayList<EmployeeLeaveBean>(0);

				
			for (Object[] o : list) 
			{

				EmployeeLeaveBean reports = new EmployeeLeaveBean();

				
				reports.setFirstName(o[0].toString());
				reports.setMiddleName(o[1].toString());
				reports.setLastName(o[2].toString());
			
				String d = o[3].toString();
				String[] fromD = d.split("-");
				String fromDate = fromD[4]+"-"+fromD[3]+"-"+fromD[0];
				reports.setLeaveDateFrom(fromDate);
				
				String d2 = o[4].toString();
				String[] toD = d2.split("-");
				String toDate = toD[4]+"-"+toD[3]+"-"+toD[0];
				reports.setLeaveDateTo(toDate);
				
				reports.setType(o[5].toString());
				reports.setDescription(o[6].toString());
				reports.setApprovedBy(o[7].toString());
				
				
				empList.add(reports);
			
				
			
			
			}
			}catch(RuntimeException e){	
			
				}
				finally{
			
				hbu.closeSession(session);	
				}
				System.out.println("list Size:======================= LAST   ::   "+empList.size());
			return empList;
			}

	// get All expense Names
	public List getAllExpenseNames() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("from ExpenditureDetailsBean");
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllExpenseNames", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}
	
	public List getAllExpenditureList()
	{

		HibernateUtility hbu=null;
		Session session=null;
		List<ExpenditureBean> expList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT expense_name,insert_date FROM expenditure_details");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();


		expList= new ArrayList<ExpenditureBean>(0);

	for (Object[] o : list) 
	{	
		ExpenditureBean reports = new ExpenditureBean();
	
		reports.setExpenditureName(o[0].toString());
		reports.setDate(o[1].toString());
		
		expList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return expList;

 }
	
	
public void deleteExp(String expenseName) {
		
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("delete from expenditure_details where pk_expense_details_id="+expenseName);
				int seletedRecords = query.executeUpdate();
				System.out.println("Number of credit Cusr deleted == + ="+seletedRecords);
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
