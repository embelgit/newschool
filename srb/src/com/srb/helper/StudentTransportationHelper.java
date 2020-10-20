package com.srb.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.GetSchoolDetailBean;
import com.srb.dao.SchoolInfoDao;
import com.srb.dao.StudentTransportationDao;
import com.srb.dao.SupplierPaymentDao;
import com.srb.dao.TeacherInfoDao;
import com.srb.dao.TeacherInfoLeaveDao;
import com.srb.hibernate.SchoolInfoHibernate;
import com.srb.hibernate.SupplierPaymentBean;
import com.srb.hibernate.TeacherInfoHibernate;
import com.srb.hibernate.TeacherInfoLeaveHibernate;

import com.srb.hibernate.TrasnportDetailsHibernate;
import com.srb.hibernate.TrasnpotationSchollBus;
import com.srb.utility.HibernateUtility;


public class StudentTransportationHelper {

	
	public void TransportionDetailsOFStrudents(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In Helper TransportionDetailsOFStrudents By Kishor");
		
		String leaveDateFrom = request.getParameter("leaveDateFrom");
		System.out.println("leaveDateFrom"+leaveDateFrom);
		String DriverName = request.getParameter("DriverName");
		System.out.println(" DriverName == "+DriverName);
		String leaveDateTo = request.getParameter("leaveDateTo");
		System.out.println("leaveDateTo"+leaveDateTo);
		String ContactNo = request.getParameter("ContactNo");
		System.out.println("ContactNo"+ContactNo);
		
		String Pincode = request.getParameter("Pincode");
		System.out.println("Pincode"+Pincode);
		String payement = request.getParameter("payement");
		System.out.println("payement"+payement);
		String Address = request.getParameter("Address");
		System.out.println("Address"+Address);
		String fk_class_id1 = request.getParameter("fk_class_id1");
		System.out.println("fk_class_id1"+fk_class_id1);
		String fk_division_id = request.getParameter("fk_division_id");
		System.out.println("fk_division_id"+fk_division_id);
		String studentid = request.getParameter("studentid");
		System.out.println("studentName"+studentid);
		String studentname = request.getParameter("studentname");
		System.out.println("studentname - "+studentname);
		
		TrasnpotationSchollBus tsb = new TrasnpotationSchollBus();
		
		//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		//Date dateOf = null;
		//Date joining = null;
		/*
		 * try{ dateOf = format.parse(leaveDateFrom); tsb.setLeaveDateFrom(dateOf);
		 * joining = format.parse(leaveDateTo); tsb.setLeaveDateTo(joining); }
		 * catch(Exception e){ e.printStackTrace();
		 * System.out.println("Exception in date parsing"); }
		 */
		tsb.setDriverName(DriverName);
		tsb.setLeaveDateFrom(leaveDateFrom);
		tsb.setContactNo(Long.parseLong(ContactNo));
		tsb.setLeaveDateTo(leaveDateTo);
		tsb.setPincode(Long.parseLong(Pincode));
		tsb.setPayement(Double.parseDouble(payement));
		tsb.setAddress(Address);
		tsb.setFkclassid(Long.parseLong(fk_class_id1));
		tsb.setFkdivisionid(Long.parseLong(fk_division_id));
		tsb.setStudentid(Long.parseLong(studentid));
		tsb.setStudentName(studentname);
		StudentTransportationDao dao = new StudentTransportationDao();
		dao.TransportionDetailsOFStrudents(tsb);
	}
	
	//get school detail to edit
		public Map getTransportationForEdit(Long pkTrasnpotationSchollBusId) {

		 	System.out.println("into helper class");
		 	StudentTransportationDao dao1 = new StudentTransportationDao();
			List catList = dao1.getAllTransportationDetailsForEdit(pkTrasnpotationSchollBusId);
			
			Map  map =  new HashMap();
			for(int i=0;i<catList.size();i++)
			{
				Object[] o = (Object[])catList.get(i);
			
				TrasnpotationSchollBus b = new TrasnpotationSchollBus();
				b.setPkTrasnpotationSchollBusId(Long.parseLong(o[0].toString()));
				//b.setStudentName(o[1].toString());
				b.setDriverName(o[1].toString());
				b.setLeaveDateFrom(o[2].toString());
				b.setContactNo(Long.parseLong(o[3].toString()));
				b.setLeaveDateTo(o[4].toString());
				b.setPincode(Long.parseLong(o[5].toString()));
				b.setPayement(Double.parseDouble(o[6].toString()));
				b.setAddress(o[7].toString());
				
				map.put(b.getPkTrasnpotationSchollBusId(),b);
			}
			System.out.println("out of helper return map : "+map);
			return map;
		
		}
	
