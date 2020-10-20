package com.srb.helper;

import java.math.BigInteger;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srb.bean.GetSupplierDetails;
import com.srb.dao.SupplierDetailsDao;
import com.srb.hibernate.SupplierDetailsBean;
import com.srb.utility.HibernateUtility;

public class SupplierDetailsHelper {

	public void supplierDetails(HttpServletRequest request,
			HttpServletResponse response)
	{

				System.out.println("In helper");
			
				String city = request.getParameter("city");
				String contactNo = request.getParameter("contactNo");
				String emailId = request.getParameter("emailId");
				String dealerName = request.getParameter("dealerName");
				String personName = request.getParameter("personName");
				String tinNo = request.getParameter("tinNo");
				String landline = request.getParameter("landline");
				String address = request.getParameter("address");
				String IdNo = request.getParameter("IdNo");
		
		
		
		
				SupplierDetailsBean sdb = new SupplierDetailsBean();
		
		
					if(!"".equals(contactNo)){
							sdb.setContactNo(Long.parseLong(contactNo));
					} else
					{
						sdb.setContactNo(Long.parseLong("00"));
					}
					

					if(!"".equals(personName)){
							sdb.setPersonName(personName);
					} else
					{
						sdb.setPersonName(personName);
					}
					

					if(!"".equals(landline)){
							sdb.setLandline(Long.parseLong(landline));
					} else
					{
						sdb.setLandline(Long.parseLong("00"));
					}
						
						
					if(!"".equals(emailId)){
							sdb.setEmailId(emailId);
					} else
					{
						sdb.setEmailId("N/A");
					}
						
						
					if(!"".equals(tinNo)){
							sdb.setTinNo((tinNo));
					} else
					{
						sdb.setTinNo("N/A");
					}
						
					
					if(!"".equals(address)){
							sdb.setAddress(address);
					} else
					{
						sdb.setAddress("N/A");
					}
					
					
				
						sdb.setPersonName(personName);
						sdb.setDealerName(dealerName);
						sdb.setCity(city);
						sdb.setIdNo(IdNo);
						
				SupplierDetailsDao sdo = new SupplierDetailsDao();
				sdo.valSupplierDetails(sdb);
	}
	
	
	
	
	
	// edit for supplier by kishor 
	public Map getSupplierDetailsForEdit(String supplierID) {
		
	 	System.out.println("into helper class");
	 	SupplierDetailsDao dao1 = new SupplierDetailsDao();
		List catList = dao1.getAllSupplierSetailsForEdit(supplierID);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			GetSupplierDetails bean = new GetSupplierDetails();
			bean.setDealerName(o[0].toString());
			bean.setCity(o[1].toString());
			bean.setContactNo((BigInteger)o[2]);
			//bean.setLandline((BigInteger)o[3]);
			bean.setPersonName(o[4].toString());
			
			bean.setAddress(o[5].toString());
			bean.setEmail(o[6].toString());
			bean.setIdNo(o[7].toString());
			
			bean.setTin(o[8].toString());
			
			map.put(bean.getDealerName(),bean);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	
		
	}
	public void editSupplierDetail(HttpServletRequest request,
			HttpServletResponse response) {
	 
		String supplierId = request.getParameter("supplierId");
		
		String dealerName = request.getParameter("dealerName");
		String personName = request.getParameter("personName");
		String contactNo = request.getParameter("contactNo");
		//String salePrice = request.getParameter("salePrice");
		String landline = request.getParameter("landline");
		String emailId = request.getParameter("emailId");
		String city = request.getParameter("city");
		
		String tinNo = request.getParameter("tinNo");
		String address = request.getParameter("address");
		
		//String IdNo = request.getParameter("IdNo");
		
		
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		long supplierID =Long.parseLong(supplierId);
		SupplierDetailsBean det = (SupplierDetailsBean) session.get(SupplierDetailsBean.class, supplierID);
		
		det.setDealerName(dealerName);
		det.setAddress(address);
		det.setContactNo(Long.parseLong(contactNo));
		det.setEmailId(emailId);
		det.setCity(city);
		det.setPersonName(personName);
		det.setLandline(Long.parseLong(landline));
		det.setTinNo(tinNo);
		//det.setIdNo(IdNo);
		
		
	    session.saveOrUpdate(det);
		transaction.commit();
		
		System.out.println("Record updated successfully.");
	
	
	
	}

public void deleteSupplier(HttpServletRequest request, HttpServletResponse response ) {
	
	String supplier = request.getParameter("supplier");
	   
	SupplierDetailsDao dao2 = new SupplierDetailsDao();
	dao2.deleteSupplier(supplier);
		
	}

	
}
