package com.srb.helper;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.srb.hibernate.AdmissionEnquiryHibernate;
import com.srb.hibernate.NoticeInfoHibernate;
import com.srb.hibernate.SchoolInfoHibernate;
import com.srb.utility.HibernateUtility;
import com.srb.bean.AdmissionEnquiryBean;
import com.srb.bean.GetSchoolDetailBean;
import com.srb.dao.AdmissionEnquiryDAO;
import com.srb.dao.SchoolInfoDao;
import com.srb.dao.TeacherInfoDao;

public class AdmissionEnquiryHelper {

	public void doAdmissionEnquiryInfo(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("into helper class");
		String className = request.getParameter("className");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contactNumber = request.getParameter("contactNumber");
		String city = request.getParameter("city");
		String parentName = request.getParameter("parentName");
		String studentName = request.getParameter("studentName");
		String preSchoolN = request.getParameter("preSchoolN");
		String fkClassId = request.getParameter("fkClassId");
		String comments = request.getParameter("comments");
		String alternateContactNumber = request.getParameter("alternateContactNumber");
		
		AdmissionEnquiryHibernate b = new AdmissionEnquiryHibernate();
		b.setClassName(className);
		b.setCity(city);
		b.setContactNumber(Long.parseLong(contactNumber));
		b.setStudentName(studentName);
		b.setAddress(address);
		b.setPreSchoolN(preSchoolN);
		b.setEmail(email);
		b.setParentName(parentName);
		b.setFkClassId(Long.parseLong(fkClassId));
		b.setStatus("Y");
		b.setComments(comments);
		Date d = new Date();
		b.setInsertDate(d);
		b.setAlternateContactNumber(Long.parseLong(alternateContactNumber));
		System.out.println("comment - "+b.getComments());
		AdmissionEnquiryDAO dao = new AdmissionEnquiryDAO();
		dao.addAdmissionEnquiry(b);
	}

	//
	public void deleteaddd(HttpServletRequest request, HttpServletResponse response ) {
		
		String fkaddid = request.getParameter("fkaddid");
		System.out.println("hi this is fktechid ==  "+fkaddid);
		   
		AdmissionEnquiryDAO dao2 = new AdmissionEnquiryDAO();
		dao2.deleteaddenq(fkaddid);
			
		}
	
	//
	public Map getStudentForEdit(Long stuId) {

	 	System.out.println("into helper class");
	 	AdmissionEnquiryDAO dao1 = new AdmissionEnquiryDAO();
		List catList = dao1.getAllStudentForEdit(stuId);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			AdmissionEnquiryHibernate b = new AdmissionEnquiryHibernate();
			System.out.println("result - "+Arrays.toString(o));
			b.setPkAdmissionEnquiryId(Long.parseLong(o[0].toString()));
			b.setFkClassId(Long.parseLong(o[1].toString()));
			b.setClassName(o[2].toString());
			b.setStudentName(o[3].toString());
			b.setParentName(o[4].toString());
			b.setEmail(o[5].toString());
			b.setContactNumber(Long.parseLong(o[6].toString()));
			b.setAddress(o[7].toString());
			b.setPreSchoolN(o[8].toString());
			b.setCity(o[9].toString());
			b.setComments(o[10].toString());
			map.put(b.getPkAdmissionEnquiryId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	}
	public Map getnoticeForEdit(String classname,String divname) {

	 	System.out.println("into helper class");
	 	AdmissionEnquiryDAO dao1 = new AdmissionEnquiryDAO();
		List catList = dao1.getAllnoticeForEdit(classname,divname);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			NoticeInfoHibernate b = new NoticeInfoHibernate();
			System.out.println("result - "+Arrays.toString(o));
			b.setPkNoticeId(Long.parseLong(o[0].toString()));
			b.setNoticeDate((Date)o[1]);
			b.setTask(o[2].toString());
			map.put(b.getPkNoticeId(),b);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	}
	//
	
	
	public void updatestuInfoDetail(HttpServletRequest request,
			HttpServletResponse response) {

		String className = request.getParameter("className");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contactNumber = request.getParameter("contactNumber");
		String city = request.getParameter("city");
		String parentName = request.getParameter("parentName");
		String studentName = request.getParameter("studentName");
		String preSchoolN = request.getParameter("preSchoolN");
		String fkClassId = request.getParameter("fkClassId");
		String comments = request.getParameter("comments");
		String pkid = request.getParameter("pkid");
//		AdmissionEnquiryHibernate b = new AdmissionEnquiryHibernate();
		
		
		System.out.println("pkid - "+pkid+" clssid - "+fkClassId);
		com.srb.utility.HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		long pkid1 =Long.parseLong(pkid);
		
		AdmissionEnquiryHibernate b = (AdmissionEnquiryHibernate) session.load(AdmissionEnquiryHibernate.class, pkid1);
		
		b.setClassName(className);
		b.setCity(city);
		b.setContactNumber(Long.parseLong(contactNumber));
		b.setStudentName(studentName);
		b.setAddress(address);
		b.setPreSchoolN(preSchoolN);
		b.setEmail(email);
		b.setParentName(parentName);
		b.setFkClassId(Long.parseLong(fkClassId));
//		b.setStatus("Y");
		b.setComments(comments);
		Date d = new Date();
		b.setInsertDate(d);
		
	    session.saveOrUpdate(b);
		transaction.commit();
		
	}
	
}
