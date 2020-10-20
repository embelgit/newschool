package com.srb.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.bean.FeeStructureReportBean;
import com.srb.bean.GetParemtsComplaintRepoprtBean;
import com.srb.hibernate.ParentsComplaintHibernate;
import com.srb.utility.HibernateUtility;

public class ParentsComplaintDao {
public void addResult(ParentsComplaintHibernate bean) {
	

		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		System.out.println("in Sonal DAo");
		session.save(bean);
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

//Student Fee Structure Reports Student Name Wise
public List<GetParemtsComplaintRepoprtBean> getParentComp() {

	HibernateUtility hbu=null;
	Session session=null;
	List<GetParemtsComplaintRepoprtBean> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT parent_name,class_name,division,first_name,middle_name,last_name,academic_year,task,insert_date FROM parents_complaints");
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<GetParemtsComplaintRepoprtBean>(0);
		
		
		for (Object[] object : list) {
			
			GetParemtsComplaintRepoprtBean s = new GetParemtsComplaintRepoprtBean();
			s.setParentName(object[0].toString());
			s.setClassName(object[1].toString());
			s.setDivision(object[2].toString());
			s.setFirstName(object[3].toString());
			s.setMiddleName(object[4].toString());
			s.setLastName(object[5].toString());
			s.setAcademicYear(object[6].toString());
			s.setTask(object[7].toString());
			s.setInsertDate(object[8].toString());
		
			
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
