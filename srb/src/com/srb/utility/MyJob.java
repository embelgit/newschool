package com.srb.utility;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.slf4j.LoggerFactory;

import com.srb.quartz.AutoDatabaseBackupJob;

public class MyJob{
	
	File backup = null;
	 public void execute() {
	    try { 

//	    	String to="kishorbiradar02@gmail.com";
//	    	String to1="mirasge124@gmail.com";
	    	String to="bhanage.prasad@gmail.com";
			//for fertlizer
	
			//for database backup
			try{
			AutoDatabaseBackupJob data = new AutoDatabaseBackupJob();
			backup = data.mailDatabaseBackup();
			
			}
			catch(IOException e){
				e.printStackTrace();
			}
		    
		    try{
		    	com.srb.quartz.Mailer.sendFile(to,backup);
//		    	com.srb.quartz.Mailer.sendFile(to1,backup);
		    	System.out.println("sent to mail id - "+to);
		    }
		    catch(Exception e){
		    	e.printStackTrace();
		    	
		    }
		    System.out.println("mail sent...");
			
	    } catch (Exception ex) {
	      LoggerFactory.getLogger(getClass()).error(ex.getMessage());
	    }
	  }
}

	/*public void execute(HttpServletRequest request, HttpServletResponse response) {


		HibernateUtility hbu=null;
		Session session=null;
		List l = null;
		System.out.println("in CopyAttendanceTableFromESSLDBToSchoolDB");
		try
		{
			
			Connection conn = null;
			int rowInserted ;
			String downloadDate;
			String deviceId;
			String userId;
			String logDate;
			String direction;
			String alternateDirection;
			String alternateAttDirection;
			String statusCode;
			String workCode;
			String duration;
			String smsFlag;
			String isApproved;
			String remark;
			String verificationMode;
			String logRecordLocation;
			String managerRemark;
			String attMarkAndroidIMEINo;
			String lattitude;
			String longitude;
			String pkDeviceLogId;
			int tempPkDeviceLogId =0;
			
			HibernateUtility hbu1=null;
			Session session1=null;
			 hbu1 = HibernateUtility.getInstance();
			 session1 = hbu1.getHibernateSession();
			 List<String> results = new ArrayList<String>();
			 Query query2 = session1.createSQLQuery("select pkDeviceLogId,DownloadDate from student_attendance_device_log ORDER BY pk_student_attendance_device_log_id DESC LIMIT 1" );
			 List<Object[]> list =query2.list();
			 int listSize = list.size();
			 if(listSize==0){
				 tempPkDeviceLogId=0;
			 }
			 else{
			 		for(Object[] s:list){
			 			 tempPkDeviceLogId=0;
			 			String DeviceLogId = s[0].toString();
			 			System.out.println("DeviceLogId ====="+DeviceLogId);
			 			tempPkDeviceLogId = Integer.parseInt(DeviceLogId);
			 			System.out.println("tempPkDeviceLogId ====="+tempPkDeviceLogId);
			 		}
			 }
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=school", "sql123", "sql12345");
			Statement stmt = conn.createStatement();
			Date todayDate =new Date();
			SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-M-dd");
			String  strDate = formatter.format(todayDate);
			System.out.println("Date Format with yyyy-M-dd hh : "+strDate);
			String []todaydate= strDate.split("-");
			String year=todaydate[0];
			String month=todaydate[1];
			String date=todaydate[2];
			System.out.println("year : "+year);
			System.out.println("month : "+month);
			System.out.println("Date: "+date);
			//ResultSet rs = stmt.executeQuery("select [DeviceLogId],[DownloadDate],[DeviceId],[UserId],[LogDate],[Direction],[AttDirection],[AlternateAttDirection],[StatusCode],[WorkCode],[Duration],[Remarks],[SMSFlag],[VerificationMode],[IsApproved],[LogRecordLocation],[ManagerRemarks],[AttMarkAndroidIMEINo],[Lattitude],[Longitude] from eSSLSmartOffice.dbo.DeviceLogs_11_2017 WHERE (DATEPART(yy, DownloadDate) ="+year+" AND DATEPART(mm, DownloadDate) ="+month+" AND DATEPART(dd, DownloadDate) ="+date+")");
			ResultSet rs = stmt.executeQuery("select [DeviceLogId],[DownloadDate],[DeviceId],[UserId],[LogDate],[Direction],[AttDirection],[AlternateAttDirection],[StatusCode],[WorkCode],[Duration],[Remarks],[SMSFlag],[VerificationMode],[IsApproved],[LogRecordLocation],[ManagerRemarks],[AttMarkAndroidIMEINo],[Lattitude],[Longitude] from eSSLSmartOffice.dbo.DeviceLogs_11_2017 WHERE DeviceLogId>"+tempPkDeviceLogId);
			while(rs.next()){
				pkDeviceLogId = rs.getString("DeviceLogId");
				downloadDate = rs.getString("DownloadDate");
				deviceId = rs.getString("DeviceId");
				userId = rs.getString("UserId");
				logDate = rs.getString("LogDate");
				direction = rs.getString("Direction");
				alternateDirection = rs.getString("AttDirection");
				alternateAttDirection = rs.getString("AlternateAttDirection");
				statusCode = rs.getString("StatusCode");
				workCode = rs.getString("WorkCode");
				duration = rs.getString("Duration");
				remark = rs.getString("Remarks");
				smsFlag = rs.getString("SMSFlag");
				verificationMode = rs.getString("VerificationMode");
				isApproved = rs.getString("IsApproved");
				logRecordLocation = rs.getString("LogRecordLocation");
				managerRemark = rs.getString("ManagerRemarks");
				attMarkAndroidIMEINo = rs.getString("AttMarkAndroidIMEINo");
				lattitude = rs.getString("Lattitude");
				longitude = rs.getString("Longitude");
				System.out.println("logDate = ="+logDate);
				
				StudentAttendanceDeviceLogHibernate bean = new StudentAttendanceDeviceLogHibernate();
				bean.setPkDeviceLogId(pkDeviceLogId);
				bean.setDownloadDate(downloadDate);
				bean.setDeviceId(deviceId);
				bean.setUserId(userId);
				bean.setLogDate(logDate);
				bean.setDirection(direction);
				bean.setAlternateAttDirection(alternateAttDirection);
				bean.setAlternateDirection(alternateDirection);
				bean.setStatusCode(statusCode);
				bean.setWorkCode(workCode);
				bean.setDuration(duration);
				bean.setRemark(managerRemark);
				bean.setSmsFlag(smsFlag);
				bean.setVerificationMode(verificationMode);
				bean.setIsApproved(isApproved);
				bean.setLogRecordLocation(logRecordLocation);
				bean.setManagerRemark(managerRemark);
				bean.setAttMarkAndroidIMEINo(attMarkAndroidIMEINo);
				bean.setLattitude(lattitude);
				bean.setLongitude(longitude);
				Date d =new Date();
				bean.setInsertDate(d);
				StudentAttendanceDeviceLogDao dao = new StudentAttendanceDeviceLogDao();
				dao.addstudentAttendanceLog(bean);
	
			}
		}
 	 catch (Exception ex) {
 		 LoggerFactory.getLogger(getClass()).error(ex.getMessage());
 		 System.out.println("++++++++++++++++     Error in myJob +++++++++++++++++++++++++++++++");
 	 }
		
	}

}*/


