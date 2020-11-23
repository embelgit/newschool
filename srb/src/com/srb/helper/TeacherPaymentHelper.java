package com.srb.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.dao.TeacherPaymentDao;
import com.srb.hibernate.LibraryPaymentBean;
import com.srb.hibernate.TeacherPaymentBeanHibernate;
import com.srb.hibernate.TrasnportDetailsHibernate;
import com.srb.bean.TeacherPaymentDetailBean;
import java.util.Date;

public class TeacherPaymentHelper {
	public void regTeacherPayment(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN helper");
		
		Long Txid = 0l;

		TeacherPaymentDao dao3 = new TeacherPaymentDao();
		List listtxid = dao3.getTeacherPaymentTxid();

		if (listtxid.size() <= 0) {
			Txid = 1l;
		} else {
			for (int i = 0; i < listtxid.size(); i++) {

				TeacherPaymentBeanHibernate bean = (TeacherPaymentBeanHibernate) listtxid.get(i);
				Txid = bean.getTxid();
				Txid++;
			}
		}
		
		String teacherName = request.getParameter("teacherName");		
		
		String fkTeacherId = request.getParameter("fkteacherid");
		System.out.println("hi tjis is sonal ++++"+fkTeacherId);
		
		String empPay = request.getParameter("empPay");
		
		String personName = request.getParameter("personName");

		String reason = request.getParameter("reason");

		String paymentMode = request.getParameter("paymentMode");

		String chequeNum = request.getParameter("chequeNum");

		String cardNum = request.getParameter("cardNum");

		String accNum = request.getParameter("accNum");

		String bankName = request.getParameter("bankName");

		String nameOnCheck = request.getParameter("nameOnCheck");

		String paymentType = request.getParameter("paymentType");
		
		String TotalAmount = request.getParameter("totalAmounte");
		
		String BalancePayment = request.getParameter("balanceAmounte");

		TeacherPaymentBeanHibernate bean = new TeacherPaymentBeanHibernate();
		
		
		Double Finalpayment = Double.parseDouble(BalancePayment) - Double.parseDouble(empPay);
		
		System.out.println("Finalpayment == "+Finalpayment);

		bean.setTeacherName(teacherName);
		bean.setFkTeacherId(Long.parseLong(fkTeacherId));
		bean.setTxid(Txid);
		bean.setPaymentType(paymentType);
		bean.setCredit(Double.parseDouble(empPay));
		bean.setTotalAmounte(Double.parseDouble(TotalAmount));
		bean.setBalanceAmounte((Finalpayment));

		if (!"".equals(personName)) {
			bean.setPersonName(personName);
		} else {
			bean.setPersonName("N/A");
		}
		bean.setReason(reason);
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));

		bean.setInsertDate(dateobj);

		// payment details
		if (paymentMode == null) {
			bean.setPaymentMode("N/A");
		} else {
			bean.setPaymentMode(paymentMode);
		}
		if (paymentMode.equals("cheque")) {
			if (!"".equals(chequeNum))
			 {
				bean.setChequeNum(chequeNum);
				
			} else {
				bean.setChequeNum("N/A");
				
			}
			if (!"".equals(nameOnCheck))
			{
				bean.setNameOnCheck(nameOnCheck);
				
			} else {
				
				bean.setNameOnCheck("N/A");
			}
		} else if(paymentMode.equals("card")) {

			int cardNumLength = cardNum.length();
			if (cardNumLength > 0 && !"".equals(cardNum)) {

				bean.setCardNum(Long.parseLong(cardNum));
			} else {
				bean.setCardNum(Long.parseLong("00"));
			}
		}

		else if (paymentMode.equals("neft")) {
			if(bankName == null) {
				bean.setBankName("N/A");
			} else {
				bean.setBankName(bankName);
			}

			int accNumLength = accNum.length();
			if (accNumLength > 0) {
				bean.setAccNum(Long.parseLong(accNum));

			} else {
				bean.setAccNum(Long.parseLong("00"));
			}
		}
		else
		{
			bean.setBankName("N/A");
			bean.setCardNum(Long.parseLong("00"));
			bean.setNameOnCheck("N/A");
			bean.setChequeNum("N/A");
			bean.setAccNum(Long.parseLong("00"));
		}
		
		TeacherPaymentDao dao = new TeacherPaymentDao();
		dao.regTeacherPayment(bean);

	}

	/*public List getEmployeePaymentDetailsForSingleDate(HttpServletRequest request, HttpServletResponse response) {

		String fDate = request.getParameter("fDate");
		System.out.println(fDate + "Single Date");

		Map<Long, TeacherPaymentDetailBean> map = new HashMap<Long, TeacherPaymentDetailBean>();

		TeacherPaymentDao dao = new TeacherPaymentDao();
		List<TeacherPaymentDetailBean> empList = dao.getempPaymentDetailsForSingleDate(fDate);

		return empList;
	}*/

	public List getTeacherPaymentByTwoDate(HttpServletRequest request, HttpServletResponse response) {

		String fDate = request.getParameter("fisDate");
		String tDate = request.getParameter("endDate");
		String teacherName = request.getParameter("teacherName");

		Map<Long, TeacherPaymentDetailBean> map = new HashMap<Long, TeacherPaymentDetailBean>();

		TeacherPaymentDao dao = new TeacherPaymentDao();
		List<TeacherPaymentDetailBean> emp1List = dao.getTeacherPaymentDetailsDateWise(fDate, tDate, teacherName);

		return emp1List;

	}
	//
	public List getTransportTwoDate(HttpServletRequest request, HttpServletResponse response) {

		String fDate = request.getParameter("fisDate");
		String tDate = request.getParameter("endDate");
//		String teacherName = request.getParameter("teacherName");

		Map<Long, TrasnportDetailsHibernate> map = new HashMap<Long, TrasnportDetailsHibernate>();

		TeacherPaymentDao dao = new TeacherPaymentDao();
		List<TrasnportDetailsHibernate> emp1List = dao.getTransportDateWise(fDate, tDate);

		return emp1List;

	}
//
	public List getlibraryTwoDate(HttpServletRequest request, HttpServletResponse response) {

		String fDate = request.getParameter("fisDate");
		String tDate = request.getParameter("endDate");
//		String teacherName = request.getParameter("teacherName");

		Map<Long, LibraryPaymentBean> map = new HashMap<Long, LibraryPaymentBean>();

		TeacherPaymentDao dao = new TeacherPaymentDao();
		List<LibraryPaymentBean> emp1List = dao.getlibraryreportDateWise(fDate, tDate);

		return emp1List;

	}
	
	//Delete Teacher Payment
public void deletesTeacherPaymentDetails(HttpServletRequest request, HttpServletResponse response ) {
		
		String teacherPayId = request.getParameter("teacherPayId");
		TeacherPaymentDao dao2 = new TeacherPaymentDao();
		dao2.deletTeacherPaymentList(teacherPayId);
			
		}

	
	
}



