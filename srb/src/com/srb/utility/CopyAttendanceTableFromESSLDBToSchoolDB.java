package com.srb.utility;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.srb.bean.GetResultDetailBean;

public class CopyAttendanceTableFromESSLDBToSchoolDB implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {

		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("in CopyAttendanceTableFromESSLDBToSchoolDB");
		List<GetResultDetailBean> saleList=null;
		try
		{
			System.out.println("in try of CopyAttendanceTableFromESSLDBToSchoolDB");
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("insert into school.dbo.student_attendance_device_log([DownloadDate],[DeviceId],[UserId],[LogDate],[Direction],[AttDirection],[AlternateAttDirection],[StatusCode],[WorkCode],[Duration],[Remarks],[SMSFlag],[VerificationMode],[IsApproved],[LogRecordLocation],[ManagerRemarks],[AttMarkAndroidIMEINo],[Lattitude],[Longitude])select   [DownloadDate],[DeviceId],[UserId],[LogDate],[Direction],[AttDirection],[AlternateAttDirection],[StatusCode],[WorkCode],[Duration],[Remarks],[SMSFlag],[VerificationMode],[IsApproved],[LogRecordLocation],[ManagerRemarks],[AttMarkAndroidIMEINo],[Lattitude],[Longitude] from eSSLSmartOffice.dbo.DeviceLogs_11_2017;");
			int noOfRowInserted = query.executeUpdate();
			System.out.println("Number of row inserted in student attendance log table = = ="+noOfRowInserted);
		
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		



	
	
	
		
	}

	
}