//using CRON expression
/*public class MyJob implements Job {
	File backup = null;
	 @Override
	  public void execute(JobExecutionContext context) throws JobExecutionException {
	try {

			HibernateUtility hbu=null;
			Session session=null;
			List l = null;
			System.out.println("in CopyAttendanceTableFromESSLDBToSchoolDB");
			try
			{
				
				Connection conn = null;
				int rowInserted ;
				String downloadDate;
				String deviceId;
				String userId;
				String logDate;
				String direction;
				String alternateDirection;
				String alternateAttDirection;
				String statusCode;
				String workCode;
				String duration;
				String smsFlag;
				String isApproved;
				String remark;
				String verificationMode;
				String logRecordLocation;
				String managerRemark;
				String attMarkAndroidIMEINo;
				String lattitude;
				String longitude;
			
				
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=school", "sql123", "sql12345");
				Statement stmt = conn.createStatement();
				Date todayDate =new Date();
				SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-M-dd");
				String  strDate = formatter.format(todayDate);
				System.out.println("Date Format with yyyy-M-dd hh : "+strDate);
				String []todaydate= strDate.split("-");
				String year=todaydate[0];
				String month=todaydate[1];
				String date=todaydate[2];
				System.out.println("year : "+year);
				System.out.println("month : "+month);
				System.out.println("Date: "+date);
				ResultSet rs = stmt.executeQuery("select [DownloadDate],[DeviceId],[UserId],[LogDate],[Direction],[AttDirection],[AlternateAttDirection],[StatusCode],[WorkCode],[Duration],[Remarks],[SMSFlag],[VerificationMode],[IsApproved],[LogRecordLocation],[ManagerRemarks],[AttMarkAndroidIMEINo],[Lattitude],[Longitude] from eSSLSmartOffice.dbo.DeviceLogs_11_2017 WHERE (DATEPART(yy, DownloadDate) ="+year+" AND DATEPART(mm, DownloadDate) ="+month+" AND DATEPART(dd, DownloadDate) ="+date+")");
				while(rs.next()){
					downloadDate = rs.getString("DownloadDate");
					deviceId = rs.getString("DeviceId");
					userId = rs.getString("UserId");
					logDate = rs.getString("LogDate");
					direction = rs.getString("Direction");
					alternateDirection = rs.getString("AttDirection");
					alternateAttDirection = rs.getString("AlternateAttDirection");
					statusCode = rs.getString("StatusCode");
					workCode = rs.getString("WorkCode");
					duration = rs.getString("Duration");
					remark = rs.getString("Remarks");
					smsFlag = rs.getString("SMSFlag");
					verificationMode = rs.getString("VerificationMode");
					isApproved = rs.getString("IsApproved");
					logRecordLocation = rs.getString("LogRecordLocation");
					managerRemark = rs.getString("ManagerRemarks");
					attMarkAndroidIMEINo = rs.getString("AttMarkAndroidIMEINo");
					lattitude = rs.getString("Lattitude");
					longitude = rs.getString("Longitude");
					System.out.println("logDate = ="+logDate);
					
					StudentAttendanceDeviceLogHibernate bean = new StudentAttendanceDeviceLogHibernate();
					bean.setDownloadDate(downloadDate);
					bean.setDeviceId(deviceId);
					bean.setUserId(userId);
					bean.setLogDate(logDate);
					bean.setDirection(direction);
					bean.setAlternateAttDirection(alternateAttDirection);
					bean.setAlternateDirection(alternateDirection);
					bean.setStatusCode(statusCode);
					bean.setWorkCode(workCode);
					bean.setDuration(duration);
					bean.setRemark(managerRemark);
					bean.setSmsFlag(smsFlag);
					bean.setVerificationMode(verificationMode);
					bean.setIsApproved(isApproved);
					bean.setLogRecordLocation(logRecordLocation);
					bean.setManagerRemark(managerRemark);
					bean.setAttMarkAndroidIMEINo(attMarkAndroidIMEINo);
					bean.setLattitude(lattitude);
					bean.setLongitude(longitude);
					Date d =new Date();
					bean.setInsertDate(d);
					StudentAttendanceDeviceLogDao dao = new StudentAttendanceDeviceLogDao();
					dao.addstudentAttendanceLog(bean);
		
				}
			
		}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			
	 	} catch (Exception ex) {
	 		
	      LoggerFactory.getLogger(getClass()).error(ex.getMessage());
	      System.out.println("++++++++++++++++     Error in myJob +++++++++++++++++++++++++++++++");
	    }
	  }
}
*/