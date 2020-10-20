package com.srb.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.srb.utility.HibernateUtility;

public class TransportationInfoDao {
	// get school detail to edit
	public List getAllSchoolDetailsForEdit(Long pkschoolId) {

		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("SELECT pk_school_id,school_name,city,sanstha_name,school_reg_number,taluka,district,state,pin_code,institute_name,contact_number,school_udise_number,address FROM school_master WHERE pk_school_id ="+pkschoolId);
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
		 System.out.println("out of dao - return credit customer List : "+list);
				return list;

		}
}
