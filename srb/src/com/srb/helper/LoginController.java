
package com.srb.helper;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.srb.hibernate.UserDetailsBean;
import com.srb.utility.HibernateUtility;
import com.srb.utility.MyJob;



/**
 * Servlet implementation class Session
 */
public class LoginController extends HttpServlet {
	
	
	public void loginUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		System.out.println("hi this In Helper by Kishor by 123******");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String un = request.getParameter("uname");
		String pwd = request.getParameter("pass");
		HibernateUtility hbu=HibernateUtility.getInstance();
		Session session1=hbu.getHibernateSession();
		org.hibernate.Query query = session1.createQuery(" from UserDetailsBean where userName = :username AND password = :pwd ");
		query.setParameter("username", un);
		query.setParameter("pwd", pwd);
		UserDetailsBean unique = (UserDetailsBean) query.uniqueResult();
		//System.out.println();
		
	
		
		
   if(unique != null){
	   String userName = unique.getUserName();
	   String password = unique.getPassword();
	   if(un.equals(userName) && pwd.equals(password)){
		    
			
			out.print("Welcome, " + un);
			HttpSession session = request.getSession(true); // reuse existing
															// session if exist
			response.sendRedirect("/srb/JSP/index.jsp");	// or create one
			session.setAttribute("user", un);
			 // 30 seconds
			
		} 
		else {
			HttpSession session = request.getSession(true);
		    session.setAttribute("user", null);
			response.sendRedirect("/srb/JSP/login.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("/SMT/jsp/login.jsp");
			out.println("<font color=red>Either user name or password is wrong.</font>");
		
	      
	}
	}
	else{
		    HttpSession session = request.getSession(true);
		    session.setAttribute("user", null);
		    response.sendRedirect("/srb/JSP/login.jsp");
	}
		
		
		
	/*	
		
		
		
		query.setParameter("username", un);
		query.setParameter("pwd", pwd);
		UserDetailsBean unique = (UserDetailsBean) query.uniqueResult();
		//System.out.println();
		String userName = unique.getUserName();
		String password = unique.getPassword();
		System.out.println(userName+"User name in login helper");
		System.out.println(password+"password in login helper");
	
		
		
   if(unique != null){
	   
	 
		out.print("Welcome, " + un);
		HttpSession session = request.getSession(true);
		response.sendRedirect("/Fertilizer/jsp/index.jsp");
		session.setAttribute("user", un);
		HttpSession session = request.getSession(true); // reuse existing
		response.sendRedirect("/Fertilizer/jsp/index.jsp");												// or create one
		session.setAttribute("user", un);*
		 // 30 seconds
		}
	else{
		
		
		    response.sendRedirect("/Fertilizer/jsp/login.jsp");
	}*/
 }

	public void language(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String lan = request.getParameter("language");
		HttpSession session = request.getSession(true); // reuse existing
		// session if exist
											// or create one
        session.setAttribute("lan", lan);
	}
	
	public void logoutUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("thanq you!!, Your session was destroyed successfully!! ++++++++++++++++++");
		LoginController.main1();
		MyJob job = new MyJob();
		//job.execute();
		job.execute();
		HttpSession session = request.getSession(false);
		response.sendRedirect("/processSoft/jsp/login.jsp");
		session.setAttribute("user", null);
	
		
		session.removeAttribute("user");
		//session.getMaxInactiveInterval();
		// TODO Auto-generated method stub
		
	}

	private static void main1() {
		// TODO Auto-generated method stub
		LoginController bb = new LoginController();
		    Date date = new Date();
		    
	        bb.tbBackup("process_soft","root","root","C:/Users/USER/Documents/dumpbackup/process_soft.sql");
	}
	public boolean tbBackup(String dbName,String dbUserName, String dbPassword, String path) {

		String executeCmd = "";
	    executeCmd = "C:/Program Files/MySQL/MySQL Server 5.7/bin/mysqldump -u " + dbUserName + " -p" + dbPassword + " --add-drop-database -B " + "process_soft" + " -r " + path;
	    Process runtimeProcess;
	        try
	        {
	            System.out.println(executeCmd);//this out put works in mysql shell
	            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
	           // runtimeProcess = Runtime.getRuntime().exec(new String[] { "cmd.exe", "/c cd Program Files cd MySQL cd MySQL Server 5.7 cd bin", executeCmd });
	            int processComplete = runtimeProcess.waitFor();

	                if (processComplete == 0)
	                {
	                    System.out.println("Backup created successfully");
	                    return true;
	                }
	                else
	                {
	                    System.out.println("Could not create the backup");
	                }
	        } catch (Exception ex)
	        {
	            ex.printStackTrace();
	        }
	return false;
	}

	
	
}