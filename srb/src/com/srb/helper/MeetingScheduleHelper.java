package com.srb.helper;
import com.srb.bean.MeetingScheduleBean;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

import org.hibernate.Query;
import org.hibernate.Session;

import com.srb.dao.MeetingScheduleDao;
import com.srb.dao.SubjectWiseSyllabusEntryDAO;
import com.srb.hibernate.MeetingScheduleHibernate;
import com.srb.hibernate.MeetingScheduleHibernateparents;
import com.srb.hibernate.SubjectWiseSyllabusEntryHibernate;
import com.srb.utility.HibernateUtility;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
public class MeetingScheduleHelper {

	public void scheduleMeetingAndSendMessage(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fkclassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		String message = request.getParameter("message");
		String date=request.getParameter("date");
		MeetingScheduleHibernate b = new MeetingScheduleHibernate();
		
		if(!"".equals(date)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(date);
				//det.setStoreDate(joiningDate);
				b.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   "+b.getInsertDate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
		//Date date = new Date();
		//b.setInsertDate(date);
		b.setFkclassId(Long.parseLong(fkclassId));
		b.setFkDivId(Long.parseLong(fkDivId));
		b.setMessage(message);
		
		MeetingScheduleDao dao = new MeetingScheduleDao();
		dao.addScheduleMeetings(b);
		
	
		//send message to parents
		//to add '+' in space between two wards in message to send message to message API URL
/*		String replacedMessage = message.replace(' ','+');
		
		HibernateUtility hbu=null;
		Session session=null;
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 List<String> results = new ArrayList<String>();
		 //get parent number as per class and division
		 Query query2 = session.createSQLQuery("select contact_number,first_name FROM student_master WHERE fk_class_id ='"+fkclassId+"' AND fk_division_id='"+fkDivId+"'AND student_active=:Yes");
		 query2.setParameter("Yes", "Y");
		 List<Object[]> list =query2.list();
		 
		 		for(Object[] s:list){
		 			System.out.println("size - "+list.size());
		 			System.out.println("result - "+Arrays.toString(s));
		 			String parentContactNumber = s[0].toString(); 
		 			System.out.println("hi this is parentContactNumber=="+parentContactNumber);
		 			String url1 = "http://sms.rmtechnology.in/api/smsapi.aspx?username=bsumeet22&password=bsumeet1428&to="+parentContactNumber+"&from=EKLVYA&message='"+replacedMessage+"'+Regards%2C+Venkataram+Hi+Tech+School";
					System.out.println("STARTED");
					HttpClient client = new DefaultHttpClient();
			        HttpGet req = new HttpGet(url1);
					HttpResponse  res  = null ;
					try {
						System.out.println("EXECUTING");
						res  = client.execute(req);
						System.out.println("EXECUTED");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("in catch");
					}
					if (response != null )
					{
						System.out.println("Response Code : "
				                + res.getStatusLine().getStatusCode());
						StringBuffer result = new StringBuffer();
						String line = "";
					}	
		 			
		 			
		 		}*/
		
	}
	//Sending parents message 
	public void scheduleMeetingAndSendMessageParents(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fkclassId = request.getParameter("fk_class_id");
		String fkDivId = request.getParameter("fk_division_id");
		System.out.println("fkid"+fkDivId);
		String insertDate = request.getParameter("date31");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String message = request.getParameter("message");
		
		MeetingScheduleHibernateparents b = new MeetingScheduleHibernateparents();

		if(!"".equals(insertDate)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(insertDate);
				//det.setStoreDate(joiningDate);
				b.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   "+b.getInsertDate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
		b.setFkclassId(Long.parseLong(fkclassId));
		b.setFkDivId(Long.parseLong(fkDivId));
		b.setStartTime(startTime);
		b.setEndTime(endTime);
		b.setMessage(message);
		
		MeetingScheduleDao dao = new MeetingScheduleDao();
		dao.addScheduleMeetingsParents(b);
		
	
		//send message to parents
		//to add '+' in space between two wards in message to send message to message API URL
/*		String replacedMessage = message.replace(' ','+');
		String Ys = "Y";
		HibernateUtility hbu=null;
		Session session=null;
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 List<String> results = new ArrayList<String>();


		 Query query2 = session.createSQLQuery("select contact_number,first_name FROM student_master WHERE fk_class_id ='"+fkclassId+"' AND fk_division_id='"+fkDivId+"'AND student_active='"+Ys+"'");
//		 query2.setParameter("Yes", "Y");
		 List<Object[]> list =query2.list();
		 		for(Object[] s:list){
		 			System.out.println("reslt - "+Arrays.toString(s));
		 			String parentContactNumber = s[0].toString(); 
		 			System.out.println("hi this is parentContactNumber=="+parentContactNumber);
		 			String url1 = "http://sms.rmtechnology.in/api/smsapi.aspx?username=bsumeet22&password=bsumeet1428&to="+parentContactNumber+"&from=EKLVYA&message='"+replacedMessage+"'+Regards%2C+Venkataram+Hi+Tech+School";
					System.out.println("STARTED");
					HttpClient client = new DefaultHttpClient();
			        HttpGet req = new HttpGet(url1);
					HttpResponse  res  = null ;
					try {
						System.out.println("EXECUTING");
						res  = client.execute(req);
						System.out.println("EXECUTED");
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (response != null )
					{
						System.out.println("Response Code : "
				                + res.getStatusLine().getStatusCode());
						StringBuffer result = new StringBuffer();
						String line = "";
					}	
		 			
		 			
		 		}*/
		
	}
	
	// edit parents Meeting
	public Map getParentMeetingEdit(Long fkteacherID) {

	 	System.out.println("into helper class");
	 	MeetingScheduleDao dao1 = new MeetingScheduleDao();
		List catList = dao1.getParentMeetingForEdit1(fkteacherID);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
		Object[] o = (Object[])catList.get(i);
		MeetingScheduleBean reports = new MeetingScheduleBean();
		reports.setClassName(o[0].toString());
		reports.setDivisionName(o[1].toString());
		reports.setMessage(o[2].toString());
		/*String d = o[3].toString();
		String dt[] = d.split("-");
		String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
		reports.setInsertDate(insertDate);*/
		reports.setInsertDate(o[3].toString());
		reports.setPkScheduleMeetingsId(Long.parseLong(o[4].toString()));
		reports.setFkclassId(Long.parseLong(o[5].toString()));
		reports.setFkDivId(Long.parseLong(o[6].toString()));
			map.put(reports.getPkScheduleMeetingsId(),reports);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	
	}
	public void updateParentMeetingDetail(HttpServletRequest request,
			HttpServletResponse response) {
		Session session = null;
		System.out.println("IN helper");
		String meetingId =request.getParameter("meetingId");
		String taskInTextt =request.getParameter("taskInTextt3");
		String date=request.getParameter("date5");
		System.out.println("----------------------meetingId-----------------------"+meetingId);
		System.out.println("------------------------taskInTextt------------------"+taskInTextt);
		System.out.println("----------------------date amt-----------------------"+date);
		com.srb.utility.HibernateUtility hbu=null;
		org.hibernate.Transaction transaction = null;
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Long pkScheduleMeetingsId=Long.parseLong(meetingId);
		MeetingScheduleHibernateparents det = (MeetingScheduleHibernateparents) session.load(MeetingScheduleHibernateparents.class, pkScheduleMeetingsId);
		det.setPkScheduleMeetingsId(pkScheduleMeetingsId);
		det.setMessage(taskInTextt);
		if(!"".equals(date)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(date);
				//det.setStoreDate(joiningDate);
				det.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   "+det.getInsertDate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
	
		System.out.println("updated in Parents Meeting Hibernate");
		com.srb.utility.HibernateUtility hbu2=null;
		//Session session = null;
		 session.saveOrUpdate(det);
			transaction.commit();
		
		}

	// delete Parents Meeting
public void deletesParentMeeting(HttpServletRequest request, HttpServletResponse response ) {
		
		String fieldId1 = request.getParameter("fieldId");
		MeetingScheduleDao dao2 = new MeetingScheduleDao();
		dao2.deletparentMeeting(fieldId1);
			
		}

	public void deleteScheduleMeeting(HttpServletRequest request,HttpServletResponse response)
	{
		String field2=request.getParameter("fieldId2");
		MeetingScheduleDao dao2 = new MeetingScheduleDao();
		dao2.delScheduleMeeting(field2);
	}
	//edit schedule Meeting
	
	public Map getScheduleMeetingToEdit(Long fkteacherID) {

	 	System.out.println("into helper class");
	 	MeetingScheduleDao dao1 = new MeetingScheduleDao();
		List catList = dao1.getScheduleMeetingForEdit(fkteacherID);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
			MeetingScheduleBean reports = new MeetingScheduleBean();
		reports.setClassName(o[0].toString());
		reports.setDivisionName(o[1].toString());
		reports.setMessage(o[2].toString());
		/*String d = o[3].toString();
		String dt[] = d.split("-");
		String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];*/
		reports.setInsertDate(o[3].toString());
		reports.setPkScheduleMeetingsId(Long.parseLong(o[4].toString()));
		reports.setFkclassId(Long.parseLong(o[5].toString()));
		reports.setFkDivId(Long.parseLong(o[6].toString()));
			map.put(reports.getPkScheduleMeetingsId(),reports);
		}
		System.out.println("out of helper return map : "+map);
		return map;
}

	//update schedule Meeting
	public void updatescheduleMeetingDetail(HttpServletRequest request,
			HttpServletResponse response) {
		Session session = null;
		System.out.println("IN helper");
		String meetingId =request.getParameter("meetingId2");
		String taskInTextt =request.getParameter("taskInTextt3");
		String date=request.getParameter("date3");
		System.out.println("----------------------meetingId-----------------------"+meetingId);
		System.out.println("------------------------taskInTextt------------------"+taskInTextt);
		System.out.println("----------------------date amt-----------------------"+date);
		com.srb.utility.HibernateUtility hbu=null;
		org.hibernate.Transaction transaction = null;
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Long pkScheduleMeetingsId=Long.parseLong(meetingId);
		MeetingScheduleHibernate det = (MeetingScheduleHibernate) session.load(MeetingScheduleHibernate.class, pkScheduleMeetingsId);
		det.setPkScheduleMeetingsId(pkScheduleMeetingsId);
		det.setMessage(taskInTextt);
		if(!"".equals(date)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	//		Date dateOfBirth = null;
			Date joiningDate = null;
			try{
		//		dateOfBirth = format.parse(dob);
		//		det.setDob(dateOfBirth);
				joiningDate = format.parse(date);
				//det.setStoreDate(joiningDate);
				det.setInsertDate(joiningDate);
				System.out.println("det.getJdate() -   "+det.getInsertDate());
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			}
	
		System.out.println("updated in Schedule Hibernate");
		com.srb.utility.HibernateUtility hbu2=null;
		//Session session = null;
		 session.saveOrUpdate(det);
			transaction.commit();
		
		}


	
	
	
	
}
