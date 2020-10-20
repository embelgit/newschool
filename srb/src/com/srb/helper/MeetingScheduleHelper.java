package com.srb.helper;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		MeetingScheduleHibernate b = new MeetingScheduleHibernate();

		Date date = new Date();
		b.setInsertDate(date);
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
		String message = request.getParameter("message");
		
		MeetingScheduleHibernateparents b = new MeetingScheduleHibernateparents();

		Date date = new Date();
		b.setInsertDate(date);
		b.setFkclassId(Long.parseLong(fkclassId));
		b.setFkDivId(Long.parseLong(fkDivId));
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

}