	public void TransportationDetails (HttpServletRequest request,
			HttpServletResponse response){
		
		 Long Txid2=0l;
			
		 	StudentTransportationDao dao2=new StudentTransportationDao();
			List listtxid2=dao2.getTransactionPaymentTxid();
			
			if(listtxid2.size()<=0)
			{
				Txid2=1l;
			}
			else
			{
			for (int i = 0; i < listtxid2.size(); i++) {
				
				TrasnportDetailsHibernate bean=(TrasnportDetailsHibernate) listtxid2.get(i);
			Txid2=bean.getTxid();
			Txid2++;
			}
		}
		
		String totalAnnualFee = request.getParameter("totalAnnualFee");
		String personnameT = request.getParameter("personnameT");
		String balanceAmountT = request.getParameter("balanceAmountT");
		String paymentMode3 = request.getParameter("paymentMode3");
		String paymentTypeT = request.getParameter("paymentTypeT");
		String paidAmountT = request.getParameter("paidAmountT");
		String chequeNum = request.getParameter("chequeNum");
		String nameOnCheck = request.getParameter("nameOnCheck");
		String bankName = request.getParameter("bankName");
		String cardNum = request.getParameter("cardNum");
		String accNum = request.getParameter("accNum");
		String studentName = request.getParameter("studentName");
		String fkclassId = request.getParameter("fkclassId");
		String fkdivisionId = request.getParameter("fkdivisionId");
		String NewBalanceAmount = request.getParameter("NewBalanceAmount");
		System.out.println("NewBalanceAmount=="+NewBalanceAmount);
		
		System.out.println("stude name - "+studentName);
		
		TrasnportDetailsHibernate tdh = new TrasnportDetailsHibernate();
		
		
		tdh.setTxid(Txid2);
		tdh.setTotalAnnualFee(Double.parseDouble(totalAnnualFee));
		tdh.setPersonnameT(personnameT);
		tdh.setBalanceAmountT(Double.parseDouble(NewBalanceAmount));
		tdh.setPaymentMode3(paymentMode3);
		tdh.setPaymentTypeT(paymentTypeT);
		tdh.setPaidAmountT(Double.parseDouble(paidAmountT));
		tdh.setChequeNum(chequeNum);
		tdh.setNameOnCheck(nameOnCheck);
		tdh.setBankName(bankName);
		tdh.setCardNum(cardNum);
		tdh.setAccNum(accNum);
		tdh.setStudentName(studentName);
		tdh.setFkclassId(Long.parseLong(fkclassId));
		tdh.setFkdivisionId(Long.parseLong(fkdivisionId));
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));

		tdh.setInsertDate(dateobj);
		
		StudentTransportationDao dao = new StudentTransportationDao();
		dao.TrasnportDetailsPaymantSave(tdh);
		
	}
	
	
	
	 //update transportation info
	public void updateTransportationInfoDetail(HttpServletRequest request,
			HttpServletResponse response) {

		String studentName = request.getParameter("studentName");
		System.out.println("studentName"+studentName);
		String studId = request.getParameter("studId");
		System.out.println("studId"+studId);
		String leaveDateFrom = request.getParameter("leaveDateFrom");
		System.out.println("leaveDateFrom"+leaveDateFrom);
		String DriverName = request.getParameter("DriverName");
		System.out.println(" DriverName == "+DriverName);
		String leaveDateTo = request.getParameter("leaveDateTo");
		System.out.println("leaveDateTo"+leaveDateTo);
		String ContactNo = request.getParameter("ContactNo");
		System.out.println("ContactNo"+ContactNo);
		
		String Pincode = request.getParameter("Pincode");
		System.out.println("Pincode"+Pincode);
		String payement = request.getParameter("payement");
		System.out.println("payement"+payement);
		String Address = request.getParameter("Address");
		System.out.println("Address"+Address);
		//String fk_class_id1 = request.getParameter("fk_class_id1");
		//System.out.println("fk_class_id1"+fk_class_id1);
	//	String fk_division_id = request.getParameter("fk_division_id");
	//	System.out.println("fk_division_id"+fk_division_id);
		
		
		com.srb.utility.HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		//String schoolInfoId = studentName;
		 long pkTrasnpotationSchollBusId = Long.parseLong(studId);
		
		TrasnpotationSchollBus tsb = (TrasnpotationSchollBus) session.load(TrasnpotationSchollBus.class, pkTrasnpotationSchollBusId);
		
		tsb.setStudentName(studentName);
		tsb.setDriverName(DriverName);
		tsb.setLeaveDateFrom(leaveDateFrom);
		tsb.setContactNo(Long.parseLong(ContactNo));
		tsb.setLeaveDateTo(leaveDateTo);
		tsb.setPincode(Long.parseLong(Pincode));
		tsb.setPayement(Double.parseDouble(payement));
		tsb.setAddress(Address);
		//tsb.setFkclassid(Long.parseLong(fk_class_id1));
		//tsb.setFkdivisionid(Long.parseLong(fk_division_id));
		
		
	    session.saveOrUpdate(tsb);
		transaction.commit();
		
	}
}
