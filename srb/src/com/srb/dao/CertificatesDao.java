package com.srb.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.CertificateBean;
import com.srb.bean.StudentInformationForReport;
import com.srb.hibernate.BonafideCertificateHibernate;
import com.srb.hibernate.LeavingCertificateHibernate;
import com.srb.hibernate.nirgumCertificateHibernate;
import com.srb.utility.HibernateUtility;

public class CertificatesDao {
//LC adding
	public void addLCDetails(LeavingCertificateHibernate b) {

		
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
		}finally{
		hbu.closeSession(session);
		}
	
		
	}
//nirgum
public void addnirgumDetails(nirgumCertificateHibernate b) {

		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		System.out.println("in dao storing b4 storing obj nirgum  ");
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
		}finally{
		hbu.closeSession(session);
		}
	
		
	}
	
	
	
//bonafied adding
	public void addBonafideDetails(BonafideCertificateHibernate b) {
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
		}finally{
		hbu.closeSession(session);
		}
	}

	//report for lc
	public List<CertificateBean> getLCGeneratedStudentInformationAsPerClassNdDiv(
			String fkClassId, String fkDivId) {
		HibernateUtility hbu=null;
		Session session=null;
		List<CertificateBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,l.date_of_leaving,l.insert_date FROM leaving_certificate l LEFT JOIN student_master s ON l.fk_student_id = s.pk_student_id WHERE l.fk_class_id ="+fkClassId+" AND l.fk_div_id ="+fkDivId);
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<CertificateBean>(0);
			
			
			for (Object[] object : list) {
				
				CertificateBean s = new CertificateBean();
				s.setFirstName(object[0].toString());
				s.setMiddleName(object[1].toString());
				s.setLastName(object[2].toString());
				s.setLeavingDate(object[3].toString());
				s.setIssuedDate(object[4].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
// range wissse lc
	public List<CertificateBean> getLCGeneratedStudentInformationAsPerrangewise(String stdate, String endate) {
		HibernateUtility hbu=null;
		Session session=null;
		List<CertificateBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,l.date_of_leaving,l.insert_date FROM leaving_certificate l LEFT JOIN student_master s ON l.fk_student_id = s.pk_student_id WHERE l.insert_date BETWEEN '"+stdate+"' AND '"+endate+"'");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<CertificateBean>(0);
			
			
			for (Object[] object : list) {
				System.out.println("resilt - "+Arrays.toString(object));
				CertificateBean s = new CertificateBean();
				s.setFirstName(object[0].toString());
				s.setMiddleName(object[1].toString());
				s.setLastName(object[2].toString());
				s.setLeavingDate(object[3].toString());
				s.setIssuedDate(object[4].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
	
	
	
	
	//report bonafide
	public List<CertificateBean> getBonafideGeneratedStudentInformationAsPerClassNdDiv(
			String fkClassId, String fkDivId) {
		HibernateUtility hbu=null;
		Session session=null;
		List<CertificateBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,b.insert_date FROM bonafide_certificate b LEFT JOIN student_master s on b.fk_student_id = s.pk_student_id where b.fk_class_id ="+fkClassId+" AND b.fk_div_id ="+fkDivId);
			List<Object[]> list = query.list();
			 saleList= new ArrayList<CertificateBean>(0);
			
			for (Object[] object : list) {
				
				CertificateBean s = new CertificateBean();
				s.setFirstName(object[0].toString());
				s.setMiddleName(object[1].toString());
				s.setLastName(object[2].toString());
				//s.setLeavingDate(object[3].toString());
				s.setIssuedDate(object[3].toString());
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
	public List<CertificateBean> getnirGeneratedStudentInformationAsPerClassNdDiv(
			String fkClassId, String fkDivId) {
		HibernateUtility hbu=null;
		Session session=null;
		List<CertificateBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,b.insert_date FROM nirgum_certificate b LEFT JOIN student_master s on b.fk_student_id = s.pk_student_id where b.fk_class_id = "+fkClassId+" AND b.fk_div_id ="+fkDivId);
			List<Object[]> list = query.list();
			 saleList= new ArrayList<CertificateBean>(0);
			
			for (Object[] object : list) {
				
				CertificateBean s = new CertificateBean();
				s.setFirstName(object[0].toString());
				s.setMiddleName(object[1].toString());
				s.setLastName(object[2].toString());
				//s.setLeavingDate(object[3].toString());
				s.setIssuedDate(object[3].toString());
				saleList.add(s);
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}


// range bonafide

public List<CertificateBean> getBonafideGeneratedStudentInformationAsPerrangewise(String stdatee, String endatee) {
	HibernateUtility hbu=null;
	Session session=null;
	List<CertificateBean> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,b.insert_date FROM bonafide_certificate b LEFT JOIN student_master s on b.fk_student_id = s.pk_student_id where b.insert_date BETWEEN '"+stdatee+"' AND '"+endatee+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CertificateBean>(0);
		
		for (Object[] object : list) {
			System.out.println("result - "+Arrays.toString(object));
			CertificateBean s = new CertificateBean();
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setIssuedDate(object[3].toString());
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
public List<CertificateBean> getnirgumGeneratedStudentInformationAsPerrangewise(String stdatee, String endatee) {
	HibernateUtility hbu=null;
	Session session=null;
	List<CertificateBean> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT s.first_name,s.middle_name,s.last_name,b.insert_date FROM nirgum_certificate b LEFT JOIN student_master s on b.fk_student_id = s.pk_student_id where b.insert_date BETWEEN '"+stdatee+"' AND '"+endatee+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CertificateBean>(0);
		
		for (Object[] object : list) {
			System.out.println("result - "+Arrays.toString(object));
			CertificateBean s = new CertificateBean();
			s.setFirstName(object[0].toString());
			s.setMiddleName(object[1].toString());
			s.setLastName(object[2].toString());
			s.setIssuedDate(object[3].toString());
			saleList.add(s);
			}
		}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	
}
}