package com.srb.dao;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.srb.bean.TeacherPaymentDetailBean;
import com.srb.hibernate.LibraryPaymentBean;
import com.srb.hibernate.TeacherPaymentBeanHibernate;
import com.srb.hibernate.TrasnportDetailsHibernate;
import com.srb.utility.HibernateUtility;

public class TeacherPaymentDao {

	public void regTeacherPayment(TeacherPaymentBeanHibernate bean) {

		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {

			try {
				transaction.rollback();
			} catch (RuntimeException e2) {

				Log.error("Error in regEmpPayment", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}
	
	
	//get latest Transaction number in Employee_payment
			public List getTeacherPaymentTxid() {
				HibernateUtility hbu=null;
				Session session=null;
				List<TeacherPaymentBeanHibernate> Txidlist=null;
				try
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query = session.createSQLQuery("SELECT transaction_id ,person_name FROM teacher_payment ORDER BY transaction_id DESC LIMIT 1");

					List<Object[]> list = query.list();
					Txidlist= new ArrayList<TeacherPaymentBeanHibernate>(0);
					for (Object[] object : list) {
						
						TeacherPaymentBeanHibernate bean=new TeacherPaymentBeanHibernate();
						bean.setTxid(Long.parseLong(object[0].toString()));
						bean.setPersonName(object[1].toString());
						
						Txidlist.add(bean);	 
					}}
				catch(RuntimeException e)
				{
					Log.error("Error in getEmployeeTranactionNo()", e);	
				}finally
				{if(session!=null){
					hbu.closeSession(session);	
				}
				}
				return Txidlist;	
			}
			
			

  /*// Employee Payment for single Date
	public List<TeacherPaymentDetailBean> getempPaymentDetailsForSingleDate(String fDate) {

		HibernateUtility hbu = null;
		Session session = null;
		List<TeacherPaymentDetailBean> empPaymentList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select first_name, last_name, payment, payment_mode, insert_date, person_name,paymentType, reason FROM employee_details RIGHT JOIN employee_payment ON employee_details.pk_empoyee_id = employee_payment.fk_employee_id WHERE DATE(insert_date)=:isInsertDate");
			query.setParameter("isInsertDate", fDate);
			List<Object[]> list = query.list();

			empPaymentList = new ArrayList<TeacherPaymentDetailBean>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));

				TeacherPaymentDetailBean empreports = new TeacherPaymentDetailBean();
				empreports.setFirstName(object[0].toString());
				empreports.setLastName(object[1].toString());
				empreports.setPaymentAmount(Double.parseDouble(object[2].toString()));
				empreports.setPaymentMode(object[3].toString());
				empreports.setInsertDate((object[4].toString()));
				empreports.setAccountantName(object[5].toString());
				empreports.setPaymentType(object[6].toString());
				empreports.setReason((object[7].toString()));
				empPaymentList.add(empreports);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return empPaymentList;

	}
*/
	 //employee payment details for two dates
	public List<TeacherPaymentDetailBean> getTeacherPaymentDetailsDateWise(String fDate, String tDate, String teacherName) {

		HibernateUtility hbu = null;
		Session session = null;
		List<TeacherPaymentDetailBean> emp1List = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		 
			Query query2 = session.createSQLQuery("select tp.teacher_name, tp.payment, tp.payment_mode, tp.insert_date, tp.person_name, tp.paymentType, tp.reason, tm.designation,tp.balanceAmounte,tp.totalAmounte FROM teacher_payment tp INNER JOIN teacher_master tm ON  tp.fk_teacher_id = tm.pk_teacher_id WHERE tp.teacher_name ='"+teacherName+"' AND tp.insert_date BETWEEN '"+fDate+"' AND '"+tDate+"'");
			//query2.setParameter("teacherName", teacherName);
			List<Object[]> list = query2.list();
			System.out.println(list.size());
			emp1List = new ArrayList<TeacherPaymentDetailBean>(0);

			for (Object[] object : list)
			{

				TeacherPaymentDetailBean empreports = new TeacherPaymentDetailBean();

				System.out.println(object[0].toString()+""+object[1].toString());
				//empreports.setPkTeacherPaymentId(Long.parseLong(object[0].toString()));
				empreports.setTeacherName(object[0].toString());
				empreports.setPaymentAmount(Double.parseDouble(object[1].toString()));
				empreports.setPaymentMode(object[2].toString());
				empreports.setInsertDate((object[3].toString()));
				empreports.setAccountantName(object[4].toString());
				empreports.setPaymentType((object[5].toString()));
				empreports.setReason((object[6].toString()));
				empreports.setDesignation(object[7].toString());
				empreports.setBalanceamount(Double.parseDouble(object[8].toString()));
				empreports.setTotalamount(Double.parseDouble(object[9].toString()));
				
				emp1List.add(empreports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp1List;

	}
	//transport
	public List<TrasnportDetailsHibernate> getTransportDateWise(String fDate, String tDate) {

		HibernateUtility hbu = null;
		Session session = null;
		List<TrasnportDetailsHibernate> emp1List = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		 
			Query query2 = session.createSQLQuery("select pkTranspayment_Id,studentName,personnameT,totalAnnualFee,paidAmountT,balanceAmountT,paymentTypeT,paymentMode3,insert_date from trasnportdetails_payment WHERE insert_date BETWEEN '"+fDate+"' AND '"+tDate+"' AND transaction_id > 0 ");
			//query2.setParameter("teacherName", teacherName);
			List<Object[]> list = query2.list();
			System.out.println(list.size());
			emp1List = new ArrayList<TrasnportDetailsHibernate>(0);

			for (Object[] object : list)
			{

				TrasnportDetailsHibernate emp = new TrasnportDetailsHibernate();

				System.out.println("result - "+Arrays.toString(object));
				System.out.println(object[0].toString()+""+object[1].toString());
				emp.setPkTranspaymentId(Long.parseLong(object[0].toString()));
				emp.setStudentName(object[1].toString());
				emp.setPersonnameT(object[2].toString());
				emp.setTotalAnnualFee(Double.parseDouble(object[3].toString()));
				emp.setPaidAmountT(Double.parseDouble(object[4].toString()));
				emp.setBalanceAmountT(Double.parseDouble(object[5].toString()));
				emp.setPaymentTypeT((object[6].toString()));
				emp.setPaymentMode3(object[7].toString());
				emp.setInsertDate((Date)object[8]);
						
				emp1List.add(emp);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp1List;

	}
	
//libbray
	
	public List<LibraryPaymentBean> getlibraryreportDateWise(String fDate, String tDate) {

		HibernateUtility hbu = null;
		Session session = null;
		List<LibraryPaymentBean> emp1List = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		 
			Query query2 = session.createSQLQuery("select pk_supplier_payment_id,supplier,person_name,bill_no,total_amount,paid_amount,balance,paymentType,payment_mode,insert_date from library_payment where insert_date BETWEEN '"+fDate+"' AND '"+tDate+"' AND transaction_id > 0");
			//query2.setParameter("teacherName", teacherName);
			List<Object[]> list = query2.list();
			System.out.println(list.size());
			emp1List = new ArrayList<LibraryPaymentBean>(0);

			for (Object[] object : list)
			{

				LibraryPaymentBean emp = new LibraryPaymentBean();

//				System.out.println(object[0].toString()+""+object[1].toString());
				System.out.println("result - "+Arrays.toString(object));
				emp.setPkSupPaymentId(Long.parseLong(object[0].toString()));
				emp.setSupplier(object[1].toString());
				emp.setPersonname(object[2].toString());
				emp.setBillNo(Double.parseDouble(object[3].toString()));
				emp.setTotalAmount(Double.parseDouble(object[4].toString()));
				emp.setPaidAmount(Double.parseDouble(object[5].toString()));
				emp.setBalance(Double.parseDouble(object[6].toString()));
				emp.setPaymentType((object[7].toString()));
				emp.setPaymentMode(object[8].toString());
				emp.setInsertDate1(object[9].toString());
//				emp.setInsertDate((Date)(object[9]));
				System.out.println("set - "+emp.getPkSupPaymentId()+emp.getSupplier()+emp.getPersonname()+emp.getBillNo()+emp.getTotalAmount()+emp.getPaidAmount()+emp.getBalance()+emp.getPaymentType()+emp.getPaymentMode()+emp.getInsertDate1());
				emp1List.add(emp);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp1List;

	}
}
