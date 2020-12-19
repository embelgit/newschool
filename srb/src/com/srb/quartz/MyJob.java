package com.srb.quartz;
import java.io.File;
import java.io.IOException;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.LoggerFactory;

public class MyJob implements Job {
	File backup = null;
	 @Override
	  public void execute(JobExecutionContext context) throws JobExecutionException {
	    try { 
	    	System.out.println("IN MY JOB CLASS");
	    	String to="embelbackup@gmail.com";
			//for database backup
			try{
			AutoDatabaseBackupJob data = new AutoDatabaseBackupJob();
			backup = data.mailDatabaseBackup();
			
			}
			catch(IOException e){
				e.printStackTrace();
			}

		    try{
		    Mailer.sendFile(to,backup);
		  
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
