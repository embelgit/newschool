package com.srb.utility;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
* Servlet implementation class RetrieveImage
*/
public class RetrieveImage extends HttpServlet{/*

*//**
*
*//*
private static final long serialVersionUID = 4593558495041379082L;

public void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException{
ResultSet rs;
InputStream sImage;

			try{
			
						//String id =request.getParameter(id“Image_id”);
						Connection con = null;
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","root");
						Statement stmt=con.createStatement();
						String strSql="SELECT image from teacher_daily_task where pk_teacher_daily_task = 23;";
						//System.out.println(“inside servlet Sql–>”+strSql);
						rs=stmt.executeQuery(strSql);
						if(rs.next()) {
							byte[] bytearray = new byte[1048576];
							int size=0;
							sImage = rs.getBinaryStream(1);
							response.reset();
							response.setContentType("image/png");
								while((size=sImage.read(bytearray))!= -1 ){
								response.getOutputStream().
								write(bytearray,0,size);
								}
				}
			
			} catch (Exception e){
				e.printStackTrace();
			}
	}
*/
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

	Blob image = null;

	Connection con = null;

	byte[ ] imgData = null ;

	Statement stmt = null;

	ResultSet rs = null;

try {
	String fullName = request.getParameter("fk_teacher_id");
	String className = request.getParameter("fk_class_id1");
	String divisionName = request.getParameter("fk_division_id");
	String subjectName = request.getParameter("fk_subject_id");
	System.out.println("fullName = ="+fullName);
	System.out.println("className = ="+className);
	System.out.println("divisionName = ="+divisionName);
	System.out.println("subjectName = ="+subjectName);
	Class.forName("com.mysql.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","root");

	stmt = con.createStatement();

	rs = stmt.executeQuery("SELECT image from teacher_daily_task where pk_teacher_daily_task = 23");
	
	if (rs.next()) {
	
	image = rs.getBlob(1);
	
	imgData = image.getBytes(1,(int)image.length());
	System.out.println(imgData);
	} else {
	
	/*out.println("Display Blob Example");
	
	out.println("image not found for given id>");*/
	
	return;

}

// display the image

	response.setContentType("image/jpeg");
	
	OutputStream o = response.getOutputStream();
	
	o.write(imgData);
	
	o.flush();
	
	o.close();
	
	} catch (Exception e) {
	
	/*out.println("Unable To Display image");
	
	out.println("Image Display Error=" + e.getMessage());*/
	
	return;

} 

finally {

try {

	rs.close();
	
	stmt.close();
	
	con.close();
	
	} catch (SQLException e) {
	
	e.printStackTrace();

}

}

}
	

}